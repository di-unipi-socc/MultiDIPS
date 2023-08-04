import atexit
import glob
import time
from itertools import product 
from multiprocessing import Manager, Process
from os import makedirs
from os.path import basename, dirname, exists, isfile, join
from shutil import copyfile
from tempfile import TemporaryDirectory

import click
import pandas as pd
import templates as t
from milp import Milp
from builder import Infrastructure
from intents import Intents 
from pyswip import Prolog
from tabulate import tabulate as tbl

TIMEOUT = 3600 #seconds

# --- UTILITY FUNCTIONS ---
def get_new_prolog_instance(intents, infr):
    p = Prolog()
    p.consult(t.SIM_PL_FILE)   
    p.consult(intents)
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
    def __init__(self, rid: int, type: str):
        self.id = rid
        self.type = type
        self.profit = 0
        self.carbon = 0
        self.energy = 0
        self.placement = []
        self.failedP = 0
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
    
    def get_failedP(self):
        return self.failedP
    
    def get_allocbw(self):
        return self.allocbw     
    
    def get_unsatprops(self):
        return self.unsatprops   
    
    def set_results(self, res):
        self.profit     = res["Profit"]
        self.carbon     = res["Carbon"]
        self.energy     = res["Energy"]
        self.placement  = res["Placement"]
        self.failedP    = self.countFail()
        self.allocbw    = res["AllocBW"]
        self.unsatprops = res["UnsatProps"]

        self.inferences = int(res["Infs"])
        self.time       = round(float(res["Time"]), 6)

    def countFail(self):
        tot = 0
        for l in self.placement:
            if l[1]==[]: 
                tot+=1
        return tot

    def pretty_print(self):
        return tbl([['ID', self.id],
                    ["Inferences", self.inferences], ["Time", self.time],
                    ["Profit", self.profit], ["Carbon", self.carbon],
                    ["Energy", self.energy],
                    ["Placement", self.placement],
                    ["NumFailP", self.failedP],
                    ["AllocBW", self.allocbw],
                    ["UnsatProps", self.unsatprops]],
                    headers=["Metric", "Value"])

    def __str__(self):
        return str(self.__dict__)
    
    def __repr__(self):
        return self.__str__()
            

class Experiment():
    def __init__(self, infr: Infrastructure, intents: Intents, epochs: int = 100, timeout: int = TIMEOUT, variation_rate: float = 0.2):
        
        self.infr = infr
        self.intents = intents
        self.epochs = epochs
        self.timeout = timeout
        self.variation_rate = variation_rate
        self.file = t.RESULTS_FILE.format(intents=self.intents.id, infr=self.infr.id, rate=self.variation_rate, timestamp=t.TIMESTAMP)

        self.processes: dict[str, Process]= {}
        self.results = Manager().list()

    def upload(self, file=None):
        results = list(self.results) 
        file = file if file else self.file
        if results:
            results = pd.DataFrame.from_records([r.__dict__ for r in results], index="id")
            [results.pop(f) for f in ['placement', 'unsatprops']]
            results["numIntents"] = self.intents._size
            results["size"] = self.infr._size
            results["rate"] = self.variation_rate
            df_to_file(results, file)
        else:
            print("No results to upload.")

    def terminate(self, process: Process, i=None):
        if process.is_alive():
            process.terminate()
            if i:
                print(f"\tMulti dips failed at epoch {i+1}. (timeout)")

    def run(self):
        for i in range(self.epochs):
            
            p_milp = Process(name=f"MILP", target=self.milp, args=(i,))
            p_milp.start()
            self.processes['milp'] = p_milp
            
            for (mode, weights) in product(t.RANK_MODE, t.HEURISTIC_WEIGHTS):
                p_multiDips = Process(name=f"MultiDips", target=self.multiDips, args=(i, mode, weights,))
                p_multiDips.start()
                self.processes[f'({mode},{weights})'] = p_multiDips

            for process in self.processes.values():
                process.join(self.timeout)
                self.terminate(process, i)
            print(f"Changing infrastructure {i}")
            self.infr.run(self.variation_rate)
            self.infr.upload()
  
        
    def multiDips(self, i, mode, weight):
        print(f"Starting heuristic search - {mode} - {weight}")

        multiDips = get_new_prolog_instance(self.intents.fileWrite, self.infr.file)

        try:
            query_str = t.MD_QUERY.format(rank_mode=mode, heuristic_weight=weight)
            q_res = query(multiDips, query_str)
            res = Result(i, type=f"multiDips_{mode}_{weight}")
            res.set_results(q_res)
            self.results.append(res)
            print(f"Heuristic search finished - {mode} - {weight}")
        except StopIteration:
            print(f"Heuristic search failed - {mode} - {weight}")

    def milp(self, i):
        print("Starting MILP search")
        try:
            milp = Milp(self.intents.fileWrite, self.infr.file)
            milp.initialization()
            milp_res = milp.solve()
            res = Result(i, type=f"MILP")
            res.set_results(milp_res)
            self.results.append(res)
            print("MILP search finished.")
        except StopIteration:
            print("MILP search failed.")


            
@click.command()
@click.argument("intents_size", type=int, nargs=1)
@click.argument("infr_size", type=int, nargs=1)
@click.argument('variation_rate', type=float, default=0.2)
@click.option('--epochs', '-e', type=int, default=500, help="Number of epochs to run the experiment.")
@click.option("--seed", "-s", type=int, default=None, help="Seed for the random number generator.")
@click.option("--timeout", "-t", type=int, default=TIMEOUT, help="Timeout for each test.")

def main(intents_size, infr_size, variation_rate, epochs, seed, timeout):
    """ Start an experiment with an infrastructure of SIZE nodes and itentsSize number of intent."""
    with TemporaryDirectory() as tmpdir:
        print(f"Temporary directory: {tmpdir}")
        # use tabulate to print the input args
        print(tbl([["Infrastructure Size", infr_size], ["Number of intent", intents_size], 
                    ["Variation rate", variation_rate], ["Epochs", epochs],
                    ["Timeout", timeout]], tablefmt="fancy_grid"))

        intents = Intents(size=intents_size, readPath=t.SRC_INTENT_DIR, writePath=tmpdir)
        intents_file = join(t.INTENTS_DIR, f"intents{intents_size}.pl")

        if exists(intents_file):
            copyfile(intents_file, join(tmpdir, basename(intents_file)))
        if not exists(intents_file):
            intents.parse()
            intents.upload()
            copyfile(intents.fileWrite, intents_file)


        infr = Infrastructure(size=infr_size, seed=seed, path=tmpdir)
        infr_file = join(t.INFRS_DIR, f"infr{infr_size}.pl")

        if exists(infr_file): # parse an existing infrastructure
            copyfile(infr_file, join(tmpdir, basename(infr_file)))
            infr.parse()
        else: # generate a new infrastructure
            infr.generate()
            infr.upload()
            copyfile(infr.file, infr_file)

        
        exp = Experiment(infr=infr, intents=intents, epochs=epochs, timeout=timeout, variation_rate=variation_rate)
        exp.run()
        exp.upload()
        


if __name__ == '__main__':
    main()