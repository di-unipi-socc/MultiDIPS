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
    def __init__(self, rid: int, type: str = 'multiDips'):
        self.id = rid
        self.type = type
        self.profit = 0
        self.energy = 0
        self.carbon = 0
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
        self.energy     = res["Energy"]
        self.carbon     = res["Carbon"]
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
                    ["Profit", self.profit], ["Enegy", self.energy],
                    ["Carbon", self.carbon],
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
    def __init__(self, infr: Infrastructure, intents: Intents, epochs: int = 600, timeout: int = TIMEOUT, variation_rate: float = 0.1):
        
        self.infr = infr
        self.intents = intents
        self.epochs = epochs
        self.timeout = timeout
        self.variation_rate = variation_rate
        self.file = t.RESULTS_FILE.format(intents=self.intents.id, infr=self.infr.id, rate=self.variation_rate, timestamp=t.TIMESTAMP)

        self.p_multiDips: Process = None
        self.multiDips_results = Manager().list()

    def upload(self, file=None):
        results = list(self.multiDips_results) 
        file = file if file else self.file
        if results:
            results = pd.DataFrame.from_records([r.__dict__ for r in results], index="id")
            [results.pop(f) for f in ['placement', 'allocbw']]
            results["numIntents"] = self.intents._size
            results["size"] = self.infr._size
            results["rate"] = self.variation_rate
            df_to_file(results, file)
        else:
            print("No results to upload.")

    def terminate(self, i=None):
        if self.p_multiDips.is_alive():
            self.p_multiDips.terminate()
            if i:
                print(f"\tMulti dips failed at epoch {i+1}. (timeout)")

    def run(self):
        for i in range(self.epochs):
            self.p_multiDips = Process(name=f"MultiDips", target=self.multiDips)
                
            self.p_multiDips.start()
            self.p_multiDips.join(self.timeout)

            self.terminate(i)

            print(f"Changing infrastructure {i}")
            self.infr.run(self.variation_rate)
            self.infr.upload()
  
        
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
@click.argument("intents_size", type=int, nargs=1)
@click.argument("infr_size", type=int, nargs=1)
@click.argument('variation_rate', type=float, default=0.1)
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

        intents.parse()
        intents.upload()
        if not exists(intents_file):
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
        # atexit.register(exp.upload, file=t.TMP_RES_FILE.format(app=exp.app, infr=exp.infr.id, rate=exp.variation_rate, timestamp=t.TIMESTAMP))
        atexit.register(exp.terminate)
        exp.run()
        exp.upload()
        


if __name__ == '__main__':
    main()