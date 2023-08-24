:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

globalIntent(footprint, smaller, 0.314, kg).

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

node(cloud1, cloud, (196, 40, 8753)).
	totHW(cloud1, (218, 45, 9732)).
	pue(cloud1, 1.17).
	energySourceMix(cloud1, [(0.76,coal), (0.24,solar)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.078 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.447 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.051 * L.
	energyCost(cloud1, 0.233).

node(cloud2, cloud, (109, 26, 8254)).
	totHW(cloud2, (146, 35, 11009)).
	pue(cloud2, 1.47).
	energySourceMix(cloud2, [(0.14,solar), (0.86,onshorewind)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.054 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.418 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.088 * L.
	energyCost(cloud2, 0.218).

node(edge1, edge, (21, 6, 1202)).
	totHW(edge1, (29, 9, 1587)).
	pue(edge1, 1.1).
	energySourceMix(edge1, [(0.16,gas), (0.84,offshorewind)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.016 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.119 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.014 * L.
	energyCost(edge1, 0.166).

node(edge2, edge, (26, 12, 744)).
	totHW(edge2, (29, 14, 816)).
	pue(edge2, 1.06).
	energySourceMix(edge2, [(0.38,coal), (0.62,offshorewind)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.177 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.007 * L.
	energyCost(edge2, 0.116).

node(edge3, edge, (23, 9, 621)).
	totHW(edge3, (31, 12, 824)).
	pue(edge3, 1.16).
	energySourceMix(edge3, [(0.34,gas), (0.03,offshorewind), (0.63,solar)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.176 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.006 * L.
	energyCost(edge3, 0.166).

node(cloud3, cloud, (184, 36, 9217)).
	totHW(cloud3, (190, 38, 9517)).
	pue(cloud3, 1.35).
	energySourceMix(cloud3, [(0.55,solar), (0.42,gas), (0.03,offshorewind)]).
	ramEnergyProfile(cloud3, L, E) :- E is 0.058 * L.
	cpuEnergyProfile(cloud3, L, E) :- E is 0.373 * L.
	storageEnergyProfile(cloud3, L, E) :- E is 0.056 * L.
	energyCost(cloud3, 0.329).

node(edge4, edge, (21, 8, 1628)).
	totHW(edge4, (22, 9, 1673)).
	pue(edge4, 1.12).
	energySourceMix(edge4, [(0.61,solar), (0.23,offshorewind), (0.16,onshorewind)]).
	ramEnergyProfile(edge4, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge4, L, E) :- E is 0.124 * L.
	storageEnergyProfile(edge4, L, E) :- E is 0.017 * L.
	energyCost(edge4, 0.383).

node(edge5, edge, (18, 11, 1272)).
	totHW(edge5, (19, 12, 1275)).
	pue(edge5, 1.1).
	energySourceMix(edge5, [(0.13,offshorewind), (0.84,solar), (0.04,coal)]).
	ramEnergyProfile(edge5, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge5, L, E) :- E is 0.176 * L.
	storageEnergyProfile(edge5, L, E) :- E is 0.011 * L.
	energyCost(edge5, 0.072).

node(edge6, edge, (18, 11, 612)).
	totHW(edge6, (23, 14, 778)).
	pue(edge6, 1.15).
	energySourceMix(edge6, [(0.87,gas), (0.03,coal), (0.1,onshorewind)]).
	ramEnergyProfile(edge6, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge6, L, E) :- E is 0.174 * L.
	storageEnergyProfile(edge6, L, E) :- E is 0.008 * L.
	energyCost(edge6, 0.166).

node(edge7, edge, (18, 7, 1198)).
	totHW(edge7, (25, 10, 1608)).
	pue(edge7, 1.11).
	energySourceMix(edge7, [(0.57,gas), (0.05,solar), (0.39,coal)]).
	ramEnergyProfile(edge7, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge7, L, E) :- E is 0.122 * L.
	storageEnergyProfile(edge7, L, E) :- E is 0.01 * L.
	energyCost(edge7, 0.233).

link(cloud1, edge1, 63, 241).
link(edge1, cloud1, 63, 241).
link(cloud1, edge2, 88, 299).
link(edge2, cloud1, 88, 299).
link(cloud1, edge3, 71, 270).
link(edge3, cloud1, 71, 270).
link(cloud1, edge4, 76, 255).
link(edge4, cloud1, 76, 255).
link(cloud1, edge6, 93, 287).
link(edge6, cloud1, 93, 287).
link(cloud1, edge7, 74, 266).
link(edge7, cloud1, 74, 266).
link(cloud2, cloud1, 10, 578).
link(cloud1, cloud2, 10, 578).
link(edge5, cloud1, 73, 266).
link(cloud1, edge5, 73, 266).
link(cloud1, cloud3, 31, 581).
link(cloud3, cloud1, 31, 581).
link(cloud2, edge5, 71, 255).
link(edge5, cloud2, 71, 255).
link(cloud2, edge6, 84, 251).
link(edge6, cloud2, 84, 251).
link(cloud2, edge7, 64, 232).
link(edge7, cloud2, 64, 232).
link(edge3, cloud2, 81, 271).
link(cloud2, edge3, 81, 271).
link(cloud3, cloud2, 21, 881).
link(cloud2, cloud3, 21, 881).
link(cloud2, edge1, 71, 295).
link(edge1, cloud2, 71, 295).
link(cloud2, edge2, 80, 216).
link(edge2, cloud2, 80, 216).
link(cloud2, edge4, 86, 282).
link(edge4, cloud2, 86, 282).
link(edge1, cloud3, 50, 297).
link(cloud3, edge1, 50, 297).
link(edge1, edge4, 23, 162).
link(edge4, edge1, 23, 162).
link(edge1, edge5, 30, 127).
link(edge5, edge1, 30, 127).
link(edge1, edge6, 30, 159).
link(edge6, edge1, 30, 159).
link(edge1, edge2, 45, 152).
link(edge2, edge1, 45, 152).
link(edge1, edge3, 57, 138).
link(edge3, edge1, 57, 138).
link(edge1, edge7, 50, 199).
link(edge7, edge1, 50, 199).
link(edge2, edge4, 28, 105).
link(edge4, edge2, 28, 105).
link(edge2, edge5, 15, 146).
link(edge5, edge2, 15, 146).
link(edge2, edge7, 16, 175).
link(edge7, edge2, 16, 175).
link(edge2, edge3, 37, 125).
link(edge3, edge2, 37, 125).
link(edge2, cloud3, 65, 281).
link(cloud3, edge2, 65, 281).
link(edge2, edge6, 36, 147).
link(edge6, edge2, 36, 147).
link(edge3, cloud3, 83, 260).
link(cloud3, edge3, 83, 260).
link(edge3, edge5, 47, 125).
link(edge5, edge3, 47, 125).
link(edge3, edge7, 21, 168).
link(edge7, edge3, 21, 168).
link(edge4, edge3, 34, 117).
link(edge3, edge4, 34, 117).
link(edge3, edge6, 41, 185).
link(edge6, edge3, 41, 185).
link(cloud3, edge4, 69, 204).
link(edge4, cloud3, 69, 204).
link(cloud3, edge7, 62, 261).
link(edge7, cloud3, 62, 261).
link(edge5, cloud3, 50, 277).
link(cloud3, edge5, 50, 277).
link(cloud3, edge6, 73, 262).
link(edge6, cloud3, 73, 262).
link(edge4, edge7, 41, 144).
link(edge7, edge4, 41, 144).
link(edge5, edge4, 19, 139).
link(edge4, edge5, 19, 139).
link(edge4, edge6, 42, 180).
link(edge6, edge4, 42, 180).
link(edge5, edge6, 23, 107).
link(edge6, edge5, 23, 107).
link(edge5, edge7, 31, 137).
link(edge7, edge5, 31, 137).
link(edge6, edge7, 20, 167).
link(edge7, edge6, 20, 167).
link(N, N, 0, 100000).