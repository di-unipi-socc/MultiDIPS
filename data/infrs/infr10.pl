:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

globalIntent(footprint, smaller, 1.03, kg).

changingProperty(logging, logVF).
changingProperty(privacy, encVF).
changingProperty(security, authVF).
changingProperty(caching, cacheVF).
changingProperty(compression, compVF).
changingProperty(encoding, encodeVF).

emissions(gas, 0.61).
emissions(coal, 1.1).
emissions(onshorewind, 0.0097).
emissions(offshorewind, 0.0165).
emissions(solar, 0.05).

kWhPerMB(8e-05).

averageGCI(0.475).

price(edge, (0.03, 0.06, 0.0005)).
price(cloud, (0.015, 0.03, 0.00025)).

node(cloud1, cloud, (355, 26, 10030)).
	totHW(cloud1, (369, 27, 10413)).
	pue(cloud1, 1.4).
	energySourceMix(cloud1, [(0.14,solar), (0.86,onshorewind)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.124 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.28 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.062 * L.
	energyCost(cloud1, 0.497).

node(edge1, edge, (13, 9, 1128)).
	totHW(edge1, (18, 13, 1511)).
	pue(edge1, 1.08).
	energySourceMix(edge1, [(0.48,coal), (0.52,gas)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.175 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.014 * L.
	energyCost(edge1, 0.13).

node(cloud2, cloud, (183, 34, 6903)).
	totHW(cloud2, (237, 44, 8683)).
	pue(cloud2, 1.21).
	energySourceMix(cloud2, [(0.43,solar), (0.49,onshorewind), (0.08,offshorewind)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.086 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.404 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.034 * L.
	energyCost(cloud2, 0.489).

node(edge2, edge, (25, 8, 1261)).
	totHW(edge2, (32, 11, 1580)).
	pue(edge2, 1.1).
	energySourceMix(edge2, [(0.07,onshorewind), (0.93,solar)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.151 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.011 * L.
	energyCost(edge2, 0.478).

node(edge3, edge, (13, 9, 1174)).
	totHW(edge3, (18, 13, 1567)).
	pue(edge3, 1.08).
	energySourceMix(edge3, [(0.42,gas), (0.29,coal), (0.29,onshorewind)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.008 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.191 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.014 * L.
	energyCost(edge3, 0.223).

node(edge4, edge, (29, 7, 1686)).
	totHW(edge4, (31, 8, 1748)).
	pue(edge4, 1.12).
	energySourceMix(edge4, [(0.47,gas), (0.53,coal)]).
	ramEnergyProfile(edge4, L, E) :- E is 0.016 * L.
	cpuEnergyProfile(edge4, L, E) :- E is 0.117 * L.
	storageEnergyProfile(edge4, L, E) :- E is 0.017 * L.
	energyCost(edge4, 0.122).

node(edge5, edge, (38, 8, 1177)).
	totHW(edge5, (39, 9, 1205)).
	pue(edge5, 1.15).
	energySourceMix(edge5, [(0.22,gas), (0.35,solar), (0.43,offshorewind)]).
	ramEnergyProfile(edge5, L, E) :- E is 0.018 * L.
	cpuEnergyProfile(edge5, L, E) :- E is 0.109 * L.
	storageEnergyProfile(edge5, L, E) :- E is 0.01 * L.
	energyCost(edge5, 0.415).

node(edge6, edge, (23, 9, 1302)).
	totHW(edge6, (29, 12, 1607)).
	pue(edge6, 1.11).
	energySourceMix(edge6, [(0.25,gas), (0.75,coal)]).
	ramEnergyProfile(edge6, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge6, L, E) :- E is 0.158 * L.
	storageEnergyProfile(edge6, L, E) :- E is 0.014 * L.
	energyCost(edge6, 0.098).

node(cloud3, cloud, (207, 34, 9337)).
	totHW(cloud3, (266, 44, 11999)).
	pue(cloud3, 1.17).
	energySourceMix(cloud3, [(0.32,onshorewind), (0.53,solar), (0.14,offshorewind)]).
	ramEnergyProfile(cloud3, L, E) :- E is 0.085 * L.
	cpuEnergyProfile(cloud3, L, E) :- E is 0.452 * L.
	storageEnergyProfile(cloud3, L, E) :- E is 0.068 * L.
	energyCost(cloud3, 0.487).

node(edge7, edge, (29, 9, 573)).
	totHW(edge7, (40, 13, 773)).
	pue(edge7, 1.14).
	energySourceMix(edge7, [(0.02,solar), (0.98,offshorewind)]).
	ramEnergyProfile(edge7, L, E) :- E is 0.02 * L.
	cpuEnergyProfile(edge7, L, E) :- E is 0.173 * L.
	storageEnergyProfile(edge7, L, E) :- E is 0.005 * L.
	energyCost(edge7, 0.496).

link(cloud1, edge1, 29, 248).
link(edge1, cloud1, 29, 248).
link(cloud1, cloud2, 13, 513).
link(cloud2, cloud1, 13, 513).
link(cloud1, edge7, 27, 259).
link(edge7, cloud1, 27, 259).
link(edge2, cloud1, 45, 200).
link(cloud1, edge2, 45, 200).
link(cloud1, edge3, 43, 274).
link(edge3, cloud1, 43, 274).
link(cloud1, edge4, 69, 210).
link(edge4, cloud1, 69, 210).
link(cloud1, edge5, 59, 234).
link(edge5, cloud1, 59, 234).
link(cloud1, edge6, 70, 244).
link(edge6, cloud1, 70, 244).
link(cloud1, cloud3, 67, 620).
link(cloud3, cloud1, 67, 620).
link(edge1, edge2, 33, 155).
link(edge2, edge1, 33, 155).
link(edge1, edge4, 40, 103).
link(edge4, edge1, 40, 103).
link(edge1, cloud3, 38, 255).
link(cloud3, edge1, 38, 255).
link(edge1, edge7, 21, 133).
link(edge7, edge1, 21, 133).
link(edge3, edge1, 43, 145).
link(edge1, edge3, 43, 145).
link(edge1, cloud2, 42, 288).
link(cloud2, edge1, 42, 288).
link(edge1, edge5, 59, 175).
link(edge5, edge1, 59, 175).
link(edge1, edge6, 64, 192).
link(edge6, edge1, 64, 192).
link(cloud2, edge3, 30, 218).
link(edge3, cloud2, 30, 218).
link(cloud2, edge6, 75, 234).
link(edge6, cloud2, 75, 234).
link(cloud2, edge7, 64, 218).
link(edge7, cloud2, 64, 218).
link(edge4, cloud2, 57, 255).
link(cloud2, edge4, 57, 255).
link(edge5, cloud2, 76, 281).
link(cloud2, edge5, 76, 281).
link(cloud2, edge2, 58, 237).
link(edge2, cloud2, 58, 237).
link(cloud2, cloud3, 80, 596).
link(cloud3, cloud2, 80, 596).
link(edge2, edge3, 32, 137).
link(edge3, edge2, 32, 137).
link(edge2, edge5, 32, 119).
link(edge5, edge2, 32, 119).
link(edge2, edge7, 48, 190).
link(edge7, edge2, 48, 190).
link(edge4, edge2, 25, 120).
link(edge2, edge4, 25, 120).
link(edge6, edge2, 47, 147).
link(edge2, edge6, 47, 147).
link(edge2, cloud3, 65, 293).
link(cloud3, edge2, 65, 293).
link(edge3, edge4, 47, 170).
link(edge4, edge3, 47, 170).
link(edge3, cloud3, 62, 230).
link(cloud3, edge3, 62, 230).
link(edge3, edge7, 22, 112).
link(edge7, edge3, 22, 112).
link(edge5, edge3, 16, 112).
link(edge3, edge5, 16, 112).
link(edge3, edge6, 65, 175).
link(edge6, edge3, 65, 175).
link(edge4, edge5, 36, 179).
link(edge5, edge4, 36, 179).
link(edge4, cloud3, 40, 212).
link(cloud3, edge4, 40, 212).
link(edge6, edge4, 46, 124).
link(edge4, edge6, 46, 124).
link(edge7, edge4, 43, 157).
link(edge4, edge7, 43, 157).
link(edge5, edge7, 49, 159).
link(edge7, edge5, 49, 159).
link(edge5, edge6, 79, 106).
link(edge6, edge5, 79, 106).
link(edge5, cloud3, 76, 239).
link(cloud3, edge5, 76, 239).
link(edge6, cloud3, 30, 241).
link(cloud3, edge6, 30, 241).
link(edge6, edge7, 43, 188).
link(edge7, edge6, 43, 188).
link(edge7, cloud3, 41, 243).
link(cloud3, edge7, 41, 243).
link(N, N, 0, 100000).