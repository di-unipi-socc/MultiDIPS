import json
from itertools import product
from os import makedirs
from os.path import dirname, exists, join

import click
import networkx as nx
import numpy as np
import parse as p
import templates as t
from numpy import random as rnd
from enum import Enum

LAT_MIN, LAT_MAX = 2, 40
BW_MIN, BW_MAX = 100, 500

EDGE_PRICE = (0.030, 0.060, 0.00050)
CLOUD_PRICE = (0.015, 0.030, 0.00025)

INFR_CHANGING_PROPERTIES = [('logging', 'logVF'), ('privacy', 'encVF'), ('security', 'authVF'), ('caching', 'cacheVF'), ('compression', 'compVF'), ('encoding', 'encodeVF')]

GCI_VALUE = 0.475

KWH_PER_MB_VALUE = 0.00008

MAX_EMISSIONS_PER_NODE = 0.130

MAX_ENERGY_PER_NODE = 0.200

TYPES   = ['cloud', 'edge']
PROBS   = [0.35, 0.65]

DISC_PREDICATES = {'node': 3, 'totHW': 2, 'pue': 2, 'ramEnergyProfile': 3, 'cpuEnergyProfile': 3, 'storageEnergyProfile': 3, 'energySourceMix': 2, 'energyCost': 2}

EMISSIONS = {'gas': 0.610, 
             'coal': 1.1, 
             'onshorewind': 0.0097,
             'offshorewind': 0.0165,
             'solar': 0.05} # https://solarbay.com.au/portfolio-item/how-much-emissions-does-solar-power-prevent/


PRICE = {'edge': (0.030, 0.060, 0.00050), 'cloud': (0.015, 0.030, 0.00025)}


def get_random_sample(l, size=1):
	return list(rnd.choice(l, size=size, replace=False))

def generate_energy_mix():
	# get 2 or 3 random energy sources
	k = rnd.randint(2,4)
	sources = get_random_sample(list(EMISSIONS.keys()), size=k)
	probs = np.around(rnd.dirichlet(np.ones(k),size=1)[0], 2)
	return [(p, s) for p, s in zip(probs, sources)]

def trunc_range(x, mmin, mmax):
	return max(min(x, mmax), mmin)


class GlobalIntent():
	def __init__(self, type: str, bound: str, value: float, unit: str):
		self.type = type
		self.bound = bound
		self.value = value
		self.unit = unit

	def __str__(self):
		return t.GLOBAL_INTENT.format(type=self.type, bound=self.bound, value=self.value, unit=self.unit)
	
	def __repr__(self):
		return self.__str__()
	

class CProperty():
	def __init__(self, property: str, vnf: str):
		self.property = property
		self.vnf = vnf

	def __str__(self):
		return t.INFR_CHANGING_PROPERTY.format(property=self.property,vnf=self.vnf)
	
	def __repr__(self):
		return self.__str__()
	

class Node():
	def __init__(self, nid: str = "", type: str = "", HWcaps: tuple = (0,0,0), 
	      		 	   totHW: tuple = (0,0,0), ramkWh: float = 0.0, CPUkWh: float = 0.0, storagekWh: float = 0.0,
					   pue: float = 0.0, energy_mix: list = [], energyCost: float = 0.0):
		self.id = nid
		self.type = type
		self.HWcaps = HWcaps
		self.totHW = totHW
		self.ramkWh = ramkWh
		self.CPUkWh = CPUkWh
		self.storagekWh = storagekWh
		self.pue = pue
		self.mix = energy_mix
		self.energyCost = energyCost

	def __str__(self):
		d = self.__dict__.copy()
		d["mix"] = ", ".join([f"({p},{s})" for p, s in d["mix"]])
		out = t.NODE.format(**d)
		out += "\n\t" + t.TOT_HW.format(**d)
		out += "\n\t" + t.PUE.format(**d)
		out += "\n\t" + t.ENERGY_SOURCE_MIX.format(**d)
		out += "\n\t" + t.RAM_ENERGY_PROFILE.format(**d)
		out += "\n\t" + t.CPU_ENERGY_PROFILE.format(**d)
		out += "\n\t" + t.STORAGE_ENERGY_PROFILE.format(**d)
		out += "\n\t" + t.ENERGY_COST.format(**d)
		return out + "\n"
	
	def __repr__(self):
		return self.__str__()
	
	
class Link():
	def __init__(self, source: Node, dest: Node, lat: float, bw: float):
		self.source = source
		self.dest = dest
		self.lat = lat
		self.bw = bw

	def __str__(self):
		d = self.__dict__.copy()
		d["source"] = d["source"].id
		d["dest"] = d["dest"].id
		return t.LINK.format(**d) + "\n"
	
	def __repr__(self):
		return self.__str__()


class Infrastructure(nx.DiGraph):
	def __init__(self, size=0, gintentType='footprint', path=t.INFRS_DIR, seed=None):
		
		super().__init__()
		self._size = size
		self.gintentType = gintentType
		self.globalIntents = []
		self.changingProperties = []
		self.id = f"infr{self._size}"
		self.file = join(path, f"{self.id}.pl")

		with open(t.VALUES_FILE, "r") as f:
			self._values = json.load(f)

		rnd.seed(seed)

	def add_gintent(self, gintent):
		self.globalIntents.append(gintent)

	def add_chaingingProperties(self, cproperty):
		self.changingProperties.append(cproperty)

	def add_node(self, node):
		super().add_node(node.id, obj=node)

	def add_link(self, link):
		super().add_edge(link.source.id, link.dest.id, lat=link.lat, obj=link)

	def generate(self):
		self._generate_global_intent()
		self._generate_cproperty()
		self._generate_nodes()
		self._generate_links()

	def _generate_global_intent(self):
		unit = "kg" if self.gintentType=='footprint' else "kWh"
		value = self._size * MAX_EMISSIONS_PER_NODE if self.gintentType=='footprint' else self._size * MAX_ENERGY_PER_NODE
		self.add_gintent(GlobalIntent(type=self.gintentType, bound="smaller", value=value, unit=unit))

	def _generate_cproperty(self):
		for prop,vnf in INFR_CHANGING_PROPERTIES:
			self.add_chaingingProperties(CProperty(property=prop, vnf=vnf))

	def _generate_nodes(self):
		Ncloud = 1
		Nedge = 1
		for i in range(self._size):
			type 	= rnd.choice(TYPES, p=PROBS)
			
			if(type == 'edge'):
				nid = type + str(Nedge) 
				Nedge +=1
			else:
				nid = type + str(Ncloud) 
				Ncloud +=1

			totRamHW 	= rnd.randint(self._values[type]['totRamHW']['lb'], self._values[type]['totRamHW']['ub'])
			totCPUHW 	= rnd.randint(self._values[type]['totCPUHW']['lb'], self._values[type]['totCPUHW']['ub'])
			totStorageHW 	= rnd.randint(self._values[type]['totStorageHW']['lb'], self._values[type]['totStorageHW']['ub'])

			hwUsage = rnd.uniform(1.0,1.4)
			ramHWCap = int(totRamHW // hwUsage)
			CPUHWCap = int(totCPUHW // hwUsage)
			storageHWCap = int(totStorageHW // hwUsage)

			ramUnitkWh 	= rnd.uniform(self._values[type]['ramUnitkWh']['lb'], self._values[type]['ramUnitkWh']['ub'])
			CPUUnitkWh 	= rnd.uniform(self._values[type]['CPUUnitkWh']['lb'], self._values[type]['CPUUnitkWh']['ub'])
			storageUnitkWh 	= rnd.uniform(self._values[type]['storageUnitkWh']['lb'], self._values[type]['storageUnitkWh']['ub'])

			ramkWh = np.around(ramUnitkWh * totRamHW,3)
			CPUkWh = np.around(CPUUnitkWh * totCPUHW,3)
			storagekWh = np.around(storageUnitkWh * (totStorageHW/100),3)

			pue 	= np.around(rnd.uniform(self._values[type]["pue"]["lb"], self._values[type]["pue"]["ub"]), 2)
			mix 	= generate_energy_mix()

			energyCost = np.around(rnd.uniform(self._values[type]['energyCost']['lb'], self._values[type]['energyCost']['ub']),3)

			self.add_node(Node(nid=nid, type=type, HWcaps=(ramHWCap, CPUHWCap, storageHWCap), totHW=(totRamHW, totCPUHW, totStorageHW), ramkWh=ramkWh,
		      					CPUkWh=CPUkWh, storagekWh=storagekWh, pue=pue, energy_mix=mix, energyCost=energyCost))
			
		
	def _generate_links(self):		
		for s, d in product(self.nodes, repeat=2):
			if s != d:
				lat = rnd.randint(LAT_MIN, LAT_MAX)
				bw = rnd.randint(BW_MIN, BW_MAX)
				self.add_link(Link(self.nodes[s]["obj"], self.nodes[d]["obj"], lat, bw))
		"""
		sp = nx.floyd_warshall_numpy(self, weight="lat")
		for s,d in self.edges():
			nx.set_edge_attributes(self, {(s,d): {"lat": sp[s,d]}})
			self.edges[s,d]["obj"].lat = sp[s,d]	
		"""
	def _get_discontiguous(self):
		return "\n".join(t.DISCONTIGUOUS.format(s, d) for s, d in DISC_PREDICATES.items())
		
	def _get_global_intents(self):
		out=""
		for i in self.globalIntents:
			out += str(i) + "\n"
		return out

	def _get_changing_properties(self):
		out=""
		for i in self.changingProperties:
			out += str(i) + "\n"
		return out
	
	def _get_GCI(self):
		return t.GCI.format(value=GCI_VALUE)
	
	def _get_kWhperMB(self):
		return t.KWH_PER_MB.format(value=KWH_PER_MB_VALUE)
	
	def _get_price(self):
		return t.PRICE.format(type="edge", price=EDGE_PRICE) + "\n" + t.PRICE.format(type="cloud", price=CLOUD_PRICE)
	
	def _get_nodes(self):
		nodes = list(n for _, n in self.nodes(data="obj"))
		rnd.shuffle(nodes)
		return "\n".join(str(n) for n in nodes)
	
	def _get_links(self):
		links = list(l for _,_,l in self.edges(data="obj"))
		rnd.shuffle(links)
		return "".join(str(l) for l in links)
	
	def _get_emissions(self):
		return "\n".join(t.EMISSION.format(s=s, p=p) for s, p in EMISSIONS.items())

	def __str__(self):
		out = self._get_discontiguous() + "\n\n"
		out += self._get_global_intents() + "\n\n"
		out += self._get_changing_properties() + "\n\n"
		out += self._get_emissions() + "\n\n"
		out += self._get_kWhperMB() + "\n\n"
		out += self._get_GCI() + "\n\n"
		out += self._get_price() + "\n\n"
		out += self._get_nodes() + "\n\n"
		out += self._get_links()
		return out
	
	def __repr__(self):
		return self.__str__()
	
	def parse(self, file=None):
		file = file if file else self.file
		if not exists(file):
			raise FileNotFoundError(f"File {file} not found.")
		else:
			with open(file, "r") as f:
				lines = f.read().splitlines()

				for i in range(len(lines)):
					lines[i] = lines[i].strip()

				self.parse_global_intent([i for i in lines if i.startswith("globalIntent(")])
				self.parse_changing_properties([i for i in lines if i.startswith("changingProperty(")])
				self.parse_nodes([i for i in lines if i.startswith("node(")])
				self.parse_links([i for i in lines if i.startswith("link(")])
				self.parse_tot_hws([i for i in lines if i.startswith("totHW(")])
				self.parse_pues([i for i in lines if i.startswith("pue(")])
				self.parse_ram_energy_profiles([i for i in lines if i.startswith("ramEnergyProfile(")])
				self.parse_cpu_energy_profiles([i for i in lines if i.startswith("cpuEnergyProfile(")])
				self.parse_storage_energy_profiles([i for i in lines if i.startswith("storageEnergyProfile(")])
				self.parse_energy_source_mixes([i for i in lines if i.startswith("energySourceMix(")])
				self.parse_energy_cost([i for i in lines if i.startswith("energyCost(")])


	def parse_global_intent(self, gintents):
		for gintent in gintents:
			gintent = p.parse(t.GLOBAL_INTENT, gintent)
			if gintent:
				type= gintent["type"]
				bound = gintent["bound"]
				value = gintent["value"]
				unit = gintent["unit"]
				self.add_gintent(GlobalIntent(type=type, bound=bound, value=value, unit=unit))

	def parse_changing_properties(self, cproperties):
		for cproperty in cproperties:
			cproperty = p.parse(t.INFR_CHANGING_PROPERTY, cproperty)
			if cproperty:
				property = cproperty["property"]
				vnf = cproperty["vnf"]
				self.add_chaingingProperties(CProperty(property=property, vnf=vnf))

	def parse_nodes(self, nodes):
		for n in nodes:
			node = p.parse(t.NODE, n)
			if node:
				nid = node["id"]
				type = node["type"]
				HWcaps = node["HWcaps"]
				self.add_node(Node(nid=nid, type=type, HWcaps=HWcaps))
			else:
				raise t.ParseError(f"Node {n} not valid.")
			
		self._size = len(self.nodes)
		self.id = f"infr{self._size}"
			
	def parse_links(self, links):
		for l in links:
			link = p.parse(t.LINK, l)
			if link:
				s 	= link["source"]
				d 	= link["dest"]
				lat = int(link["lat"])
				bw 	= int(link["bw"])
				if (s in self.nodes and d in self.nodes):
					self.add_link(Link(self.nodes[s]['obj'], self.nodes[d]['obj'], lat, bw))
				else:
					raise t.ParseError(f"Link {l} not valid. Source {s} or destination {d} not found.")
			else:
				raise t.ParseError(f"Link {l} not valid.")
			
	def parse_tot_hws(self, tothws):
		for hw in tothws:
			hw = p.parse(t.TOT_HW, hw)
			if hw:
				self.nodes[hw["id"]]["obj"].totHW = hw["totHW"]
			else:
				raise t.ParseError(f"Total HW {hw} not valid.")


	def parse_pues(self, pues):
		for pue in pues:
			pue = p.parse(t.PUE, pue)
			if pue:
				self.nodes[pue["id"]]["obj"].pue = float(pue["pue"])
			else:
				raise t.ParseError(f"PUE {pue} not valid.")


	def parse_ram_energy_profiles(self, profiles):
		for profile in profiles:
			profile = p.parse(t.RAM_ENERGY_PROFILE, profile)
			if profile:
				self.nodes[profile["id"]]["obj"].ramkWh = float(profile["ramkWh"])
			else:
				raise t.ParseError(f"RAM Energy profile {profile} not valid.")
			

	def parse_cpu_energy_profiles(self, profiles):
		for profile in profiles:
			profile = p.parse(t.CPU_ENERGY_PROFILE, profile)
			if profile:
				self.nodes[profile["id"]]["obj"].CPUkWh = float(profile["CPUkWh"])
			else:
				raise t.ParseError(f"Energy profile {profile} not valid.")


	def parse_storage_energy_profiles(self, profiles):
		for profile in profiles:
			profile = p.parse(t.STORAGE_ENERGY_PROFILE, profile)
			if profile:
				self.nodes[profile["id"]]["obj"].storagekWh = float(profile["storagekWh"])
			else:
				raise t.ParseError(f"Energy profile {profile} not valid.")
			

	def parse_energy_source_mixes(self, mixes):
		for mix in mixes:
			mix = p.parse(t.ENERGY_SOURCE_MIX, mix)
			if mix:
				self.nodes[mix["id"]]["obj"].mix = t.parse_energy_mix(mix["mix"])
			else:
				raise t.ParseError(f"Energy source mix {mix} not valid.")

	def parse_energy_cost(self, costs):
		for cost in costs:
			cost = p.parse(t.ENERGY_COST, cost)
			if cost:
				self.nodes[cost["id"]]["obj"].energyCost = float(cost["energyCost"])
			else:
				raise t.ParseError(f"Energy cost {cost} not valid.")

	def reset(self):
		reset_file = join(t.INFRS_DIR, f"{self.id}.pl")
		if exists(reset_file):
			self.parse(reset_file)
			self.upload()
	
	def upload(self, file=None):
		file = self.file if not file else file
		makedirs(dirname(file)) if not exists(dirname(file)) else None		
		with open(file, "w+") as f:
			f.write(str(self))


@click.command()
@click.argument("sizes", type=int, nargs=-1)
@click.option("--gintent", "-g", type=click.Choice(['footprint', 'energy']), default='footprint', help="Type of cap in the global intent" )
@click.option("--path", "-p", type=click.Path(exists=True, writable=True), default=t.INFRS_DIR, help="Directory path to save the infrastructure.")
@click.option("--seed", "-s", type=int, default=None, help="Seed for random generator.")
def main(sizes, gintent, path, seed):
	for size in sizes:
		infr = Infrastructure(size=size, gintentType=gintent, path=path, seed=seed)
		infr.generate()
		infr.upload()
		print(f"{infr.id} generated.")


if __name__ == "__main__":
	main()