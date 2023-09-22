import click
import itertools
import numpy as np
from time import process_time
from pyswip import Prolog
from ortools.linear_solver import pywraplp
from ast import literal_eval
import data as t

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


class Milp:
    def __init__(self, intents_file, infr_file):
        self.intent_file = intents_file
        self.infr_file = infr_file

    def initialization(self):
        start_time = process_time()
        prolog = get_new_prolog_instance(self.intent_file, self.infr_file)
        q_res = query(prolog, t.MILP_QUERY)

        self.nodes = list(q_res["Nodes"])
        self.res = [extractTriple(element) for element in q_res["Res_j"]]
        self.nodes_layer = list(
            map(lambda x: 0 if x == "edge" else 1, q_res["Layer_j"])
        )
        self.vnfsChains = list(q_res["Vnfs"])
        self.only_vnfs = list(q_res["OnlyVnfs"])
        self.vnfs_type = list(q_res["Dim_i"])
        self.req_HW = [extractTriple(element) for element in q_res["ReqHW_i"]]
        self.req_layer = list(map(lambda x: 0 if x == "edge" else 1, q_res["Layer_i"]))
        self.lat = list(q_res["Lat_i"])
        self.bw_req = self.calculatePropertyMatrix(len(self.only_vnfs), q_res["BWReq"], "bw")
        self.lat_req = self.calculatePropertyMatrix(len(self.only_vnfs), q_res["MaxLat"], "lat")
        self.link_bw = list(q_res["LinkBW_jk"])
        self.link_lat = list(q_res["LinkLat_jk"])
        self.max_emissions = float(q_res["MaxEmissions"])
        self.bw_energy = float(q_res["BW_Energy"])
        self.bw_emissions = float(q_res["BW_emissions"])
        self.carbon = list(q_res["Carbon_ij"])
        self.energy = list(q_res["Energy_ij"])
        self.profit = list(q_res["Profit_ij"])
        self.initialization_time = process_time() - start_time
        

    def calculatePropertyMatrix(self, size, prop_lists, prop_type):
        if prop_type == "bw":
            prop_req = np.zeros((size, size), dtype=int)
        else:
            prop_req = np.full((size, size), t.LAT_MAX_VALUE, dtype=int)

        prop_lists = [(e[0], [extractTriple(elem) for elem in e[1]]) for e in prop_lists]
        i = 0
        for _, value_list in prop_lists:
            for _, _, value in value_list:
                prop_req[i][i + 1] = value
                i += 1
            i += 1
        return prop_req
    
    def link_emissions(self, j, k):
        if j!=k: 
            return self.bw_emissions
        else: return 0

    def link_energy(self, j, k):
        if j!=k: 
            return self.bw_energy
        else: return 0

    def solve(self):
        solver = pywraplp.Solver.CreateSolver('GUROBI')

        solver.SetTimeLimit(24 * 60 * 60 * 1000)    # 24 hours timeout

        solver.SetSolverSpecificParametersAsString('Threads=4')
        solver.SetSolverSpecificParametersAsString('NodefileStart=0.5')
        solver.SetSolverSpecificParametersAsString('IgnoreNames=1')

        start_time = process_time()
  
        # variable: placement variable (if node j is compatible with VNF i)
        x = {}
        for i, v in enumerate(self.only_vnfs):
            for j, n in enumerate(self.nodes):
                if(self.req_layer[i] == self.nodes_layer[j]):
                    x[i,j] = solver.BoolVar(f"{v}_on_{n}")
                  

        # variable: chain placed
        p = {
            i: solver.BoolVar(f"c_{self.vnfsChains[i][0]}")
            for i, c in enumerate(self.vnfsChains)
        }

        # constraint: Vnf deployed to at most one node
        [
            solver.Add(
                solver.Sum([x[i, j] for j in range(len(self.nodes)) if (i,j) in x.keys()]) <= 1,
                name=f"max_one_node_{v}"
            )
            for i, v in enumerate(self.only_vnfs)
        ]

        # constraint: all Vnfs in the chain placed or none
        i_base = 0
        c = 0
        for _, chain in self.vnfsChains:
            solver.Add(
                solver.Sum(
                    [
                        x[i, j]
                        for i in range(i_base, i_base + len(chain))
                        for j in range(len(self.nodes)) if (i,j) in x.keys()
                    ]
                ) == p[c] * len(chain),
                name=f"chain_{c}_placed"
            )
            i_base += len(chain)
            c += 1

        # constraint: resources needed not exceed hardware availability
        for resType in range(len(t.RESOURCES_TYPES)):
            for j, n in enumerate(self.nodes):
                solver.Add(
                    solver.Sum(
                        [
                            x[i, j] * self.req_HW[i][resType]
                            for i in range(len(self.only_vnfs)) if (i,j) in x.keys()
                        ]
                    ) <= self.res[j][resType],
                    name=f"max_res_node_{n}"
                )

        y_dictionary = {}
        for (j, n1), (k,n2) in itertools.product(enumerate(self.nodes), repeat = 2):
            y_dictionary[j, k] = {}
            i = 0
            for _, chain in self.vnfsChains:
                for _ in range(len(chain) - 1):
                    if (self.req_layer[i] == self.nodes_layer[j]
                        and self.req_layer[i + 1] == self.nodes_layer[k]):
                        # varible: linearize lat and bw constraint
                        # pair of Vnfs i,h placed on pair of nodes j,k, only if i,h are next to each other and nodes layers are compatible
                        y = solver.BoolVar(f"{self.only_vnfs[i]}_on_{n1}_{self.only_vnfs[i+1]}_on_{n2}")
                        y_dictionary[j, k][i, i + 1] = y
                        # constraint: linearize AND between x_ij and x_hk
                        solver.Add(y <= x[i, j])
                        solver.Add(y <= x[i + 1, k])
                        solver.Add(y >= x[i, j] + x[i + 1, k] - 1)
                    i += 1
                i += 1

        # constraints: bw and lat
        
        for j, k in y_dictionary.keys():
            jk_dict: dict = y_dictionary[j, k]
            # bw
            solver.Add(
                solver.Sum(
                    [
                        y_dictionary[j, k][i, h] * self.bw_req[i][h]
                        for i, h in jk_dict.keys()
                    ]
                ) <= self.link_bw[j][k],
                name=f"bw_{j}_{k}"
            )
            # lat
            for i, h in jk_dict.keys():
                solver.Add(
                    y_dictionary[j, k][i, h] * (self.link_lat[j][k] + self.lat[i]) <= self.lat_req[i][h],
                    name=f"lat_{j}_{k}"
                )
        
        # constraint: max carbon emissions
        
        solver.Add(
            solver.Sum(
                [
                    x[i, j] * self.carbon[i][j]
                    for i in range(len(self.only_vnfs))
                    for j in range(len(self.nodes)) if (i,j) in x.keys()
                ]
            )
            + solver.Sum(
                [
                    y_dictionary[j, k][i, h] * (self.bw_req[i][h] * self.link_emissions(j,k))
                    for j, k in y_dictionary.keys()
                    for i, h in y_dictionary[j, k].keys()
                ]
            )
            <= self.max_emissions,
            name=f"maxCarbonEmissions",
        )
        
        # objective function
        solver.Maximize(
            solver.Sum(
                [
                    x[i, j] * self.profit[i][j]
                    for i in range(len(self.only_vnfs))
                    for j in range(len(self.nodes)) if (i,j) in x.keys()
                ]
            )
        )

        
        # solving
        status = solver.Solve()

        solving_time = process_time() - start_time

        solution = {}

        # parse solution
        #if status == pywraplp.Solver.OPTIMAL:
        
        sol_placement = self.parse_placement(x)    
        sol_carbon = sum(
            [
                x[i, j].solution_value() * self.carbon[i][j]
                for i in range(len(self.only_vnfs))
                for j in range(len(self.nodes)) if (i,j) in x.keys()
            ]
        ) + sum(
            [
                y_dictionary[j, k][i, h].solution_value() * (self.bw_req[i][h] * self.link_emissions(j,k))
                for j, k in y_dictionary.keys()
                for i, h in y_dictionary[j, k].keys()
            ]
        )
        sol_energy = sum(
            [
                x[i, j].solution_value() * self.energy[i][j]
                for i in range(len(self.only_vnfs))
                for j in range(len(self.nodes)) if (i,j) in x.keys()
            ]
        ) + sum(
            [
                y_dictionary[j, k][i, h].solution_value() * (self.bw_req[i][h] * self.link_energy(j,k))
                for j, k in y_dictionary.keys()
                for i, h in y_dictionary[j, k].keys()
            ]
        )
        solution["Placement"] = sol_placement
        solution["Profit"] = solver.Objective().Value()
        solution["Carbon"] = sol_carbon
        solution["Energy"] = sol_energy
        solution["UnsatProps"] = "-"
        solution["Infs"] = 0
        solution["Time"] = self.initialization_time + solving_time
         
        print(status)
        return solution
        
        
        with open(t.MODELS_FILE.format(name='model'), 'w') as f:
            print(solver.ExportModelAsMpsFormat(fixed_format=False, obfuscated=False), file=f)
            

    def parse_placement(self, x):
        i = 0
        sol_placement = "["
        for intent_id, chain in self.vnfsChains:
            sol_placement += '("' + str(intent_id) + '", [ ' 
            for _ in range(len(chain)):
                for j,n in enumerate(self.nodes):
                    if (i,j) in x.keys() and x[i, j].solution_value():
                        sol_placement += (
                                '"on(' + str(self.only_vnfs[i]) + ", " + str(self.vnfs_type[i]) + ", " + str(n) + ')",'
                            )
                i += 1
            sol_placement = sol_placement[: len(sol_placement) - 1] + "]),"
        sol_placement = sol_placement[: len(sol_placement) - 1] + "]"
        return literal_eval(sol_placement)


@click.command()
@click.argument("intents_file", type=str, nargs=1)
@click.argument("infrf_file", type=str, nargs=1)
def main(intents_file, infrf_file):
    milp = Milp(intents_file, infrf_file)
    milp.initialization()
    solution = milp.solve()
    solution.pop('Infs', None)
    solution.pop('UnsatProps', None)
    print(solution)

if __name__ == "__main__":
    main()