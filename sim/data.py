from os.path import abspath, dirname, join
from time import strftime
from pyswip import Atom, Functor

# --- INFRASTRACTURES CONSTANTS ---
LAT_MAX_VALUE = 100000
BW_MIN_VALUE = 0
FAIL_PROB = 0.03
LINK_PROBABILITY = 0.5
EDGE_PRICE = (0.030, 0.060, 0.0005)
CLOUD_PRICE = (0.015, 0.030, 0.00025)
GCI_VALUE = 0.475
KWH_PER_MB_VALUE = 0.00008
LOW_LIMIT_REDUCTION = 10
RESOURCES_TYPES = ["RAM", "CPU", "STORAGE"]
TYPES = ["cloud", "edge"]
PROBS = [0.25, 0.75]
MAX_HW_USAGE = 1.35
VARIATION = {
    "hw": {"lb": 0.5, "ub": 1.35},
    "lat": {"lb": 0.5, "ub": 2},
    "bw": {"lb": 0.5, "ub": 2},
}
INFR_CHANGING_PROPERTIES = [
    ("logging", "logVF"),
    ("privacy", "encVF"),
    ("security", "authVF"),
    ("caching", "cacheVF"),
    ("compression", "compVF"),
    ("encoding", "encodeVF"),
]
INFR_DISC_PREDICATES = {
    "node": 3,
    "totHW": 2,
    "pue": 2,
    "ramEnergyProfile": 3,
    "cpuEnergyProfile": 3,
    "storageEnergyProfile": 3,
    "energySourceMix": 2,
    "energyCost": 2,
}
EMISSIONS = {
    "gas": 0.610,
    "coal": 1.1,
    "onshorewind": 0.0097,
    "offshorewind": 0.0165,
    "solar": 0.05,
}
ENERGY_COSTS = {
    "Denmark": 0.417,
    "Belgium": 0.479,
    "Czechia": 0.480,
    "Italy": 0.517,
    "Romania": 0.283,
    "Germany": 0.383,
    "Spain": 0.494,
    "Cyprus": 0.452,
    "Ireland": 0.524,
    "Sweden": 0.409,
    "Greece": 0.529,
    "Austria": 0.329,
    "Norway": 0.519,
    "Finland": 0.349,
    "Moldova": 0.166,
    "Portugal": 0.459,
    "France": 0.342,
    "Luxembourg": 0.299,
    "Slovenia": 0.218,
    "Iceland": 0.290,
    "Serbia": 0.215,
    "Hungary": 0.064,
    "Lithuania": 0.238,
    "Estonia": 0.233,
    "Latvia": 0.276,
    "Bulgaria": 0.097,
    "Albania": 0.081,
    "Poland": 0.146,
    "Georgia": 0.063,
    "Croatia": 0.191,
    "Montenegro": 0.116,
    "North Macedonia": 0.099,
    "Kosovo": 0.072,
    "Bosnia": 0.166,
    "Slovakia": 0.215
}

# --- INTENT CONSTANT ---
INT_DISC_PREDICATES = {
    "intent": 4,
    "propertyExpectation": 5,
    "propertyExpectation#": 8,
    "target": 2,
    "vnf": 3,
    "vnfXUser": 4,
}

# --- DIRECTORIES & FILES ---

ROOT_DIR = dirname(dirname(abspath(__file__)))
SIM_DIR = join(ROOT_DIR, "sim")
INFRS_DIR = join(ROOT_DIR, "data", "infrs")
INTENTS_DIR = join(ROOT_DIR, "data", "intents")
SRC_INTENT_DIR = join(ROOT_DIR, "src", "intentsData.pl")
RESULTS_DIR = join(SIM_DIR, "results")
PLOTS_DIR = join(SIM_DIR, "plots")
MODELS_DIR = join(SIM_DIR, "models")

VALUES_FILE = join(SIM_DIR, "values.json")
SIM_PL_FILE = join(SIM_DIR, "sim.pl")
MILP_PL_FILE = join(SIM_DIR, "milp.pl")
RESULTS_FILE = join(RESULTS_DIR, "{intents}-{infr}-{timestamp}.csv")
LOW_RESULT_FILE = join(RESULTS_DIR, "low-{intents}-{infr}-{timestamp}.csv")
TMP_RES_FILE = join(RESULTS_DIR, "{intents}-{infr}-{timestamp}-tmp.csv")
ALL_RESULTS = join(RESULTS_DIR, "*.csv")
MODELS_FILE = join(MODELS_DIR, "{name}.mps")

PLOT_FORMAT = "pdf"
TXT_FORMAT = "txt"
PLOT_PATH = join(PLOTS_DIR, "{name}." + PLOT_FORMAT)
TXT_PATH = join(PLOTS_DIR, "{name}." + TXT_FORMAT)
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
CHANGING_PROPERTY = (
    "propertyExpectation({intentId}, {property}, {bound}, {From}, {To})."
)
NON_CHANGING_PROPERTY = "propertyExpectation({intentId}, {property}, {bound}, {level}, {value}, {unit}, {From}, {To})."
TARGET = "target({targetId}, {targetChain})."
VNF = "vnf({id}, {level}, {processTime})."
VNFXUSERS = "vnfXUser({id}, {version}, {usersRange}, {HWReqs})."

# --- QUERY TEMPLATES ---
INTENTS_RANK_MODE = {1: "Longest", 2: "Hungriest", 3: "Random"}
NODES_RANK_MODE = {
    1: "Profit",
    2: "Carbon",
    3: "Free HW",
    4: "Balanced",
    5: "Random"
}
NODES_RANK_WEIGHT = {
    1: (100, 0, 0),
    2: (0, 100, 0),
    3: (0, 0, 100),
    4: (33.33, 33.33, 33.33),
    5: (0, 0, 0)
}
MD_QUERY = "testMultiDips({intents_rank_mode}, {nodes_rank_mode}, {heuristic_weights}, Profit, Carbon, Energy, Placement, UnsatProps, Infs, Time)."
MILP_QUERY = "milp(Nodes, Res_j, Layer_j, Vnfs, OnlyVnfs, Dim_i, ReqHW_i, Layer_i, Lat_i, BWReq, MaxLat, LinkBW_jk, LinkLat_jk, MaxEmissions, BW_Energy, BW_emissions, Carbon_ij, Energy_ij, Profit_ij)."

# --- PARSE UTILITY FUNCTIONS ---

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
