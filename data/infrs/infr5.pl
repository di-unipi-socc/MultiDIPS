:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

globalIntent(footprint, smaller, 0.57, kg).

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

node(cloud1, cloud, (303, 24, 7067)).
	totHW(cloud1, (404, 32, 8409)).
	pue(cloud1, 1.26).
	energySourceMix(cloud1, [(0.47,gas), (0.53,coal)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.128 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.309 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.042 * L.
	energyCost(cloud1, 0.122).

node(edge1, edge, (28, 12, 687)).
	totHW(edge1, (29, 13, 710)).
	pue(edge1, 1.19).
	energySourceMix(edge1, [(0.4,onshorewind), (0.04,coal), (0.56,gas)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.173 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.005 * L.
	energyCost(edge1, 0.301).

node(edge2, edge, (23, 10, 1167)).
	totHW(edge2, (26, 11, 1278)).
	pue(edge2, 1.09).
	energySourceMix(edge2, [(0.0,coal), (0.67,offshorewind), (0.33,gas)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.135 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.012 * L.
	energyCost(edge2, 0.387).

node(cloud2, cloud, (147, 32, 9685)).
	totHW(cloud2, (150, 33, 9823)).
	pue(cloud2, 1.59).
	energySourceMix(cloud2, [(0.58,solar), (0.37,offshorewind), (0.05,coal)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.053 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.354 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.059 * L.
	energyCost(cloud2, 0.453).

node(edge3, edge, (28, 7, 941)).
	totHW(edge3, (30, 8, 995)).
	pue(edge3, 1.13).
	energySourceMix(edge3, [(0.44,gas), (0.25,onshorewind), (0.31,offshorewind)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.112 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.009 * L.
	energyCost(edge3, 0.355).

link(cloud1, edge1, 28, 221).
link(edge1, cloud1, 28, 221).
link(cloud1, edge2, 63, 253).
link(edge2, cloud1, 63, 253).
link(cloud2, cloud1, 15, 795).
link(cloud1, cloud2, 15, 795).
link(cloud1, edge3, 49, 286).
link(edge3, cloud1, 49, 286).
link(edge1, edge2, 49, 108).
link(edge2, edge1, 49, 108).
link(edge1, edge3, 21, 167).
link(edge3, edge1, 21, 167).
link(edge1, cloud2, 43, 256).
link(cloud2, edge1, 43, 256).
link(cloud2, edge2, 57, 219).
link(edge2, cloud2, 57, 219).
link(edge2, edge3, 70, 193).
link(edge3, edge2, 70, 193).
link(cloud2, edge3, 64, 246).
link(edge3, cloud2, 64, 246).
link(N, N, 0, 100000).