import atexit
import glob
import time
from multiprocessing import Manager, Process
from os import makedirs
from os.path import basename, dirname, exists, isfile, join
from shutil import copyfile
from tempfile import TemporaryDirectory

import click
import pandas as pd
import templates as t
from builder import Infrastructure
from pyswip import Prolog
from tabulate import tabulate as tbl

TIMEOUT = 600 #seconds

# --- UTILITY FUNCTIONS ---
def get_new_prolog_instance(app, infr):
    p = Prolog()
    p.consult(t.SIM_PL_FILE)
    p.consult(app)
    p.consult(infr)
    return p


def query(p: Prolog, q: str):
    r = p.query(q)
    return t.parse_prolog(next(r)) if r else None


def df_to_file(df, file_path):
	dir = dirname(file_path)
	makedirs(dir) if not exists(dir) else None		
	df.to_csv(file_path, mode='a', header=(not isfile(file_path)))


class Result():
    def __init__(self, rid: int, type: str = 'exhaustive'):
        self.id = rid
        self.type = type
        self.placement = {}
        self.rates = {}
        self.allochw = []
        self.allocbw = []
        self.old_length = 0
        self.new_length = 0
        self.migrations = 0
        self.nonmigrations = 0
        self.changed_rates = 0
        self.unchanged_rates = 0
        self.inferences = 0
        self.time = 0

    def get_placement(self):
        p = [f"on(({s},{v}), {n})" for (s,v),n in self.placement.items()]
        return "[" + ", ".join(p) + "]"
    
    def get_rates(self):
        r = [f"(({s},{d}), {v})" for (s,d),v in self.rates.items()]
        return "[" + ", ".join(r) + "]"
    
    def get_allochw(self):
        h = [f"({n}, {hw})" for n,hw in self.allochw]
        return "[" + ", ".join(h) + "]"
    
    def get_allocbw(self):
        b = [f"(({s},{d}), {bw})" for (s,d),bw in self.allocbw]
        return "[" + ", ".join(b) + "]"
    
    def get_alloc(self):
        return f"({self.get_allochw()},{self.get_allocbw()})"
    
    def set_results(self, res):
        self.placement  = {s:n for s,n in res["NewP"]}
        self.rates      = {(s,d):v for (s,d),v in res["NewR"]}
        self.allochw    = res["NewHW"]
        self.allocbw    = res["NewBW"]
        self.old_length = int(res["OldL"])
        self.new_length = int(res["NewL"])
        self.migrations = int(res["M"])
        self.nonmigrations = int(res["NM"])
        self.changed_rates = int(res["CR"])
        self.unchanged_rates = int(res["UR"])
        self.inferences = int(res["Infs"])
        self.time       = round(float(res["Time"]), 6)

    def pretty_print(self):
        return tbl([['ID', self.id],
                    ["Inferences", self.inferences], ["Time", self.time],
                    ["Length", "{} --> {}".format(self.old_length, self.new_length)], 
                    ["(Not) Migrated", "({}) {}".format(self.nonmigrations, self.migrations)],
                    ["(Un)changed Rates", "({}) {}".format(self.unchanged_rates, self.changed_rates)],
                    ["Placement", self.get_placement()],
                    ["Rates", self.get_rates()],
                    ["AllocHW", self.get_allochw()],
                    ["AllocBW", self.get_allocbw()]],
                    headers=["Metric", "Value"])

    def __str__(self):
        return str(self.__dict__)
    
    def __repr__(self):
        return self.__str__()
            

class Experiment():
    def __init__(self, app_name: str, infr: Infrastructure, epochs: int = 600, timeout: int = TIMEOUT, variation_rate: float = 0.1,
                 commits: str = t.COMMITS_DIR):
        
        self.app = app_name
        self.infr = infr
        self.epochs = epochs
        self.timeout = timeout
        self.variation_rate = variation_rate
        self.commits = self.get_commits(commits)
        self.file = t.RESULTS_FILE.format(app=self.app, infr=self.infr.id, rate=self.variation_rate, timestamp=t.TIMESTAMP)

        self.p_exh: Process = None
        self.p_cr: Process  = None
        self.exh_results = Manager().list()
        self.cr_results  = Manager().list()
        self.exh_faults  = Manager().Value('i', 0)
        self.cr_faults   = Manager().Value('i', 0)
        self.current_commit = 0
        self.commit_change = self.epochs // len(self.commits)
        self.infr_change = round(self.epochs * 0.01)

    def get_commits(self, commits):
        return sorted(list(glob.glob(f"{commits}/commit*.pl")))
    
    def get_faults(self):
        return "Exh faults: {}\nCR Faults: {}\n".format(self.exh_faults.value, self.cr_faults.value)

    def upload(self, file=None):
        results = list(self.exh_results) + list(self.cr_results)
        file = file if file else self.file
        if results:
            results = pd.DataFrame.from_records([r.__dict__ for r in results], index="id")
            [results.pop(f) for f in ['placement', 'rates', 'allochw', 'allocbw']]
            results["size"] = self.infr._size
            results["rate"] = self.variation_rate
            df_to_file(results, file)
        else:
            print("No results to upload.")

    def terminate(self, i=None):
        if self.p_cr.is_alive():
            self.p_cr.terminate()
            if i:
                self.cr_faults.value += 1
                print(f"\tContinuous reasoning failed at epoch {i+1}. (timeout)")

        if self.p_exh.is_alive():
            self.p_exh.terminate()
            if i:
                self.exh_faults.value += 1
                print(f"\tExhaustive search failed at epoch {i+1}. (timeout)")

    def run(self):
        print("INF_CHANGE: ", self.infr_change)
        cr_pl = get_new_prolog_instance(self.commits[self.current_commit], self.infr.file)
        for i in range(self.epochs):
            if i % self.commit_change == 0 and i > 0:
                self.current_commit = (self.current_commit + 1) % len(self.commits)
                print(f"Changing commit to {self.commits[self.current_commit]}")
                query(cr_pl, t.UNLOAD_APP)
                cr_pl.consult(self.commits[self.current_commit])

            self.p_cr = Process(name=f"CR {i}", target=self.cr, args=(i, cr_pl,))
            self.p_exh = Process(name=f"Exh {i}", target=self.exhaustive, args=(i,))

            self.p_exh.start()
            self.p_exh.join(self.timeout)

            self.p_cr.start()
            self.p_cr.join(self.timeout)

            self.terminate(i)

            if i % self.infr_change == 0 and i > 0:
                print(f"Changing infrastructure {i}")
                self.infr.run(self.variation_rate)
                self.infr.upload()        
        
    def exhaustive(self, i):
        print(f"{i+1} - Starting exhaustive search.")
        p = get_new_prolog_instance(self.commits[self.current_commit], self.infr.file)
        old_res = self.exh_results[-1] if self.exh_results else Result(i)
        try:
            q_res = query(p, t.EXH_QUERY.format(oldp=old_res.get_placement(), oldr=old_res.get_rates()))
            new_res = Result(i+1)
            new_res.set_results(q_res)
            self.exh_results.append(new_res)
            print(f"{i+1} - Exhaustive search finished.")
        except StopIteration:
            self.exh_faults.value += 1
            print(f"\tExhaustive search failed at epoch {i+1}.")

    def cr(self, i, p):
        print(f"{i+1} - Starting continuous reasoning.")
        query(p, "make.")
        old_res = self.cr_results[-1] if self.cr_results else Result(i, type='cr')
        try:
            q_res = query(p, t.CR_QUERY.format(oldp=old_res.get_placement(), oldr=old_res.get_rates(), oldAlloc=old_res.get_alloc()))
            new_res = Result(i+1, type='cr')
            new_res.set_results(q_res)
            self.cr_results.append(new_res)
            print(f"{i+1} - Continuous reasoning finished.")
        except StopIteration:
            self.cr_faults.value += 1
            print(f"\tContinuous reasoning failed at epoch {i+1}.")
            
@click.command()
@click.argument('size', type=int, default=16)
@click.argument('variation_rate', type=float, default=0.1)
@click.argument('app_name', type=str, default="speakToMe")
@click.option('--commits', '-c', type=click.Path(exists=True), default=t.COMMITS_DIR, help="Commits directory")
@click.option('--epochs', '-e', type=int, default=600, help="Number of epochs to run the experiment.")
@click.option('--seed', '-s', type=int, default=None, help="Seed for the random number generator.")
@click.option('--timeout', '-t', type=int, default=TIMEOUT, help="Timeout for each epoch.")
def main(size, variation_rate, app_name, commits, epochs, seed, timeout):
    """ Start an experiment with an infrastructure of SIZE nodes, changing with VARIATION_RATE every epoch."""
    with TemporaryDirectory() as tmpdir:
        print(f"Temporary directory: {tmpdir}")
        # use tabulate to print the input args
        print(tbl([["App name", app_name], ["Size", size], 
                   ["Variation rate", variation_rate], ["Epochs", epochs], 
                   ["Timeout", timeout]], tablefmt="fancy_grid"))

        infr = Infrastructure(size=size, seed=seed, path=tmpdir)
        infr_file = join(t.INFRS_DIR, f"infr{size}.pl")

        if exists(infr_file): # parse an existing infrastructure
            copyfile(infr_file, join(tmpdir, basename(infr_file)))
            infr.parse()
        else: # generate a new infrastructure
            infr.generate()
            infr.upload()
            copyfile(infr.file, infr_file)
        
        exp = Experiment(app_name=app_name, infr=infr, variation_rate=variation_rate, commits=commits, epochs=epochs, timeout=timeout)
        # atexit.register(exp.upload, file=t.TMP_RES_FILE.format(app=exp.app, infr=exp.infr.id, rate=exp.variation_rate, timestamp=t.TIMESTAMP))
        atexit.register(exp.terminate)
        exp.run()
        exp.upload()
        print(exp.get_faults())


if __name__ == '__main__':
    main()