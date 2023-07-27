import click
import numpy as np
from pyswip import Prolog
import templates as t

# --- UTILITY FUNCTIONS ---
def get_new_prolog_instance(intents_file, infr_file):
    p = Prolog()
    p.consult(t.MILP_PL_FILE)
    p.consult(intents_file)   
    p.consult(infr_file)
    return p

def query(p: Prolog, q: str):
    r = p.query(q)
    return t.parse_prolog(next(r)) if r else None

def extractTriple(elem):
        return (elem[0], elem[1][0], elem[1][1])


class Milp():
    def __init__(self, intents_file, infr_file):
        self.intent_file = intents_file
        self.infr_file = infr_file

    def milp(self):
        prolog = get_new_prolog_instance(self.intent_file, self.infr_file)
        q_res = query(prolog, t.MILP_QUERY)
        
        nodes = list(q_res["Nodes"])
        res =  [extractTriple(element) for element in q_res["Res_j"]] 
        nodes_layer = list(q_res["Layer_j"])
        power = [extractTriple(element) for element in q_res["Power_j"]]
        nodes_pue = list(q_res["Pue_j"])
        e_cost = list(q_res["ECost_j"])
        vnfs = list(q_res["Vnfs"])
        only_vnfs = list(q_res["OnlyVnfs"])
        req_HW = [extractTriple(element) for element in q_res["ReqHW_i"]] 
        req_layer = list(q_res["Layer_i"])
        lat = list(q_res["Lat_i"])
        bw_req = self.calculatePropertyMatrix(len(only_vnfs), q_res["BWReq"], 'bw')
        lat_req = self.calculatePropertyMatrix(len(only_vnfs), q_res["MaxLat"], 'lat')
        link_bw = list(q_res["LinkBW_jk"])
        max_emissions = float(q_res["MaxEmissions"])
        carbon = list(q_res["Carbon_ij"])
        profit = list(q_res["Profit_ij"])
        
        print(nodes)
        print("\n")
        print(res)
        print("\n")
        print(nodes_layer)
        print("\n")
        print(power)
        print("\n")
        print(nodes_pue)
        print("\n")
        print(e_cost)
        print("\n")
        print(vnfs)
        print("\n")
        print(only_vnfs)
        print("\n")
        print(req_HW)
        print("\n")
        print(req_layer)
        print("\n")
        print(lat)
        print("\n")
        print(bw_req)
        print("\n")
        print(lat_req)
        print("\n")
        print(link_bw)
        print("\n")
        print(max_emissions)
        print("\n")
        print(carbon)
        print("\n")
        print(profit)

    def calculatePropertyMatrix(self, dimension, prop_lists, prop_type):
        if(prop_type == 'bw'):
            prop_req = np.zeros((dimension,dimension), dtype=int)
        else:
            prop_req = np.full((dimension,dimension), t.LAT_MAX_VALUE, dtype=int)

        prop_lists = [(e[0], [extractTriple(elem) for elem in e[1]]) for e in prop_lists]
        i = 0
        for (_,bw_list) in prop_lists:
            for (_,_,value) in bw_list:
                prop_req[i][i+1] = value
                i += 1
            i += 1
        return prop_req


@click.command()
@click.argument("intents_file", type=str, nargs=1)
@click.argument("infrf_file", type=str, nargs=1)
def main(intents_file, infrf_file):
    milp = Milp(intents_file, infrf_file)
    milp.milp()

if __name__ == '__main__':
    main()