:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

globalIntent(footprint, smaller, 0.159, kg).

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

node(cloud1, cloud, (113, 34, 8738)).
	totHW(cloud1, (140, 43, 10807)).
	pue(cloud1, 1.42).
	energySourceMix(cloud1, [(0.02,offshorewind), (0.98,solar)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.053 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.433 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.063 * L.
	energyCost(cloud1, 0.233).

node(cloud2, cloud, (114, 26, 5612)).
	totHW(cloud2, (130, 30, 6395)).
	pue(cloud2, 1.51).
	energySourceMix(cloud2, [(0.44,offshorewind), (0.56,coal)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.044 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.346 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.037 * L.
	energyCost(cloud2, 0.524).

node(edge1, edge, (15, 11, 1510)).
	totHW(edge1, (16, 12, 1516)).
	pue(edge1, 1.09).
	energySourceMix(edge1, [(0.24,onshorewind), (0.76,offshorewind)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.008 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.174 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.011 * L.
	energyCost(edge1, 0.529).

node(edge2, edge, (14, 7, 1279)).
	totHW(edge2, (18, 9, 1571)).
	pue(edge2, 1.15).
	energySourceMix(edge2, [(0.01,offshorewind), (0.99,gas)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.127 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.012 * L.
	energyCost(edge2, 0.452).

node(edge3, edge, (15, 6, 760)).
	totHW(edge3, (18, 8, 897)).
	pue(edge3, 1.07).
	energySourceMix(edge3, [(0.48,solar), (0.52,gas)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.111 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.009 * L.
	energyCost(edge3, 0.299).

link(cloud1, edge1, 76, 292).
link(edge1, cloud1, 76, 292).
link(cloud1, edge2, 59, 289).
link(edge2, cloud1, 59, 289).
link(cloud1, edge3, 56, 218).
link(edge3, cloud1, 56, 218).
link(cloud2, cloud1, 18, 413).
link(cloud1, cloud2, 18, 413).
link(cloud2, edge2, 71, 219).
link(edge2, cloud2, 71, 219).
link(cloud2, edge3, 50, 241).
link(edge3, cloud2, 50, 241).
link(cloud2, edge1, 70, 233).
link(edge1, cloud2, 70, 233).
link(edge1, edge3, 20, 101).
link(edge3, edge1, 20, 101).
link(edge1, edge2, 41, 151).
link(edge2, edge1, 41, 151).
link(edge2, edge3, 21, 131).
link(edge3, edge2, 21, 131).
link(N, N, 0, 100000).