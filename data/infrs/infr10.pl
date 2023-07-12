:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

globalIntent(footprint, smaller, 1.3, kg).


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

node(edge5, edge, (27, 4, 1350)).
	totHW(edge5, (34, 5, 1667)).
	pue(edge5, 1.11).
	energySourceMix(edge5, [(0.88,coal), (0.12,gas)]).
	ramEnergyProfile(edge5, L, E) :- E is 0.017 * L.
	cpuEnergyProfile(edge5, L, E) :- E is 0.06 * L.
	storageEnergyProfile(edge5, L, E) :- E is 0.013 * L.
	energyCost(edge5, 0.472).

node(edge6, edge, (17, 4, 827)).
	totHW(edge6, (24, 6, 1105)).
	pue(edge6, 1.11).
	energySourceMix(edge6, [(0.35,solar), (0.62,gas), (0.03,onshorewind)]).
	ramEnergyProfile(edge6, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge6, L, E) :- E is 0.089 * L.
	storageEnergyProfile(edge6, L, E) :- E is 0.01 * L.
	energyCost(edge6, 0.201).

node(edge4, edge, (34, 6, 1194)).
	totHW(edge4, (45, 8, 1564)).
	pue(edge4, 1.13).
	energySourceMix(edge4, [(0.18,gas), (0.31,offshorewind), (0.52,solar)]).
	ramEnergyProfile(edge4, L, E) :- E is 0.021 * L.
	cpuEnergyProfile(edge4, L, E) :- E is 0.102 * L.
	storageEnergyProfile(edge4, L, E) :- E is 0.01 * L.
	energyCost(edge4, 0.158).

node(edge3, edge, (22, 7, 911)).
	totHW(edge3, (23, 8, 928)).
	pue(edge3, 1.1).
	energySourceMix(edge3, [(0.94,coal), (0.06,onshorewind)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.1 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.006 * L.
	energyCost(edge3, 0.322).

node(cloud2, cloud, (399, 32, 9917)).
	totHW(cloud2, (506, 41, 12547)).
	pue(cloud2, 1.42).
	energySourceMix(cloud2, [(0.0,solar), (1.0,gas)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.171 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.433 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.095 * L.
	energyCost(cloud2, 0.423).

node(edge1, edge, (28, 9, 1032)).
	totHW(edge1, (31, 10, 1142)).
	pue(edge1, 1.11).
	energySourceMix(edge1, [(0.28,gas), (0.46,coal), (0.26,solar)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.016 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.124 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.009 * L.
	energyCost(edge1, 0.339).

node(cloud1, cloud, (219, 30, 9577)).
	totHW(cloud1, (285, 39, 12428)).
	pue(cloud1, 1.36).
	energySourceMix(cloud1, [(0.76,gas), (0.24,solar)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.088 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.39 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.083 * L.
	energyCost(cloud1, 0.23).

node(edge7, edge, (38, 4, 1465)).
	totHW(edge7, (43, 5, 1628)).
	pue(edge7, 1.1).
	energySourceMix(edge7, [(0.85,onshorewind), (0.15,offshorewind)]).
	ramEnergyProfile(edge7, L, E) :- E is 0.022 * L.
	cpuEnergyProfile(edge7, L, E) :- E is 0.068 * L.
	storageEnergyProfile(edge7, L, E) :- E is 0.011 * L.
	energyCost(edge7, 0.423).

node(edge2, edge, (18, 7, 1195)).
	totHW(edge2, (25, 10, 1591)).
	pue(edge2, 1.1).
	energySourceMix(edge2, [(0.45,offshorewind), (0.09,solar), (0.46,onshorewind)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.137 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.013 * L.
	energyCost(edge2, 0.498).

node(edge8, edge, (45, 8, 1378)).
	totHW(edge8, (47, 9, 1434)).
	pue(edge8, 1.13).
	energySourceMix(edge8, [(0.61,onshorewind), (0.39,coal)]).
	ramEnergyProfile(edge8, L, E) :- E is 0.025 * L.
	cpuEnergyProfile(edge8, L, E) :- E is 0.132 * L.
	storageEnergyProfile(edge8, L, E) :- E is 0.012 * L.
	energyCost(edge8, 0.416).


link(edge3, edge5, 28, 107).
link(edge5, edge2, 6, 186).
link(edge5, edge6, 35, 188).
link(cloud2, edge7, 25, 411).
link(cloud1, edge2, 5, 361).
link(edge8, edge5, 25, 168).
link(edge7, cloud2, 18, 486).
link(edge2, edge3, 38, 240).
link(edge8, edge1, 39, 460).
link(edge8, cloud1, 15, 311).
link(cloud2, edge1, 37, 291).
link(edge2, edge8, 25, 238).
link(edge3, edge1, 7, 372).
link(edge3, cloud2, 26, 326).
link(edge8, edge6, 34, 411).
link(edge6, edge3, 19, 498).
link(edge7, edge3, 30, 248).
link(edge1, edge6, 30, 481).
link(cloud2, edge8, 5, 228).
link(edge8, edge7, 5, 301).
link(edge4, cloud1, 33, 337).
link(edge2, edge4, 27, 438).
link(edge5, edge8, 6, 202).
link(edge5, edge7, 15, 320).
link(edge8, edge3, 26, 234).
link(cloud2, edge2, 11, 495).
link(cloud1, edge1, 5, 484).
link(edge5, edge4, 28, 421).
link(edge5, cloud2, 36, 441).
link(edge3, cloud1, 23, 314).
link(edge6, edge1, 38, 493).
link(edge7, edge6, 2, 257).
link(cloud1, cloud2, 37, 107).
link(edge6, edge5, 39, 331).
link(cloud1, edge3, 10, 112).
link(edge2, cloud2, 23, 316).
link(edge1, cloud2, 13, 134).
link(edge4, edge7, 3, 198).
link(edge1, edge7, 22, 297).
link(edge2, edge6, 4, 286).
link(edge7, edge5, 33, 488).
link(edge4, edge1, 38, 374).
link(edge6, cloud1, 2, 106).
link(cloud1, edge5, 23, 309).
link(edge1, edge4, 13, 304).
link(edge3, edge6, 26, 241).
link(cloud1, edge8, 31, 441).
link(edge7, edge2, 34, 273).
link(cloud2, edge5, 23, 277).
link(edge6, edge2, 39, 268).
link(edge5, cloud1, 33, 173).
link(edge2, edge5, 4, 346).
link(edge1, edge5, 14, 395).
link(edge7, edge8, 2, 162).
link(edge3, edge2, 20, 112).
link(edge6, cloud2, 5, 338).
link(edge4, cloud2, 16, 217).
link(edge6, edge4, 17, 354).
link(edge4, edge8, 5, 485).
link(cloud2, edge3, 2, 360).
link(edge7, cloud1, 3, 340).
link(cloud2, edge4, 21, 334).
link(edge5, edge3, 20, 383).
link(edge3, edge4, 30, 492).
link(edge8, cloud2, 39, 212).
link(edge8, edge4, 31, 139).
link(edge7, edge1, 34, 307).
link(edge4, edge6, 2, 308).
link(edge1, cloud1, 29, 395).
link(cloud1, edge4, 27, 113).
link(cloud1, edge6, 8, 273).
link(cloud2, edge6, 11, 253).
link(cloud1, edge7, 29, 304).
link(edge4, edge2, 14, 163).
link(edge5, edge1, 19, 164).
link(edge2, cloud1, 13, 224).
link(edge4, edge3, 16, 176).
link(edge2, edge1, 19, 450).
link(edge3, edge7, 3, 363).
link(edge2, edge7, 25, 361).
link(edge6, edge8, 29, 200).
link(edge8, edge2, 3, 273).
link(edge1, edge3, 20, 422).
link(edge1, edge8, 34, 345).
link(edge3, edge8, 14, 154).
link(edge6, edge7, 7, 416).
link(cloud2, cloud1, 36, 323).
link(edge1, edge2, 6, 124).
link(edge4, edge5, 15, 176).
link(edge7, edge4, 3, 418).
