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

node(edge2, edge, (25, 10, 1025)).
	totHW(edge2, (26, 11, 1042)).
	pue(edge2, 1.1).
	energySourceMix(edge2, [(0.7,offshorewind), (0.24,onshorewind), (0.06,gas)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.161 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.009 * L.
	energyCost(edge2, 0.422).

node(cloud1, cloud, (275, 36, 10741)).
	totHW(cloud1, (324, 43, 12630)).
	pue(cloud1, 1.23).
	energySourceMix(cloud1, [(0.34,onshorewind), (0.4,gas), (0.26,coal)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.116 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.447 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.084 * L.
	energyCost(cloud1, 0.322).

node(cloud5, cloud, (328, 36, 10960)).
	totHW(cloud5, (340, 38, 11329)).
	pue(cloud5, 1.38).
	energySourceMix(cloud5, [(0.17,solar), (0.25,offshorewind), (0.58,coal)]).
	ramEnergyProfile(cloud5, L, E) :- E is 0.119 * L.
	cpuEnergyProfile(cloud5, L, E) :- E is 0.394 * L.
	storageEnergyProfile(cloud5, L, E) :- E is 0.078 * L.
	energyCost(cloud5, 0.278).

node(cloud2, cloud, (469, 33, 11055)).
	totHW(cloud2, (498, 36, 11725)).
	pue(cloud2, 1.51).
	energySourceMix(cloud2, [(0.12,offshorewind), (0.05,coal), (0.83,gas)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.165 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.387 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.088 * L.
	energyCost(cloud2, 0.474).

node(cloud3, cloud, (420, 37, 11774)).
	totHW(cloud3, (461, 41, 12898)).
	pue(cloud3, 1.31).
	energySourceMix(cloud3, [(0.52,offshorewind), (0.48,solar)]).
	ramEnergyProfile(cloud3, L, E) :- E is 0.153 * L.
	cpuEnergyProfile(cloud3, L, E) :- E is 0.352 * L.
	storageEnergyProfile(cloud3, L, E) :- E is 0.091 * L.
	energyCost(cloud3, 0.365).

node(edge1, edge, (18, 9, 429)).
	totHW(edge1, (23, 12, 529)).
	pue(edge1, 1.14).
	energySourceMix(edge1, [(0.71,coal), (0.22,offshorewind), (0.07,solar)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.172 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.004 * L.
	energyCost(edge1, 0.318).

node(edge3, edge, (12, 6, 880)).
	totHW(edge3, (16, 8, 1135)).
	pue(edge3, 1.14).
	energySourceMix(edge3, [(0.03,onshorewind), (0.43,offshorewind), (0.55,solar)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.101 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.011 * L.
	energyCost(edge3, 0.443).

node(cloud4, cloud, (427, 44, 11806)).
	totHW(cloud4, (431, 45, 11916)).
	pue(cloud4, 1.57).
	energySourceMix(cloud4, [(0.3,coal), (0.65,offshorewind), (0.05,gas)]).
	ramEnergyProfile(cloud4, L, E) :- E is 0.133 * L.
	cpuEnergyProfile(cloud4, L, E) :- E is 0.487 * L.
	storageEnergyProfile(cloud4, L, E) :- E is 0.063 * L.
	energyCost(cloud4, 0.393).

node(edge4, edge, (21, 3, 627)).
	totHW(edge4, (27, 5, 807)).
	pue(edge4, 1.12).
	energySourceMix(edge4, [(1.0,coal), (0.0,gas)]).
	ramEnergyProfile(edge4, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge4, L, E) :- E is 0.074 * L.
	storageEnergyProfile(edge4, L, E) :- E is 0.005 * L.
	energyCost(edge4, 0.454).

node(cloud6, cloud, (289, 35, 5988)).
	totHW(cloud6, (404, 50, 8345)).
	pue(cloud6, 1.48).
	energySourceMix(cloud6, [(0.62,gas), (0.38,solar)]).
	ramEnergyProfile(cloud6, L, E) :- E is 0.126 * L.
	cpuEnergyProfile(cloud6, L, E) :- E is 0.55 * L.
	storageEnergyProfile(cloud6, L, E) :- E is 0.063 * L.
	energyCost(cloud6, 0.224).


link(edge1, edge4, 3, 126).
link(edge3, edge2, 21, 139).
link(edge3, edge4, 37, 274).
link(cloud3, cloud6, 21, 352).
link(edge2, cloud4, 30, 377).
link(edge1, cloud5, 24, 325).
link(cloud2, edge2, 38, 329).
link(cloud5, edge4, 14, 326).
link(edge2, cloud6, 23, 372).
link(edge1, cloud3, 23, 367).
link(cloud1, cloud6, 20, 147).
link(edge3, cloud4, 39, 314).
link(edge3, cloud2, 23, 235).
link(cloud4, edge1, 8, 488).
link(cloud4, edge4, 16, 352).
link(cloud5, edge1, 9, 257).
link(cloud5, edge3, 13, 173).
link(cloud1, edge1, 5, 329).
link(edge4, cloud5, 34, 394).
link(edge2, cloud1, 31, 113).
link(cloud3, cloud5, 3, 324).
link(edge2, cloud5, 29, 482).
link(cloud4, cloud2, 10, 219).
link(cloud4, cloud6, 15, 146).
link(edge1, edge3, 3, 156).
link(cloud5, cloud6, 13, 184).
link(edge4, cloud2, 33, 458).
link(cloud6, cloud2, 31, 278).
link(cloud5, cloud3, 12, 122).
link(cloud3, cloud2, 14, 461).
link(cloud2, cloud4, 4, 338).
link(edge3, cloud5, 4, 458).
link(cloud6, edge4, 34, 375).
link(cloud1, cloud4, 17, 278).
link(cloud3, edge2, 13, 371).
link(cloud2, cloud5, 16, 325).
link(cloud6, edge1, 34, 104).
link(edge1, cloud2, 11, 329).
link(edge2, edge3, 29, 451).
link(cloud6, edge3, 5, 446).
link(cloud3, cloud1, 33, 410).
link(cloud4, cloud1, 22, 172).
link(cloud2, cloud1, 2, 378).
link(edge4, cloud6, 13, 338).
link(cloud1, cloud3, 5, 497).
link(edge4, cloud1, 24, 499).
link(cloud2, cloud3, 35, 459).
link(edge2, cloud2, 25, 413).
link(edge2, edge1, 17, 382).
link(edge4, edge3, 11, 303).
link(cloud6, edge2, 4, 390).
link(cloud3, edge3, 6, 351).
link(edge1, edge2, 4, 320).
link(cloud1, edge4, 3, 430).
link(cloud2, cloud6, 13, 201).
link(cloud5, cloud4, 15, 103).
link(cloud4, cloud3, 32, 140).
link(cloud2, edge1, 6, 130).
link(cloud1, cloud2, 28, 314).
link(cloud6, cloud1, 18, 429).
link(cloud3, edge1, 17, 440).
link(edge1, cloud6, 12, 155).
link(cloud3, edge4, 7, 225).
link(cloud6, cloud3, 30, 419).
link(edge1, cloud1, 24, 219).
link(cloud3, cloud4, 29, 139).
link(cloud6, cloud4, 6, 228).
link(cloud4, cloud5, 18, 270).
link(cloud1, edge2, 19, 174).
link(cloud4, edge2, 25, 288).
link(edge3, cloud1, 14, 163).
link(edge2, edge4, 6, 217).
link(edge1, cloud4, 19, 493).
link(cloud2, edge3, 20, 422).
link(cloud1, edge3, 36, 333).
link(edge4, edge2, 11, 460).
link(edge3, cloud6, 30, 368).
link(cloud5, cloud1, 33, 261).
link(edge3, edge1, 24, 373).
link(edge4, edge1, 20, 333).
link(cloud2, edge4, 22, 293).
link(cloud1, cloud5, 25, 437).
link(edge3, cloud3, 33, 103).
link(edge2, cloud3, 24, 380).
link(edge4, cloud4, 39, 234).
link(cloud5, edge2, 15, 145).
link(cloud6, cloud5, 22, 362).
link(cloud5, cloud2, 25, 357).
link(cloud4, edge3, 29, 260).
link(edge4, cloud3, 25, 464).
