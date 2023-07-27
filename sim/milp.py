import click
import numpy as np
from pyswip import Prolog
import templates as t

# --- UTILITY FUNCTIONS ---
def get_new_prolog_instance(intentsFile, infrFile):
    p = Prolog()
    p.consult(t.MILP_PL_FILE)
    p.consult(intentsFile)   
    p.consult(infrFile)
    return p

def query(p: Prolog, q: str):
    r = p.query(q)
    return t.parse_prolog(next(r)) if r else None

def extractTriple(elem):
        return (elem[0], elem[1][0], elem[1][1])


class Milp():
    def __init__(self, intentsFile, infrFile):
        self.intentFile = intentsFile
        self.infrFile = infrFile

    def milp(self):
        prolog = get_new_prolog_instance(self.intentFile, self.infrFile)
        q_res = query(prolog, t.MILP_QUERY)
        
        nodes = list(q_res["Nodes"])
        Res =  [extractTriple(element) for element in q_res["Res_j"]] 
        nodesLayer = list(q_res["Layer_j"])
        power = [extractTriple(element) for element in q_res["Power_j"]]
        nodesPue = list(q_res["Pue_j"])
        Ecost = list(q_res["ECost_j"])
        vnfs = list(q_res["Vnfs"])
        onlyVnfs = list(q_res["OnlyVnfs"])
        ReqHW = [extractTriple(element) for element in q_res["ReqHW_i"]] 
        ReqLayer = list(q_res["Layer_i"])
        Lat = list(q_res["Lat_i"])
        BWReq = self.calculateBWMatrix(len(onlyVnfs), q_res["BWReq"])

        #print(q_res)

    def calculateBWMatrix(self, dimension, BWlist):
        BWReq = np.zeros((dimension,dimension), dtype=int)
        BWlist = [(e[0], [extractTriple(elem) for elem in e[1]]) for e in BWlist]

        #for i in range(0,l-1):
            
        print(BWReq)
        print(vnfs)
        print(BWlist)



@click.command()
@click.argument("intents_file", type=str, nargs=1)
@click.argument("infrf_file", type=str, nargs=1)
def main(intents_file, infrf_file):
    milp = Milp(intents_file, infrf_file)
    milp.milp()

if __name__ == '__main__':
    main()