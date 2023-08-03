from os.path import abspath, dirname, join
from time import strftime
from pyswip import Atom, Functor

# --- INFRASTRACTURES CONSTANTS ---
LAT_MAX_VALUE = 100000
BW_MIN_VALUE = 0
FAIL_PROB = 0.03
LINK_PROBABILITY = 0.4
EDGE_PRICE = (0.030, 0.060, 0.00050)
CLOUD_PRICE = (0.015, 0.030, 0.00025)
GCI_VALUE = 0.475
KWH_PER_MB_VALUE = 0.00008
MAX_EMISSIONS_PER_EDGE_NODE = 0.050
MAX_EMISSIONS_PER_CLOUD_NODE = 0.150
MAX_ENERGY_PER_EDGE_NODE = 0.120
MAX_ENERGY_PER_CLOUD_NODE = 0.390
RESOURCES_TYPES = ["RAM", "CPU", "STORAGE"]
TYPES   = ['cloud', 'edge']
PROBS   = [0.25, 0.75]
MAX_HW_USAGE = 1.35
VARIATION = {'hw': {'lb': 0.3, 'ub': 1.2}, 'lat': {'lb': 0.7, 'ub': 1.6}, 'bw': {'lb': 0.3, 'ub': 1.2}}
INFR_CHANGING_PROPERTIES = [('logging', 'logVF'), ('privacy', 'encVF'), ('security', 'authVF'), ('caching', 'cacheVF'), ('compression', 'compVF'), ('encoding', 'encodeVF')]
INFR_DISC_PREDICATES = {'node': 3, 'totHW': 2, 'pue': 2, 'ramEnergyProfile': 3, 'cpuEnergyProfile': 3, 'storageEnergyProfile': 3, 'energySourceMix': 2, 'energyCost': 2}
EMISSIONS = {'gas': 0.610, 'coal': 1.1, 'onshorewind': 0.0097, 'offshorewind': 0.0165, 'solar': 0.05}

# --- INTENT CONSTANT ---
INT_DISC_PREDICATES = {'intent': 4, 'propertyExpectation': 5, 'propertyExpectation#': 8, 'target': 2, 'vnf': 3, 'vnfXUser': 4}

# --- DIRECTORIES & FILES ---

ROOT_DIR = dirname(dirname(abspath(__file__)))
SIM_DIR = join(ROOT_DIR, "sim")
INFRS_DIR = join(ROOT_DIR, "data", "infrs")
INTENTS_DIR = join(ROOT_DIR, "data", "intents")
SRC_INTENT_DIR = join(ROOT_DIR, "src", "intentsData.pl")
RESULTS_DIR = join(SIM_DIR, "results")
PLOTS_DIR = join(SIM_DIR, "plots")

VALUES_FILE = join(SIM_DIR, "values.json")
SIM_PL_FILE = join(SIM_DIR, "sim.pl")
MILP_PL_FILE = join(SIM_DIR, "milp.pl")
RESULTS_FILE = join(RESULTS_DIR, "{intents}-{infr}-{rate}-{timestamp}.csv")
TMP_RES_FILE = join(RESULTS_DIR, "{intents}-{infr}-{timestamp}-tmp.csv")
ALL_RESULTS = RESULTS_FILE.format(intents="*", infr="*", rate="*", timestamp="*")

PLOT_FORMAT = "pdf"
PLOT_PATH = join(PLOTS_DIR, "{name}." + PLOT_FORMAT)
PLOT_DPI = 600

# --- GENERAL INFO TEMPLATES ---

DISCONTIGUOUS = ":- discontiguous {}/{:d}."
GLOBAL_INTENT = "globalIntent({property}, smaller, {value}, {unit})."
GCI = "averageGCI({value})."
PRICE = "price({type}, {price})."
EMISSION = "emissions({s}, {p})."
CHANGING_PROPERTY_VNF = "changingProperty({property}, {vnf})."
KWH_PER_MB = "kWhPerMB({value})."

# --- INFRASTRACTURES TEMPLATES ---

GLOBAL_INTENT = "globalIntent({type}, {bound}, {value}, {unit})."
INFR_CHANGING_PROPERTY = "changingProperty({property}, {vnf})."
NODE = "node({id}, {type}, {HWcaps})."
TOT_HW = "totHW({id}, {totHW})."
RAM_ENERGY_PROFILE = "ramEnergyProfile({id}, L, E) :- E is {ramkWh} * L."
CPU_ENERGY_PROFILE = "cpuEnergyProfile({id}, L, E) :- E is {CPUkWh} * L."
STORAGE_ENERGY_PROFILE = "storageEnergyProfile({id}, L, E) :- E is {storagekWh} * L."
PUE = "pue({id}, {pue})."
ENERGY_SOURCE_MIX = "energySourceMix({id}, [{mix}])."
ENERGY_COST = "energyCost({id}, {energyCost})."
LINK = "link({source}, {dest}, {lat}, {bw})."

# --- INTENT TEMPLATES ---

INTENT = "intent({stakeholder}, {intentId}, {nUsers}, {targetId})."
CHANGING_PROPERTY = "propertyExpectation({intentId}, {property}, {bound}, {From}, {To})."
NON_CHANGING_PROPERTY = "propertyExpectation({intentId}, {property}, {bound}, {level}, {value}, {unit}, {From}, {To})."
TARGET = "target({targetId}, {targetChain})."
VNF = "vnf({id}, {level}, {processTime})."
VNFXUSERS = "vnfXUser({id}, {version}, {usersRange}, {HWReqs})."

# --- QUERY TEMPLATES ---
RANK_MODE = [1, 2, 3, 4]
HEURISTIC_WEIGHTS = [(100, 0, 0), (0, 100, 0), (0, 0, 100), (1 / 3, 1 / 3, 1 / 3)]
MD_QUERY = "testMultiDips({rank_mode}, {heuristic_weight}, Profit, Carbon, Energy, Placement, AllocBW, UnsatProps, Infs, Time)."
MILP_QUERY = "milp(Nodes, Res_j, Layer_j, Vnfs, OnlyVnfs, Dim_i, ReqHW_i, Layer_i, Lat_i, BWReq, MaxLat, LinkBW_jk, LinkLat_jk, MaxEmissions, BW_Energy, BW_emissions, Carbon_ij, Energy_ij, Profit_ij)."

# --- PARSE UTILITY FUNCTIONS ---

# TIMESTAMP = strftime("%Y%m%d-%H%M%S")
TIMESTAMP = strftime("%Y%m%d")

def parse_list(s):
    return [x.strip() for x in s.split(",")] if s else []

def parse_energy_mix(s):
    return [
        (x.strip().split(",")[0], x.strip().split(",")[1])
        for x in s[1:-1].split("), (")
    ]

def parse_prolog(query):
    if isinstance(query, dict):
        ans = {k: parse_prolog(v) for k, v in query.items()}
    elif isinstance(query, list):
        ans = [parse_prolog(v) for v in query]
    elif isinstance(query, Atom):
        ans = query.value
    elif isinstance(query, Functor):
        """fun = query.name.value
        if fun != ",": # prolog tuple
            ans = (fun,parse_prolog(query.args))
        else:
            ans = tuple(parse_prolog(query.args))"""
        ans = tuple(parse_prolog(query.args))
    else:
        ans = query
    return ans

class ParseError(ValueError):
    def __init__(self, message):
        super().__init__(message)
