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
from intents import Intents 
from pyswip import Prolog
from tabulate import tabulate as tbl

TIMEOUT = 600 #seconds

# --- UTILITY FUNCTIONS ---
def get_new_prolog_instance(intents, infr):
    p = Prolog()
    p.consult(t.SIM_PL_FILE)   
    p.consult(intents+"/*")
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
    def __init__(self, rid: int, type: str = 'multiDips'):
        self.id = rid
        self.type = type
        self.profit = 0
        self.energy = 0
        self.carbon = 0
        self.placement = []
        self.allocbw = []
        self.unsatprops = []
        self.inferences = 0
        self.time = 0

    def get_profit(self):
        return str(self.profit)
    
    def get_energy(self):
        return str(self.energy)
    
    def get_carbon(self):
        return str(self.carbon)

    def get_placement(self):
        return self.placement
    
    def get_allocbw(self):
        return self.allocbw     
    
    def get_unsatprops(self):
        return self.unsatprops   
    
    def set_results(self, res):
        self.profit     = res["Profit"]
        self.energy     = res["Energy"]
        self.carbon     = res["Carbon"]
        self.placement  = res["Placement"]
        self.allocbw    = res["AllocBW"]
        self.unsatProps = res["UnsatProps"]

        self.inferences = int(res["Infs"])
        self.time       = round(float(res["Time"]), 6)

    def pretty_print(self):
        return tbl([['ID', self.id],
                    ["Inferences", self.inferences], ["Time", self.time],
                    ["Profit", self.profit], ["Enegy", self.energy],
                    ["Carbon", self.carbon],
                    ["Placement", self.placement],
                    ["AllocBW", self.allocbw],
                    ["UnsatProps", self.unsatprops]],
                    headers=["Metric", "Value"])

    def __str__(self):
        return str(self.__dict__)
    
    def __repr__(self):
        return self.__str__()
            

class Experiment():
    def __init__(self, infr: Infrastructure, intents: Intents, timeout: int = TIMEOUT):
        
        self.infr = infr
        self.intents = intents
        self.timeout = timeout
        self.file = t.RESULTS_FILE.format(intents=self.intents.id, infr=self.infr.id, timestamp=t.TIMESTAMP)

        self.p_multiDips: Process = None
        self.multiDips_results = Manager().list()

    def upload(self, file=None):
        results = list(self.multiDips_results) 
        print(results)
        file = file if file else self.file
        if results:
            results = pd.DataFrame.from_records([r.__dict__ for r in results], index="id")
            [results.pop(f) for f in ['profit', 'energy', 'carbon', 'placement', 'allocbw', 'unsatprops']]
            results["size"] = self.infr._size
            df_to_file(results, file)
        else:
            print("No results to upload.")

    def terminate(self):
        if self.p_multiDips.is_alive():
            self.p_multiDips.terminate()
            print(f"\tMulti dips failed. (timeout)")

    def run(self):
        self.p_multiDips = Process(name=f"MultiDips", target=self.multiDips)
            
        self.p_multiDips.start()
        self.p_multiDips.join(self.timeout)

        self.terminate()
  
        
    def multiDips(self):
        print("Starting heuristic search.")

        multiDips = get_new_prolog_instance(self.intents.fileWrite, self.infr.file)

        try:
            q_res = query(multiDips, t.MD_QUERY)
            res = Result(1)
            res.set_results(q_res)
            self.multiDips_results.append(res)
            print("Heuristic search finished.")
        except StopIteration:
            print(f"\tHeuristic search failed.")

            
@click.command()
@click.argument("infr_sizes", type=int, nargs=1)
@click.argument("intents_sizes", type=int, nargs=1)
@click.option("--seed", "-s", type=int, default=None, help="Seed for the random number generator.")
@click.option("--timeout", "-t", type=int, default=TIMEOUT, help="Timeout for each test.")
def main(infr_sizes, intents_sizes, seed, timeout):
    """ Start an experiment with an infrastructure of SIZE nodes and itentsSize number of intent."""
    with TemporaryDirectory() as tmpdir:
        print(f"Temporary directory: {tmpdir}")
        # use tabulate to print the input args
        print(tbl([["Infrastructure Size", infr_sizes], ["Number of intent", intents_sizes], 
                   ["Timeout", timeout]], tablefmt="fancy_grid"))

        infr = Infrastructure(size=infr_sizes, seed=seed, path=tmpdir)
        infr_file = join(t.INFRS_DIR, f"infr{infr_sizes}.pl")

        if exists(infr_file): # parse an existing infrastructure
            copyfile(infr_file, join(tmpdir, basename(infr_file)))
            infr.parse()
        else: # generate a new infrastructure
            infr.generate()
            infr.upload()
            copyfile(infr.file, infr_file)

        intents = Intents(size=intents_sizes, readPath="../src/intentsData.pl", writePath=t.INTENTS_DIR)
        #intents_file = join(t.INTENTS_DIR, f"intents{intents_sizes}.pl")
        intents.parse()
        intents.upload()
        
        exp = Experiment(infr=infr, intents=intents, timeout=timeout)
        # atexit.register(exp.upload, file=t.TMP_RES_FILE.format(app=exp.app, infr=exp.infr.id, rate=exp.variation_rate, timestamp=t.TIMESTAMP))
        atexit.register(exp.terminate)
        exp.run()
        exp.upload()


if __name__ == '__main__':
    main()