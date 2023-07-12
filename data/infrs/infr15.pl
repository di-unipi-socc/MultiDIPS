:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

globalIntent(footprint, smaller, 1.95, kg).


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

node(cloud4, cloud, (340, 40, 8610)).
	totHW(cloud4, (360, 43, 9105)).
	pue(cloud4, 1.4).
	energySourceMix(cloud4, [(0.7,coal), (0.3,solar)]).
	ramEnergyProfile(cloud4, L, E) :- E is 0.114 * L.
	cpuEnergyProfile(cloud4, L, E) :- E is 0.365 * L.
	storageEnergyProfile(cloud4, L, E) :- E is 0.057 * L.
	energyCost(cloud4, 0.476).

node(edge9, edge, (33, 9, 1005)).
	totHW(edge9, (37, 11, 1126)).
	pue(edge9, 1.12).
	energySourceMix(edge9, [(0.44,offshorewind), (0.23,onshorewind), (0.33,gas)]).
	ramEnergyProfile(edge9, L, E) :- E is 0.017 * L.
	cpuEnergyProfile(edge9, L, E) :- E is 0.159 * L.
	storageEnergyProfile(edge9, L, E) :- E is 0.009 * L.
	energyCost(edge9, 0.312).

node(edge7, edge, (19, 4, 1303)).
	totHW(edge7, (25, 6, 1697)).
	pue(edge7, 1.06).
	energySourceMix(edge7, [(0.85,gas), (0.15,coal)]).
	ramEnergyProfile(edge7, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge7, L, E) :- E is 0.086 * L.
	storageEnergyProfile(edge7, L, E) :- E is 0.015 * L.
	energyCost(edge7, 0.373).

node(cloud1, cloud, (357, 36, 6049)).
	totHW(cloud1, (481, 49, 8142)).
	pue(cloud1, 1.17).
	energySourceMix(cloud1, [(0.26,solar), (0.74,gas)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.177 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.498 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.047 * L.
	energyCost(cloud1, 0.236).

node(edge4, edge, (20, 7, 639)).
	totHW(edge4, (28, 10, 874)).
	pue(edge4, 1.07).
	energySourceMix(edge4, [(0.06,gas), (0.9,solar), (0.03,onshorewind)]).
	ramEnergyProfile(edge4, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge4, L, E) :- E is 0.132 * L.
	storageEnergyProfile(edge4, L, E) :- E is 0.006 * L.
	energyCost(edge4, 0.317).

node(edge10, edge, (21, 4, 1155)).
	totHW(edge10, (29, 6, 1583)).
	pue(edge10, 1.1).
	energySourceMix(edge10, [(0.57,coal), (0.43,gas)]).
	ramEnergyProfile(edge10, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge10, L, E) :- E is 0.089 * L.
	storageEnergyProfile(edge10, L, E) :- E is 0.011 * L.
	energyCost(edge10, 0.486).

node(edge5, edge, (27, 9, 1058)).
	totHW(edge5, (31, 11, 1189)).
	pue(edge5, 1.14).
	energySourceMix(edge5, [(0.69,coal), (0.31,gas)]).
	ramEnergyProfile(edge5, L, E) :- E is 0.016 * L.
	cpuEnergyProfile(edge5, L, E) :- E is 0.132 * L.
	storageEnergyProfile(edge5, L, E) :- E is 0.011 * L.
	energyCost(edge5, 0.307).

node(cloud2, cloud, (215, 32, 10630)).
	totHW(cloud2, (277, 42, 13648)).
	pue(cloud2, 1.33).
	energySourceMix(cloud2, [(0.89,offshorewind), (0.11,solar)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.11 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.424 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.092 * L.
	energyCost(cloud2, 0.337).

node(edge2, edge, (29, 8, 621)).
	totHW(edge2, (34, 10, 712)).
	pue(edge2, 1.15).
	energySourceMix(edge2, [(0.67,solar), (0.33,coal)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.018 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.142 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.005 * L.
	energyCost(edge2, 0.426).

node(cloud5, cloud, (196, 34, 8070)).
	totHW(cloud5, (266, 47, 10916)).
	pue(cloud5, 1.17).
	energySourceMix(cloud5, [(0.92,offshorewind), (0.05,solar), (0.03,coal)]).
	ramEnergyProfile(cloud5, L, E) :- E is 0.085 * L.
	cpuEnergyProfile(cloud5, L, E) :- E is 0.424 * L.
	storageEnergyProfile(cloud5, L, E) :- E is 0.068 * L.
	energyCost(cloud5, 0.316).

node(edge8, edge, (10, 8, 948)).
	totHW(edge8, (13, 11, 1195)).
	pue(edge8, 1.09).
	energySourceMix(edge8, [(0.61,gas), (0.1,coal), (0.29,onshorewind)]).
	ramEnergyProfile(edge8, L, E) :- E is 0.007 * L.
	cpuEnergyProfile(edge8, L, E) :- E is 0.16 * L.
	storageEnergyProfile(edge8, L, E) :- E is 0.007 * L.
	energyCost(edge8, 0.445).

node(cloud3, cloud, (424, 48, 13842)).
	totHW(cloud3, (427, 49, 13938)).
	pue(cloud3, 1.1).
	energySourceMix(cloud3, [(0.5,onshorewind), (0.5,solar)]).
	ramEnergyProfile(cloud3, L, E) :- E is 0.148 * L.
	cpuEnergyProfile(cloud3, L, E) :- E is 0.532 * L.
	storageEnergyProfile(cloud3, L, E) :- E is 0.083 * L.
	energyCost(cloud3, 0.192).

node(edge1, edge, (22, 3, 444)).
	totHW(edge1, (26, 4, 506)).
	pue(edge1, 1.06).
	energySourceMix(edge1, [(0.06,gas), (0.21,onshorewind), (0.72,solar)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.057 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.004 * L.
	energyCost(edge1, 0.419).

node(edge3, edge, (22, 3, 1459)).
	totHW(edge3, (29, 5, 1915)).
	pue(edge3, 1.1).
	energySourceMix(edge3, [(0.9,solar), (0.1,coal)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.071 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.016 * L.
	energyCost(edge3, 0.288).

node(edge6, edge, (17, 4, 1138)).
	totHW(edge6, (24, 6, 1531)).
	pue(edge6, 1.1).
	energySourceMix(edge6, [(0.22,coal), (0.66,solar), (0.12,onshorewind)]).
	ramEnergyProfile(edge6, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge6, L, E) :- E is 0.08 * L.
	storageEnergyProfile(edge6, L, E) :- E is 0.013 * L.
	energyCost(edge6, 0.355).


link(edge2, edge9, 34, 214).
link(edge1, cloud5, 9, 378).
link(edge8, cloud4, 15, 339).
link(edge1, cloud1, 31, 478).
link(cloud4, edge5, 24, 428).
link(edge2, edge3, 8, 470).
link(edge2, cloud2, 22, 403).
link(edge7, edge3, 10, 282).
link(cloud1, edge5, 22, 148).
link(edge4, edge7, 32, 288).
link(edge2, edge5, 29, 433).
link(edge5, cloud5, 19, 152).
link(cloud5, edge10, 24, 175).
link(cloud3, edge2, 24, 475).
link(edge10, edge4, 15, 251).
link(edge8, edge9, 2, 409).
link(edge6, edge8, 22, 452).
link(cloud5, edge2, 17, 307).
link(edge5, edge9, 12, 187).
link(edge4, cloud4, 19, 228).
link(cloud4, edge4, 22, 465).
link(cloud3, edge7, 38, 174).
link(edge10, edge9, 25, 219).
link(edge10, cloud5, 19, 375).
link(cloud3, edge5, 31, 335).
link(edge2, cloud1, 23, 340).
link(cloud4, edge9, 18, 428).
link(cloud2, edge8, 22, 365).
link(cloud3, cloud4, 12, 280).
link(edge5, edge3, 30, 124).
link(cloud5, edge3, 25, 234).
link(edge6, edge7, 7, 425).
link(cloud3, edge6, 3, 231).
link(cloud3, edge8, 7, 452).
link(cloud4, cloud2, 2, 316).
link(edge3, cloud4, 7, 198).
link(edge4, edge6, 19, 481).
link(edge6, edge9, 15, 339).
link(cloud2, edge6, 17, 138).
link(cloud5, edge1, 37, 441).
link(edge9, edge8, 22, 336).
link(cloud2, edge2, 9, 435).
link(edge9, edge1, 10, 367).
link(edge4, edge10, 7, 211).
link(edge2, edge6, 4, 238).
link(edge7, cloud2, 7, 156).
link(edge4, cloud1, 17, 484).
link(edge8, edge6, 14, 284).
link(edge1, edge7, 24, 364).
link(cloud4, edge7, 38, 342).
link(edge4, edge5, 6, 154).
link(edge1, edge6, 10, 334).
link(edge8, cloud1, 14, 270).
link(edge6, edge5, 21, 257).
link(edge4, cloud2, 2, 301).
link(cloud2, edge7, 10, 377).
link(edge10, cloud4, 38, 381).
link(cloud3, edge1, 31, 344).
link(cloud1, edge3, 12, 332).
link(edge6, cloud5, 38, 453).
link(edge4, edge8, 3, 378).
link(edge8, edge2, 10, 142).
link(cloud1, cloud5, 16, 411).
link(edge3, edge8, 33, 409).
link(cloud4, cloud5, 33, 485).
link(edge1, cloud2, 26, 178).
link(edge1, edge2, 32, 373).
link(edge5, edge2, 34, 182).
link(edge5, edge1, 7, 175).
link(edge8, edge7, 23, 353).
link(cloud5, edge6, 4, 362).
link(edge6, edge3, 13, 417).
link(edge6, edge4, 21, 129).
link(edge7, cloud5, 17, 345).
link(edge3, edge7, 37, 361).
link(edge3, edge6, 36, 247).
link(edge4, cloud5, 10, 176).
link(cloud2, cloud5, 13, 292).
link(edge3, edge4, 38, 471).
link(cloud5, edge8, 34, 162).
link(cloud5, edge7, 17, 352).
link(edge1, edge5, 17, 238).
link(edge7, edge4, 36, 261).
link(cloud5, cloud1, 31, 315).
link(edge5, edge10, 20, 214).
link(cloud5, edge5, 38, 463).
link(cloud2, edge5, 26, 238).
link(cloud2, edge4, 8, 173).
link(cloud4, edge1, 20, 168).
link(edge1, edge10, 20, 149).
link(edge4, edge2, 18, 278).
link(edge10, cloud3, 12, 359).
link(cloud5, cloud2, 25, 397).
link(edge10, edge2, 4, 271).
link(cloud2, cloud3, 18, 430).
link(edge5, edge4, 32, 252).
link(cloud4, edge2, 36, 217).
link(cloud5, edge4, 4, 188).
link(edge6, cloud2, 25, 196).
link(edge4, cloud3, 21, 235).
link(edge7, edge6, 18, 360).
link(edge7, edge8, 31, 246).
link(edge7, edge1, 20, 303).
link(cloud2, cloud1, 9, 218).
link(edge4, edge9, 19, 488).
link(edge5, edge7, 4, 365).
link(edge6, edge10, 6, 301).
link(cloud3, cloud2, 2, 266).
link(edge7, cloud3, 28, 185).
link(cloud3, edge9, 24, 374).
link(cloud1, cloud2, 23, 179).
link(edge8, edge10, 39, 286).
link(edge10, edge3, 35, 237).
link(edge7, edge2, 6, 237).
link(edge9, edge4, 33, 265).
link(edge3, cloud5, 27, 278).
link(cloud1, cloud4, 39, 129).
link(cloud4, cloud3, 17, 353).
link(edge6, edge1, 36, 461).
link(edge3, edge10, 10, 463).
link(edge2, edge4, 29, 245).
link(cloud5, edge9, 10, 321).
link(edge9, edge7, 27, 438).
link(edge10, edge5, 26, 267).
link(cloud2, cloud4, 23, 368).
link(edge3, edge9, 36, 473).
link(edge9, edge6, 33, 207).
link(edge8, edge1, 14, 231).
link(edge10, cloud2, 38, 217).
link(edge9, cloud4, 9, 491).
link(edge3, edge1, 16, 246).
link(edge1, edge9, 27, 189).
link(edge1, edge8, 34, 182).
link(edge2, edge7, 18, 136).
link(edge5, cloud3, 21, 154).
link(cloud3, edge4, 38, 487).
link(cloud1, edge6, 12, 299).
link(edge2, edge8, 13, 456).
link(edge6, cloud3, 28, 477).
link(edge10, edge6, 39, 354).
link(edge2, edge10, 15, 126).
link(cloud5, cloud4, 5, 358).
link(edge9, edge10, 15, 302).
link(edge7, cloud1, 24, 284).
link(cloud4, edge8, 3, 314).
link(edge5, edge6, 39, 109).
link(cloud4, edge3, 29, 123).
link(cloud2, edge9, 23, 387).
link(edge2, edge1, 28, 291).
link(edge9, cloud5, 14, 216).
link(edge9, edge3, 21, 172).
link(edge8, edge4, 22, 294).
link(cloud1, edge8, 24, 270).
link(edge10, edge8, 2, 493).
link(edge8, cloud5, 29, 489).
link(cloud2, edge3, 14, 292).
link(edge5, cloud4, 37, 478).
link(edge1, cloud3, 15, 288).
link(cloud4, edge10, 25, 370).
link(edge1, edge4, 8, 432).
link(cloud1, edge4, 24, 115).
link(cloud2, edge10, 10, 418).
link(edge9, cloud1, 16, 112).
link(edge3, cloud3, 37, 297).
link(cloud3, edge3, 21, 139).
link(cloud3, cloud5, 35, 349).
link(edge9, edge5, 29, 244).
link(edge9, cloud2, 10, 296).
link(edge3, cloud1, 14, 203).
link(edge5, edge8, 20, 167).
link(cloud3, edge10, 35, 263).
link(edge2, cloud3, 4, 169).
link(edge1, edge3, 35, 393).
link(edge6, edge2, 20, 183).
link(edge4, edge1, 8, 477).
link(edge6, cloud1, 14, 297).
link(edge10, cloud1, 37, 129).
link(edge10, edge1, 27, 494).
link(edge8, cloud3, 4, 386).
link(edge8, edge3, 28, 349).
link(edge9, edge2, 37, 170).
link(edge1, cloud4, 22, 174).
link(edge7, cloud4, 23, 320).
link(edge8, edge5, 39, 383).
link(edge7, edge5, 37, 149).
link(edge3, edge2, 12, 346).
link(edge2, cloud5, 37, 254).
link(edge5, cloud1, 4, 123).
link(cloud1, edge7, 3, 207).
link(cloud1, cloud3, 12, 413).
link(edge8, cloud2, 11, 437).
link(cloud4, edge6, 16, 305).
link(edge3, edge5, 17, 352).
link(edge4, edge3, 12, 277).
link(edge3, cloud2, 26, 488).
link(edge6, cloud4, 26, 461).
link(cloud1, edge10, 24, 330).
link(cloud1, edge9, 17, 232).
link(edge7, edge10, 26, 407).
link(edge10, edge7, 10, 134).
link(cloud2, edge1, 3, 300).
link(cloud3, cloud1, 9, 351).
link(edge9, cloud3, 20, 336).
link(cloud5, cloud3, 18, 186).
link(edge5, cloud2, 12, 495).
link(cloud1, edge1, 13, 366).
link(cloud4, cloud1, 25, 348).
link(cloud1, edge2, 14, 491).
link(edge7, edge9, 4, 304).
link(edge2, cloud4, 26, 108).
