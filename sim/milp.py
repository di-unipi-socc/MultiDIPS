import click
import numpy as np
from pyswip import Prolog
from ortools.linear_solver import pywraplp
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

    def initialization(self):
        prolog = get_new_prolog_instance(self.intent_file, self.infr_file)
        q_res = query(prolog, t.MILP_QUERY)
        
        self.nodes = list(q_res["Nodes"])
        self.res =  [extractTriple(element) for element in q_res["Res_j"]] 
        self.nodes_layer = list(map(lambda x: 0 if x=="edge" else 1, q_res["Layer_j"]))
        self.power = [extractTriple(element) for element in q_res["Power_j"]]
        self.nodes_pue = list(q_res["Pue_j"])
        self.e_cost = list(q_res["ECost_j"])
        self.vnfsChains = list(q_res["Vnfs"])
        self.only_vnfs = list(q_res["OnlyVnfs"])
        self.vnfs_type = list(q_res["Dim_i"])
        self.req_HW = [extractTriple(element) for element in q_res["ReqHW_i"]] 
        self.req_layer = list(map(lambda x: 0 if x=="edge" else 1, q_res["Layer_i"]))
        self.lat = list(q_res["Lat_i"])
        self.bw_req = self.calculatePropertyMatrix(len(self.only_vnfs), q_res["BWReq"], 'bw')
        self.lat_req = self.calculatePropertyMatrix(len(self.only_vnfs), q_res["MaxLat"], 'lat')
        self.link_bw = list(q_res["LinkBW_jk"])
        self.link_lat = list(q_res["LinkLat_jk"])
        self.max_emissions = float(q_res["MaxEmissions"])
        self.bw_emissions = float(q_res["BW_emissions"])
        self.link_emissions = self.calculateLinkEmissions(len(self.nodes),self.bw_emissions)
        self.carbon = list(q_res["Carbon_ij"])
        self.profit = list(q_res["Profit_ij"])
    

    def calculatePropertyMatrix(self, size, prop_lists, prop_type):
        if(prop_type == 'bw'):
            prop_req = np.zeros((size,size), dtype=int)
        else:
            prop_req = np.full((size,size), t.LAT_MAX_VALUE, dtype=int)

        prop_lists = [(e[0], [extractTriple(elem) for elem in e[1]]) for e in prop_lists]
        i = 0
        for (_,value_list) in prop_lists:
            for (_,_,value) in value_list:
                prop_req[i][i+1] = value
                i += 1
            i += 1
        return prop_req

    
    def calculateLinkEmissions(self, size, bw_emissions):
        bw_emissions = np.full((size,size), bw_emissions)
        np.fill_diagonal(bw_emissions, 0)
        return bw_emissions
    
    def solve(self):
        solver = pywraplp.Solver.CreateSolver('SCIP')

        # varibale: placement variable
        x = {(i, j): solver.BoolVar(f'{v}_on_{n}') for i,v in enumerate(self.only_vnfs) for j,n in enumerate(self.nodes)}

        # varibale: chain placed 
        p = {i: solver.BoolVar(f'c_{self.vnfsChains[i][0]}') for i,c in enumerate(self.vnfsChains)}

        # constraint: Vnf deployed to at most one node
        [solver.Add(solver.Sum([x[i, j] for j in range(len(self.nodes))]) <= 1, name=f'max_one_node_{v}') for i,v in enumerate(self.only_vnfs)]

        # constraint: all chain placed or none
        i_base = 0
        c = 0
        for (_,chain) in self.vnfsChains:
            solver.Add(solver.Sum([x[i,j] for i in range(i_base, i_base + len(chain)) for j in range(len(self.nodes))]) == p[c] * len(chain), name=f'chain_{c}_placed')
            i_base += len(chain)
            c += 1

        # constraint: resources needed not exceed hardware availability
        for resType in range(len(t.RESOURCES_TYPES)):
            for j,n in enumerate(self.nodes):
                solver.Add(solver.Sum([x[i,j] * self.req_HW[i][resType] for i in range(len(self.only_vnfs))]) <= self.res[j][resType], name=f'max_res_node_{n}')
        
        # constraint: vnf and node layer
        [solver.Add(x[i,j]*self.req_layer[i] == x[i,j]*self.nodes_layer[j], name=f'layer_{v}_{n}') for i,v in enumerate(self.only_vnfs) for j,n in enumerate(self.nodes)]


        y_dictionary = {}
        for j,n1 in enumerate(self.nodes):
            for k,n2 in enumerate(self.nodes):
                i = 0
                y_dictionary[j,k] = {}
                for (_,chain) in self.vnfsChains:
                    for _ in range(len(chain)-1):                        
                        if(self.req_layer[i]==self.nodes_layer[j] and self.req_layer[i+1]==self.nodes_layer[k]):
                            # varible: linearize lat and bw constraint
                            # pair of Vnfs i,h placed on pair of nodes j,k, only if i,h are next to each other and nodes layers are compatible
                            y = solver.BoolVar(f'{self.only_vnfs[i]}_on_{n1}_{self.only_vnfs[i+1]}_on_{n2}')
                            y_dictionary[j,k][i,i+1] = y
                            # constraint: linearize AND between x_ij and x_hk
                            solver.Add(y <= x[i,j])
                            solver.Add(y <= x[i+1,k])
                            solver.Add(y >= x[i,j] + x[i+1,k] - 1)
                        i += 1
                    i += 1

        # constraints: bw and lat 
        for j,k in y_dictionary.keys():
            jk_dict : dict = y_dictionary[j,k]
            # bw
            solver.Add(solver.Sum([y_dictionary[j,k][i,h] * self.bw_req[i][h] for i,h in jk_dict.keys()]) <= self.link_bw[j][k], name=f'bw_{j}_{k}')
            # lat
            for i,h in jk_dict.keys():
                solver.Add(y_dictionary[j,k][i,h] * (self.link_lat[j][k] + self.lat[i]) <= self.lat_req[j][k], name=f'lat_{j}_{k}')

        # constraint: max carbon emissions
        #solver.Add(solver.Sum([x[i,j] * self.carbon[i][j] for i in range(len(self.only_vnfs)) for j in range(len(self.nodes))])<=self.max_emissions, name=f'maxCarbonEmissions')
        #solver.Add(solver.Sum([y_dictionary[j,k][i,h] * (self.carbon[i][j] + self.carbon[h][k] + self.bw_req[i][h] * self.link_emissions[j][k]) for j,k in y_dictionary.keys() for i,h in y_dictionary[j,k].keys()]) <= self.max_emissions+0.1, name=f'maxCarbonEmissions')
        solver.Add(solver.Sum([x[i,j] * self.carbon[i][j] for i in range(len(self.only_vnfs)) for j in range(len(self.nodes))]) + solver.Sum([y_dictionary[j,k][i,h] * (self.bw_req[i][h] * self.link_emissions[j][k]) for j,k in y_dictionary.keys() for i,h in y_dictionary[j,k].keys()]) <= self.max_emissions, name=f'maxCarbonEmissions')


        # objective function
        solver.Maximize(solver.Sum([x[i,j] * self.profit[i][j] for i in range(len(self.only_vnfs)) for j in range(len(self.nodes))]))
            

        # solving
        status = solver.Solve()

        # parse solution
        if status == pywraplp.Solver.OPTIMAL:
            sol_placement = '['
            for i,v in enumerate(self.only_vnfs):
                for j,n in enumerate(self.nodes):
                    if x[i,j].solution_value():
                        sol_placement += ('on(' + str(v) + ', ' + str(self.vnfs_type[i]) + ', ' + str(n) + '), ')
            sol_placement = sol_placement[:len(sol_placement)-2] + ']'

            sol_profit = solver.Objective().Value()
            sol_carbon = sum([x[i,j].solution_value() * self.carbon[i][j] for i in range(len(self.only_vnfs)) for j in range(len(self.nodes))]) + sum([y_dictionary[j,k][i,h].solution_value() * (self.bw_req[i][h] * self.link_emissions[j][k]) for j,k in y_dictionary.keys() for i,h in y_dictionary[j,k].keys()])
            
            print(sol_placement) 
            print("Profit: " + str(sol_profit))
            print("carbon: " + str(sol_carbon))

            '''
            for j,k in y_dictionary.keys():
                jk_dict : dict = y_dictionary[j,k]
                for i,h in jk_dict.keys():
                    print(str((i,j,h,k))+": "+ str(y_dictionary[j,k][i,h].solution_value()))
            '''

            

@click.command()
@click.argument("intents_file", type=str, nargs=1)
@click.argument("infrf_file", type=str, nargs=1)
def main(intents_file, infrf_file):
    milp = Milp(intents_file, infrf_file)
    milp.initialization()
    milp.solve()

if __name__ == '__main__':
    main()