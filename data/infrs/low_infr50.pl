:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

globalIntent(footprint, smaller, 2.143, kg).

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

node(cloud1, cloud, (287, 25, 6198)).
	totHW(cloud1, (376, 34, 8112)).
	pue(cloud1, 1.24).
	energySourceMix(cloud1, [(0.06,onshorewind), (0.58,gas), (0.36,offshorewind)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.143 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.403 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.055 * L.
	energyCost(cloud1, 0.315).

node(edge1, edge, (21, 8, 449)).
	totHW(edge1, (26, 11, 555)).
	pue(edge1, 1.12).
	energySourceMix(edge1, [(0.99,gas), (0.01,solar)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.143 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.003 * L.
	energyCost(edge1, 0.212).

node(edge2, edge, (33, 9, 911)).
	totHW(edge2, (38, 11, 1025)).
	pue(edge2, 1.1).
	energySourceMix(edge2, [(0.58,solar), (0.33,onshorewind), (0.09,gas)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.02 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.148 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.008 * L.
	energyCost(edge2, 0.455).

node(cloud2, cloud, (200, 21, 7668)).
	totHW(cloud2, (232, 25, 8859)).
	pue(cloud2, 1.22).
	energySourceMix(cloud2, [(0.95,onshorewind), (0.05,solar)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.093 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.238 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.058 * L.
	energyCost(cloud2, 0.499).

node(edge3, edge, (27, 7, 1315)).
	totHW(edge3, (28, 8, 1339)).
	pue(edge3, 1.11).
	energySourceMix(edge3, [(0.6,solar), (0.4,coal)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.102 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.011 * L.
	energyCost(edge3, 0.266).

node(edge4, edge, (36, 10, 1762)).
	totHW(edge4, (38, 11, 1814)).
	pue(edge4, 1.07).
	energySourceMix(edge4, [(0.87,coal), (0.13,onshorewind)]).
	ramEnergyProfile(edge4, L, E) :- E is 0.02 * L.
	cpuEnergyProfile(edge4, L, E) :- E is 0.159 * L.
	storageEnergyProfile(edge4, L, E) :- E is 0.012 * L.
	energyCost(edge4, 0.098).

node(edge5, edge, (29, 10, 498)).
	totHW(edge5, (30, 11, 502)).
	pue(edge5, 1.13).
	energySourceMix(edge5, [(0.09,offshorewind), (0.86,gas), (0.05,onshorewind)]).
	ramEnergyProfile(edge5, L, E) :- E is 0.016 * L.
	cpuEnergyProfile(edge5, L, E) :- E is 0.148 * L.
	storageEnergyProfile(edge5, L, E) :- E is 0.004 * L.
	energyCost(edge5, 0.243).

node(edge6, edge, (28, 6, 1264)).
	totHW(edge6, (33, 8, 1481)).
	pue(edge6, 1.08).
	energySourceMix(edge6, [(0.62,solar), (0.38,gas)]).
	ramEnergyProfile(edge6, L, E) :- E is 0.018 * L.
	cpuEnergyProfile(edge6, L, E) :- E is 0.102 * L.
	storageEnergyProfile(edge6, L, E) :- E is 0.011 * L.
	energyCost(edge6, 0.361).

node(edge7, edge, (21, 8, 1557)).
	totHW(edge7, (24, 9, 1704)).
	pue(edge7, 1.18).
	energySourceMix(edge7, [(0.14,gas), (0.53,solar), (0.33,coal)]).
	ramEnergyProfile(edge7, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge7, L, E) :- E is 0.111 * L.
	storageEnergyProfile(edge7, L, E) :- E is 0.012 * L.
	energyCost(edge7, 0.264).

node(edge8, edge, (27, 9, 987)).
	totHW(edge8, (37, 13, 1311)).
	pue(edge8, 1.16).
	energySourceMix(edge8, [(0.12,coal), (0.85,solar), (0.03,offshorewind)]).
	ramEnergyProfile(edge8, L, E) :- E is 0.019 * L.
	cpuEnergyProfile(edge8, L, E) :- E is 0.182 * L.
	storageEnergyProfile(edge8, L, E) :- E is 0.008 * L.
	energyCost(edge8, 0.406).

node(edge9, edge, (19, 9, 854)).
	totHW(edge9, (24, 12, 1029)).
	pue(edge9, 1.18).
	energySourceMix(edge9, [(0.36,gas), (0.61,onshorewind), (0.03,coal)]).
	ramEnergyProfile(edge9, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge9, L, E) :- E is 0.175 * L.
	storageEnergyProfile(edge9, L, E) :- E is 0.006 * L.
	energyCost(edge9, 0.363).

node(edge10, edge, (19, 9, 938)).
	totHW(edge10, (21, 10, 995)).
	pue(edge10, 1.11).
	energySourceMix(edge10, [(0.95,onshorewind), (0.05,offshorewind)]).
	ramEnergyProfile(edge10, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge10, L, E) :- E is 0.127 * L.
	storageEnergyProfile(edge10, L, E) :- E is 0.006 * L.
	energyCost(edge10, 0.5).

node(cloud3, cloud, (362, 39, 11227)).
	totHW(cloud3, (376, 41, 11634)).
	pue(cloud3, 1.6).
	energySourceMix(cloud3, [(0.09,offshorewind), (0.91,solar)]).
	ramEnergyProfile(cloud3, L, E) :- E is 0.149 * L.
	cpuEnergyProfile(cloud3, L, E) :- E is 0.407 * L.
	storageEnergyProfile(cloud3, L, E) :- E is 0.068 * L.
	energyCost(cloud3, 0.478).

node(cloud4, cloud, (352, 26, 9979)).
	totHW(cloud4, (384, 29, 10869)).
	pue(cloud4, 1.41).
	energySourceMix(cloud4, [(0.77,solar), (0.07,gas), (0.16,onshorewind)]).
	ramEnergyProfile(cloud4, L, E) :- E is 0.151 * L.
	cpuEnergyProfile(cloud4, L, E) :- E is 0.33 * L.
	storageEnergyProfile(cloud4, L, E) :- E is 0.064 * L.
	energyCost(cloud4, 0.457).

node(cloud5, cloud, (363, 38, 10481)).
	totHW(cloud5, (394, 42, 11372)).
	pue(cloud5, 1.47).
	energySourceMix(cloud5, [(0.89,solar), (0.11,coal)]).
	ramEnergyProfile(cloud5, L, E) :- E is 0.135 * L.
	cpuEnergyProfile(cloud5, L, E) :- E is 0.416 * L.
	storageEnergyProfile(cloud5, L, E) :- E is 0.064 * L.
	energyCost(cloud5, 0.411).

node(edge11, edge, (15, 11, 1290)).
	totHW(edge11, (16, 12, 1339)).
	pue(edge11, 1.08).
	energySourceMix(edge11, [(0.14,solar), (0.86,offshorewind)]).
	ramEnergyProfile(edge11, L, E) :- E is 0.008 * L.
	cpuEnergyProfile(edge11, L, E) :- E is 0.145 * L.
	storageEnergyProfile(edge11, L, E) :- E is 0.009 * L.
	energyCost(edge11, 0.493).

node(edge12, edge, (14, 9, 421)).
	totHW(edge12, (18, 12, 520)).
	pue(edge12, 1.16).
	energySourceMix(edge12, [(0.36,coal), (0.64,gas)]).
	ramEnergyProfile(edge12, L, E) :- E is 0.008 * L.
	cpuEnergyProfile(edge12, L, E) :- E is 0.165 * L.
	storageEnergyProfile(edge12, L, E) :- E is 0.005 * L.
	energyCost(edge12, 0.148).

node(edge13, edge, (32, 10, 780)).
	totHW(edge13, (36, 12, 861)).
	pue(edge13, 1.11).
	energySourceMix(edge13, [(0.09,gas), (0.68,coal), (0.23,solar)]).
	ramEnergyProfile(edge13, L, E) :- E is 0.018 * L.
	cpuEnergyProfile(edge13, L, E) :- E is 0.15 * L.
	storageEnergyProfile(edge13, L, E) :- E is 0.006 * L.
	energyCost(edge13, 0.139).

node(edge14, edge, (21, 12, 1237)).
	totHW(edge14, (22, 13, 1276)).
	pue(edge14, 1.19).
	energySourceMix(edge14, [(0.22,coal), (0.5,gas), (0.27,onshorewind)]).
	ramEnergyProfile(edge14, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge14, L, E) :- E is 0.171 * L.
	storageEnergyProfile(edge14, L, E) :- E is 0.009 * L.
	energyCost(edge14, 0.234).

node(edge15, edge, (37, 9, 1571)).
	totHW(edge15, (41, 10, 1737)).
	pue(edge15, 1.07).
	energySourceMix(edge15, [(0.51,solar), (0.34,onshorewind), (0.15,gas)]).
	ramEnergyProfile(edge15, L, E) :- E is 0.022 * L.
	cpuEnergyProfile(edge15, L, E) :- E is 0.14 * L.
	storageEnergyProfile(edge15, L, E) :- E is 0.012 * L.
	energyCost(edge15, 0.436).

node(edge16, edge, (29, 9, 498)).
	totHW(edge16, (33, 11, 566)).
	pue(edge16, 1.18).
	energySourceMix(edge16, [(0.25,onshorewind), (0.64,coal), (0.12,gas)]).
	ramEnergyProfile(edge16, L, E) :- E is 0.016 * L.
	cpuEnergyProfile(edge16, L, E) :- E is 0.153 * L.
	storageEnergyProfile(edge16, L, E) :- E is 0.005 * L.
	energyCost(edge16, 0.151).

node(edge17, edge, (31, 11, 1640)).
	totHW(edge17, (36, 13, 1888)).
	pue(edge17, 1.13).
	energySourceMix(edge17, [(0.28,coal), (0.7,offshorewind), (0.02,solar)]).
	ramEnergyProfile(edge17, L, E) :- E is 0.019 * L.
	cpuEnergyProfile(edge17, L, E) :- E is 0.183 * L.
	storageEnergyProfile(edge17, L, E) :- E is 0.017 * L.
	energyCost(edge17, 0.333).

node(edge18, edge, (21, 8, 997)).
	totHW(edge18, (27, 11, 1268)).
	pue(edge18, 1.2).
	energySourceMix(edge18, [(0.53,onshorewind), (0.47,coal)]).
	ramEnergyProfile(edge18, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge18, L, E) :- E is 0.144 * L.
	storageEnergyProfile(edge18, L, E) :- E is 0.009 * L.
	energyCost(edge18, 0.245).

node(edge19, edge, (16, 7, 845)).
	totHW(edge19, (20, 9, 1010)).
	pue(edge19, 1.13).
	energySourceMix(edge19, [(0.14,onshorewind), (0.86,offshorewind)]).
	ramEnergyProfile(edge19, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge19, L, E) :- E is 0.12 * L.
	storageEnergyProfile(edge19, L, E) :- E is 0.008 * L.
	energyCost(edge19, 0.496).

node(cloud6, cloud, (263, 39, 5928)).
	totHW(cloud6, (275, 41, 6182)).
	pue(cloud6, 1.49).
	energySourceMix(cloud6, [(0.67,gas), (0.33,onshorewind)]).
	ramEnergyProfile(cloud6, L, E) :- E is 0.089 * L.
	cpuEnergyProfile(cloud6, L, E) :- E is 0.425 * L.
	storageEnergyProfile(cloud6, L, E) :- E is 0.042 * L.
	energyCost(cloud6, 0.291).

node(edge20, edge, (21, 8, 898)).
	totHW(edge20, (28, 11, 1176)).
	pue(edge20, 1.09).
	energySourceMix(edge20, [(0.19,onshorewind), (0.81,offshorewind)]).
	ramEnergyProfile(edge20, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge20, L, E) :- E is 0.148 * L.
	storageEnergyProfile(edge20, L, E) :- E is 0.009 * L.
	energyCost(edge20, 0.497).

node(edge21, edge, (36, 7, 1200)).
	totHW(edge21, (40, 8, 1304)).
	pue(edge21, 1.05).
	energySourceMix(edge21, [(0.25,offshorewind), (0.75,gas)]).
	ramEnergyProfile(edge21, L, E) :- E is 0.021 * L.
	cpuEnergyProfile(edge21, L, E) :- E is 0.113 * L.
	storageEnergyProfile(edge21, L, E) :- E is 0.008 * L.
	energyCost(edge21, 0.27).

node(cloud7, cloud, (251, 20, 6792)).
	totHW(cloud7, (291, 24, 7868)).
	pue(cloud7, 1.5).
	energySourceMix(cloud7, [(0.41,coal), (0.09,onshorewind), (0.49,gas)]).
	ramEnergyProfile(cloud7, L, E) :- E is 0.105 * L.
	cpuEnergyProfile(cloud7, L, E) :- E is 0.259 * L.
	storageEnergyProfile(cloud7, L, E) :- E is 0.04 * L.
	energyCost(cloud7, 0.16).

node(edge22, edge, (20, 9, 1827)).
	totHW(edge22, (21, 10, 1879)).
	pue(edge22, 1.18).
	energySourceMix(edge22, [(0.02,offshorewind), (0.98,onshorewind)]).
	ramEnergyProfile(edge22, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge22, L, E) :- E is 0.148 * L.
	storageEnergyProfile(edge22, L, E) :- E is 0.016 * L.
	energyCost(edge22, 0.5).

node(edge23, edge, (26, 9, 1115)).
	totHW(edge23, (35, 12, 1471)).
	pue(edge23, 1.07).
	energySourceMix(edge23, [(0.02,offshorewind), (0.98,coal)]).
	ramEnergyProfile(edge23, L, E) :- E is 0.019 * L.
	cpuEnergyProfile(edge23, L, E) :- E is 0.167 * L.
	storageEnergyProfile(edge23, L, E) :- E is 0.012 * L.
	energyCost(edge23, 0.098).

node(cloud8, cloud, (246, 37, 8014)).
	totHW(cloud8, (305, 47, 9935)).
	pue(cloud8, 1.34).
	energySourceMix(cloud8, [(0.67,onshorewind), (0.33,solar)]).
	ramEnergyProfile(cloud8, L, E) :- E is 0.114 * L.
	cpuEnergyProfile(cloud8, L, E) :- E is 0.511 * L.
	storageEnergyProfile(cloud8, L, E) :- E is 0.071 * L.
	energyCost(cloud8, 0.492).

node(edge24, edge, (25, 7, 1457)).
	totHW(edge24, (26, 8, 1476)).
	pue(edge24, 1.18).
	energySourceMix(edge24, [(0.67,onshorewind), (0.22,coal), (0.1,solar)]).
	ramEnergyProfile(edge24, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge24, L, E) :- E is 0.102 * L.
	storageEnergyProfile(edge24, L, E) :- E is 0.012 * L.
	energyCost(edge24, 0.366).

node(cloud9, cloud, (129, 19, 8651)).
	totHW(cloud9, (161, 24, 10796)).
	pue(cloud9, 1.17).
	energySourceMix(cloud9, [(0.21,offshorewind), (0.44,onshorewind), (0.34,gas)]).
	ramEnergyProfile(cloud9, L, E) :- E is 0.061 * L.
	cpuEnergyProfile(cloud9, L, E) :- E is 0.269 * L.
	storageEnergyProfile(cloud9, L, E) :- E is 0.058 * L.
	energyCost(cloud9, 0.385).

node(cloud10, cloud, (219, 25, 5002)).
	totHW(cloud10, (267, 31, 6079)).
	pue(cloud10, 1.29).
	energySourceMix(cloud10, [(0.4,coal), (0.58,gas), (0.02,solar)]).
	ramEnergyProfile(cloud10, L, E) :- E is 0.103 * L.
	cpuEnergyProfile(cloud10, L, E) :- E is 0.306 * L.
	storageEnergyProfile(cloud10, L, E) :- E is 0.045 * L.
	energyCost(cloud10, 0.146).

node(edge25, edge, (33, 11, 755)).
	totHW(edge25, (36, 13, 824)).
	pue(edge25, 1.09).
	energySourceMix(edge25, [(0.5,onshorewind), (0.23,coal), (0.27,gas)]).
	ramEnergyProfile(edge25, L, E) :- E is 0.019 * L.
	cpuEnergyProfile(edge25, L, E) :- E is 0.19 * L.
	storageEnergyProfile(edge25, L, E) :- E is 0.007 * L.
	energyCost(edge25, 0.287).

node(edge26, edge, (21, 9, 1355)).
	totHW(edge26, (27, 12, 1699)).
	pue(edge26, 1.12).
	energySourceMix(edge26, [(0.49,coal), (0.51,offshorewind), (0.0,onshorewind)]).
	ramEnergyProfile(edge26, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge26, L, E) :- E is 0.17 * L.
	storageEnergyProfile(edge26, L, E) :- E is 0.015 * L.
	energyCost(edge26, 0.235).

node(edge27, edge, (27, 10, 843)).
	totHW(edge27, (32, 12, 996)).
	pue(edge27, 1.18).
	energySourceMix(edge27, [(0.57,gas), (0.43,offshorewind)]).
	ramEnergyProfile(edge27, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge27, L, E) :- E is 0.175 * L.
	storageEnergyProfile(edge27, L, E) :- E is 0.01 * L.
	energyCost(edge27, 0.317).

node(edge28, edge, (28, 10, 467)).
	totHW(edge28, (32, 12, 525)).
	pue(edge28, 1.19).
	energySourceMix(edge28, [(0.01,solar), (0.99,coal), (0.01,offshorewind)]).
	ramEnergyProfile(edge28, L, E) :- E is 0.017 * L.
	cpuEnergyProfile(edge28, L, E) :- E is 0.168 * L.
	storageEnergyProfile(edge28, L, E) :- E is 0.004 * L.
	energyCost(edge28, 0.098).

node(cloud11, cloud, (312, 43, 9093)).
	totHW(cloud11, (342, 47, 9938)).
	pue(cloud11, 1.2).
	energySourceMix(cloud11, [(0.88,gas), (0.12,onshorewind)]).
	ramEnergyProfile(cloud11, L, E) :- E is 0.13 * L.
	cpuEnergyProfile(cloud11, L, E) :- E is 0.464 * L.
	storageEnergyProfile(cloud11, L, E) :- E is 0.055 * L.
	energyCost(cloud11, 0.238).

node(edge29, edge, (31, 8, 1596)).
	totHW(edge29, (34, 9, 1729)).
	pue(edge29, 1.11).
	energySourceMix(edge29, [(0.51,offshorewind), (0.49,solar)]).
	ramEnergyProfile(edge29, L, E) :- E is 0.017 * L.
	cpuEnergyProfile(edge29, L, E) :- E is 0.118 * L.
	storageEnergyProfile(edge29, L, E) :- E is 0.016 * L.
	energyCost(edge29, 0.486).

node(edge30, edge, (12, 6, 1220)).
	totHW(edge30, (16, 9, 1571)).
	pue(edge30, 1.2).
	energySourceMix(edge30, [(0.43,coal), (0.2,offshorewind), (0.37,onshorewind)]).
	ramEnergyProfile(edge30, L, E) :- E is 0.008 * L.
	cpuEnergyProfile(edge30, L, E) :- E is 0.132 * L.
	storageEnergyProfile(edge30, L, E) :- E is 0.014 * L.
	energyCost(edge30, 0.262).

node(edge31, edge, (32, 6, 812)).
	totHW(edge31, (37, 8, 932)).
	pue(edge31, 1.1).
	energySourceMix(edge31, [(0.07,gas), (0.14,solar), (0.79,offshorewind)]).
	ramEnergyProfile(edge31, L, E) :- E is 0.018 * L.
	cpuEnergyProfile(edge31, L, E) :- E is 0.106 * L.
	storageEnergyProfile(edge31, L, E) :- E is 0.008 * L.
	energyCost(edge31, 0.469).

node(edge32, edge, (20, 10, 1355)).
	totHW(edge32, (26, 13, 1734)).
	pue(edge32, 1.11).
	energySourceMix(edge32, [(0.81,offshorewind), (0.19,gas)]).
	ramEnergyProfile(edge32, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge32, L, E) :- E is 0.176 * L.
	storageEnergyProfile(edge32, L, E) :- E is 0.014 * L.
	energyCost(edge32, 0.431).

node(edge33, edge, (22, 7, 614)).
	totHW(edge33, (23, 8, 624)).
	pue(edge33, 1.18).
	energySourceMix(edge33, [(0.2,gas), (0.06,offshorewind), (0.75,solar)]).
	ramEnergyProfile(edge33, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge33, L, E) :- E is 0.113 * L.
	storageEnergyProfile(edge33, L, E) :- E is 0.004 * L.
	energyCost(edge33, 0.414).

node(edge34, edge, (24, 9, 1852)).
	totHW(edge34, (26, 10, 1961)).
	pue(edge34, 1.15).
	energySourceMix(edge34, [(0.86,gas), (0.14,solar)]).
	ramEnergyProfile(edge34, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge34, L, E) :- E is 0.129 * L.
	storageEnergyProfile(edge34, L, E) :- E is 0.019 * L.
	energyCost(edge34, 0.241).

node(edge35, edge, (30, 7, 1111)).
	totHW(edge35, (39, 10, 1403)).
	pue(edge35, 1.09).
	energySourceMix(edge35, [(0.1,offshorewind), (0.9,coal)]).
	ramEnergyProfile(edge35, L, E) :- E is 0.02 * L.
	cpuEnergyProfile(edge35, L, E) :- E is 0.139 * L.
	storageEnergyProfile(edge35, L, E) :- E is 0.014 * L.
	energyCost(edge35, 0.098).

node(edge36, edge, (35, 7, 1232)).
	totHW(edge36, (37, 8, 1278)).
	pue(edge36, 1.1).
	energySourceMix(edge36, [(0.07,coal), (0.4,offshorewind), (0.53,onshorewind)]).
	ramEnergyProfile(edge36, L, E) :- E is 0.018 * L.
	cpuEnergyProfile(edge36, L, E) :- E is 0.112 * L.
	storageEnergyProfile(edge36, L, E) :- E is 0.012 * L.
	energyCost(edge36, 0.454).

node(cloud12, cloud, (144, 30, 9110)).
	totHW(cloud12, (177, 37, 11177)).
	pue(cloud12, 1.21).
	energySourceMix(cloud12, [(0.68,offshorewind), (0.32,solar)]).
	ramEnergyProfile(cloud12, L, E) :- E is 0.058 * L.
	cpuEnergyProfile(cloud12, L, E) :- E is 0.416 * L.
	storageEnergyProfile(cloud12, L, E) :- E is 0.06 * L.
	energyCost(cloud12, 0.49).

node(edge37, edge, (22, 11, 1501)).
	totHW(edge37, (24, 12, 1617)).
	pue(edge37, 1.15).
	energySourceMix(edge37, [(0.28,gas), (0.18,onshorewind), (0.54,offshorewind)]).
	ramEnergyProfile(edge37, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge37, L, E) :- E is 0.15 * L.
	storageEnergyProfile(edge37, L, E) :- E is 0.012 * L.
	energyCost(edge37, 0.403).

node(cloud13, cloud, (142, 26, 6081)).
	totHW(cloud13, (151, 28, 6457)).
	pue(cloud13, 1.55).
	energySourceMix(cloud13, [(0.52,coal), (0.48,gas)]).
	ramEnergyProfile(cloud13, L, E) :- E is 0.047 * L.
	cpuEnergyProfile(cloud13, L, E) :- E is 0.293 * L.
	storageEnergyProfile(cloud13, L, E) :- E is 0.032 * L.
	energyCost(cloud13, 0.124).

link(cloud1, edge1, 55, 283).
link(edge1, cloud1, 55, 283).
link(cloud1, cloud2, 17, 493).
link(cloud2, cloud1, 17, 493).
link(cloud1, edge3, 68, 214).
link(edge3, cloud1, 68, 214).
link(cloud1, edge6, 67, 248).
link(edge6, cloud1, 67, 248).
link(cloud1, edge10, 72, 246).
link(edge10, cloud1, 72, 246).
link(cloud1, cloud5, 16, 439).
link(cloud5, cloud1, 16, 439).
link(cloud1, edge11, 62, 286).
link(edge11, cloud1, 62, 286).
link(cloud1, edge14, 64, 249).
link(edge14, cloud1, 64, 249).
link(cloud1, edge15, 63, 275).
link(edge15, cloud1, 63, 275).
link(cloud1, edge16, 75, 267).
link(edge16, cloud1, 75, 267).
link(cloud1, edge17, 72, 288).
link(edge17, cloud1, 72, 288).
link(cloud1, edge18, 36, 218).
link(edge18, cloud1, 36, 218).
link(cloud1, edge20, 42, 285).
link(edge20, cloud1, 42, 285).
link(cloud1, edge23, 69, 259).
link(edge23, cloud1, 69, 259).
link(cloud1, cloud8, 10, 423).
link(cloud8, cloud1, 10, 423).
link(cloud1, cloud9, 10, 381).
link(cloud9, cloud1, 10, 381).
link(cloud1, cloud10, 18, 712).
link(cloud10, cloud1, 18, 712).
link(cloud1, edge25, 38, 296).
link(edge25, cloud1, 38, 296).
link(cloud1, edge27, 53, 281).
link(edge27, cloud1, 53, 281).
link(cloud1, edge33, 65, 282).
link(edge33, cloud1, 65, 282).
link(cloud1, cloud12, 6, 879).
link(cloud12, cloud1, 6, 879).
link(cloud1, edge37, 56, 299).
link(edge37, cloud1, 56, 299).
link(cloud1, cloud13, 6, 871).
link(cloud13, cloud1, 6, 871).
link(edge2, cloud1, 64, 217).
link(cloud1, edge2, 64, 217).
link(edge4, cloud1, 47, 211).
link(cloud1, edge4, 47, 211).
link(edge5, cloud1, 64, 241).
link(cloud1, edge5, 64, 241).
link(edge8, cloud1, 47, 268).
link(cloud1, edge8, 47, 268).
link(cloud3, cloud1, 7, 585).
link(cloud1, cloud3, 7, 585).
link(cloud4, cloud1, 8, 906).
link(cloud1, cloud4, 8, 906).
link(edge12, cloud1, 78, 261).
link(cloud1, edge12, 78, 261).
link(edge13, cloud1, 58, 205).
link(cloud1, edge13, 58, 205).
link(edge19, cloud1, 35, 245).
link(cloud1, edge19, 35, 245).
link(cloud6, cloud1, 16, 525).
link(cloud1, cloud6, 16, 525).
link(edge22, cloud1, 25, 275).
link(cloud1, edge22, 25, 275).
link(edge26, cloud1, 41, 206).
link(cloud1, edge26, 41, 206).
link(edge30, cloud1, 34, 216).
link(cloud1, edge30, 34, 216).
link(edge32, cloud1, 49, 214).
link(cloud1, edge32, 49, 214).
link(edge35, cloud1, 32, 271).
link(cloud1, edge35, 32, 271).
link(edge36, cloud1, 40, 218).
link(cloud1, edge36, 40, 218).
link(cloud1, edge7, 53, 271).
link(edge7, cloud1, 53, 271).
link(cloud1, edge9, 43, 224).
link(edge9, cloud1, 43, 224).
link(cloud1, edge21, 38, 203).
link(edge21, cloud1, 38, 203).
link(cloud1, cloud7, 16, 642).
link(cloud7, cloud1, 16, 642).
link(cloud1, edge24, 35, 232).
link(edge24, cloud1, 35, 232).
link(cloud1, edge28, 42, 284).
link(edge28, cloud1, 42, 284).
link(cloud1, cloud11, 13, 595).
link(cloud11, cloud1, 13, 595).
link(cloud1, edge29, 40, 201).
link(edge29, cloud1, 40, 201).
link(cloud1, edge31, 37, 297).
link(edge31, cloud1, 37, 297).
link(cloud1, edge34, 40, 210).
link(edge34, cloud1, 40, 210).
link(edge1, edge4, 45, 195).
link(edge4, edge1, 45, 195).
link(edge1, edge5, 44, 141).
link(edge5, edge1, 44, 141).
link(edge1, edge7, 43, 181).
link(edge7, edge1, 43, 181).
link(edge1, edge9, 15, 137).
link(edge9, edge1, 15, 137).
link(edge1, cloud3, 36, 213).
link(cloud3, edge1, 36, 213).
link(edge1, cloud4, 34, 265).
link(cloud4, edge1, 34, 265).
link(edge1, edge12, 22, 109).
link(edge12, edge1, 22, 109).
link(edge1, edge15, 31, 108).
link(edge15, edge1, 31, 108).
link(edge1, edge18, 16, 181).
link(edge18, edge1, 16, 181).
link(edge1, cloud6, 51, 289).
link(cloud6, edge1, 51, 289).
link(edge1, cloud8, 64, 201).
link(cloud8, edge1, 64, 201).
link(edge1, edge24, 47, 184).
link(edge24, edge1, 47, 184).
link(edge1, cloud9, 72, 272).
link(cloud9, edge1, 72, 272).
link(edge1, edge26, 25, 136).
link(edge26, edge1, 25, 136).
link(edge1, edge28, 35, 195).
link(edge28, edge1, 35, 195).
link(edge1, edge29, 16, 146).
link(edge29, edge1, 16, 146).
link(edge1, edge30, 29, 100).
link(edge30, edge1, 29, 100).
link(edge1, edge31, 34, 163).
link(edge31, edge1, 34, 163).
link(edge1, edge36, 41, 114).
link(edge36, edge1, 41, 114).
link(edge1, cloud12, 30, 277).
link(cloud12, edge1, 30, 277).
link(cloud2, edge1, 47, 217).
link(edge1, cloud2, 47, 217).
link(edge3, edge1, 42, 113).
link(edge1, edge3, 42, 113).
link(edge16, edge1, 49, 146).
link(edge1, edge16, 49, 146).
link(edge17, edge1, 40, 195).
link(edge1, edge17, 40, 195).
link(edge21, edge1, 27, 143).
link(edge1, edge21, 27, 143).
link(edge23, edge1, 29, 131).
link(edge1, edge23, 29, 131).
link(cloud13, edge1, 27, 244).
link(edge1, cloud13, 27, 244).
link(edge1, edge2, 31, 179).
link(edge2, edge1, 31, 179).
link(edge1, edge6, 31, 112).
link(edge6, edge1, 31, 112).
link(edge1, edge8, 51, 158).
link(edge8, edge1, 51, 158).
link(edge1, edge10, 33, 184).
link(edge10, edge1, 33, 184).
link(edge1, cloud5, 42, 215).
link(cloud5, edge1, 42, 215).
link(edge1, edge11, 31, 174).
link(edge11, edge1, 31, 174).
link(edge1, edge13, 34, 139).
link(edge13, edge1, 34, 139).
link(edge1, edge14, 39, 145).
link(edge14, edge1, 39, 145).
link(edge1, edge19, 35, 100).
link(edge19, edge1, 35, 100).
link(edge1, edge20, 31, 141).
link(edge20, edge1, 31, 141).
link(edge1, cloud7, 40, 260).
link(cloud7, edge1, 40, 260).
link(edge1, edge22, 46, 142).
link(edge22, edge1, 46, 142).
link(edge1, cloud10, 32, 292).
link(cloud10, edge1, 32, 292).
link(edge1, edge25, 37, 132).
link(edge25, edge1, 37, 132).
link(edge1, edge27, 32, 106).
link(edge27, edge1, 32, 106).
link(edge1, cloud11, 39, 238).
link(cloud11, edge1, 39, 238).
link(edge1, edge32, 30, 144).
link(edge32, edge1, 30, 144).
link(edge1, edge33, 44, 121).
link(edge33, edge1, 44, 121).
link(edge1, edge34, 38, 137).
link(edge34, edge1, 38, 137).
link(edge1, edge35, 46, 171).
link(edge35, edge1, 46, 171).
link(edge1, edge37, 45, 191).
link(edge37, edge1, 45, 191).
link(edge2, cloud2, 65, 294).
link(cloud2, edge2, 65, 294).
link(edge2, edge4, 20, 100).
link(edge4, edge2, 20, 100).
link(edge2, edge7, 40, 160).
link(edge7, edge2, 40, 160).
link(edge2, cloud4, 46, 255).
link(cloud4, edge2, 46, 255).
link(edge2, cloud5, 48, 284).
link(cloud5, edge2, 48, 284).
link(edge2, edge11, 15, 135).
link(edge11, edge2, 15, 135).
link(edge2, edge12, 23, 188).
link(edge12, edge2, 23, 188).
link(edge2, edge14, 32, 134).
link(edge14, edge2, 32, 134).
link(edge2, edge15, 24, 131).
link(edge15, edge2, 24, 131).
link(edge2, edge16, 43, 112).
link(edge16, edge2, 43, 112).
link(edge2, edge19, 33, 165).
link(edge19, edge2, 33, 165).
link(edge2, cloud6, 31, 261).
link(cloud6, edge2, 31, 261).
link(edge2, edge20, 31, 162).
link(edge20, edge2, 31, 162).
link(edge2, cloud7, 52, 267).
link(cloud7, edge2, 52, 267).
link(edge2, edge23, 26, 159).
link(edge23, edge2, 26, 159).
link(edge2, cloud9, 77, 258).
link(cloud9, edge2, 77, 258).
link(edge2, cloud10, 60, 252).
link(cloud10, edge2, 60, 252).
link(edge2, edge25, 36, 130).
link(edge25, edge2, 36, 130).
link(edge2, edge34, 27, 163).
link(edge34, edge2, 27, 163).
link(edge6, edge2, 17, 195).
link(edge2, edge6, 17, 195).
link(edge9, edge2, 16, 112).
link(edge2, edge9, 16, 112).
link(edge22, edge2, 36, 107).
link(edge2, edge22, 36, 107).
link(edge24, edge2, 34, 170).
link(edge2, edge24, 34, 170).
link(edge26, edge2, 37, 115).
link(edge2, edge26, 37, 115).
link(edge30, edge2, 34, 193).
link(edge2, edge30, 34, 193).
link(edge35, edge2, 38, 105).
link(edge2, edge35, 38, 105).
link(edge36, edge2, 44, 171).
link(edge2, edge36, 44, 171).
link(cloud13, edge2, 48, 217).
link(edge2, cloud13, 48, 217).
link(edge2, edge3, 36, 150).
link(edge3, edge2, 36, 150).
link(edge2, edge5, 47, 124).
link(edge5, edge2, 47, 124).
link(edge2, edge8, 37, 144).
link(edge8, edge2, 37, 144).
link(edge2, edge10, 34, 149).
link(edge10, edge2, 34, 149).
link(edge2, cloud3, 38, 254).
link(cloud3, edge2, 38, 254).
link(edge2, edge13, 47, 108).
link(edge13, edge2, 47, 108).
link(edge2, edge17, 40, 169).
link(edge17, edge2, 40, 169).
link(edge2, edge18, 32, 116).
link(edge18, edge2, 32, 116).
link(edge2, edge21, 57, 198).
link(edge21, edge2, 57, 198).
link(edge2, cloud8, 44, 240).
link(cloud8, edge2, 44, 240).
link(edge2, edge27, 33, 115).
link(edge27, edge2, 33, 115).
link(edge2, edge28, 48, 121).
link(edge28, edge2, 48, 121).
link(edge2, cloud11, 41, 211).
link(cloud11, edge2, 41, 211).
link(edge2, edge29, 31, 190).
link(edge29, edge2, 31, 190).
link(edge2, edge31, 34, 145).
link(edge31, edge2, 34, 145).
link(edge2, edge32, 31, 145).
link(edge32, edge2, 31, 145).
link(edge2, edge33, 48, 135).
link(edge33, edge2, 48, 135).
link(edge2, cloud12, 44, 232).
link(cloud12, edge2, 44, 232).
link(edge2, edge37, 42, 106).
link(edge37, edge2, 42, 106).
link(cloud2, edge3, 72, 223).
link(edge3, cloud2, 72, 223).
link(cloud2, edge5, 66, 261).
link(edge5, cloud2, 66, 261).
link(cloud2, cloud4, 7, 621).
link(cloud4, cloud2, 7, 621).
link(cloud2, cloud5, 5, 657).
link(cloud5, cloud2, 5, 657).
link(cloud2, edge12, 48, 250).
link(edge12, cloud2, 48, 250).
link(cloud2, edge16, 78, 202).
link(edge16, cloud2, 78, 202).
link(cloud2, edge19, 30, 271).
link(edge19, cloud2, 30, 271).
link(cloud2, cloud6, 15, 600).
link(cloud6, cloud2, 15, 600).
link(cloud2, edge20, 55, 279).
link(edge20, cloud2, 55, 279).
link(cloud2, edge22, 62, 290).
link(edge22, cloud2, 62, 290).
link(cloud2, edge23, 76, 296).
link(edge23, cloud2, 76, 296).
link(cloud2, cloud9, 10, 742).
link(cloud9, cloud2, 10, 742).
link(cloud2, edge27, 27, 229).
link(edge27, cloud2, 27, 229).
link(cloud2, edge28, 47, 222).
link(edge28, cloud2, 47, 222).
link(cloud2, edge33, 52, 270).
link(edge33, cloud2, 52, 270).
link(cloud2, edge35, 71, 200).
link(edge35, cloud2, 71, 200).
link(cloud2, cloud12, 16, 627).
link(cloud12, cloud2, 16, 627).
link(edge4, cloud2, 59, 209).
link(cloud2, edge4, 59, 209).
link(edge6, cloud2, 32, 211).
link(cloud2, edge6, 32, 211).
link(edge7, cloud2, 59, 238).
link(cloud2, edge7, 59, 238).
link(edge8, cloud2, 45, 203).
link(cloud2, edge8, 45, 203).
link(edge9, cloud2, 42, 220).
link(cloud2, edge9, 42, 220).
link(edge11, cloud2, 57, 281).
link(cloud2, edge11, 57, 281).
link(edge18, cloud2, 33, 285).
link(cloud2, edge18, 33, 285).
link(edge21, cloud2, 31, 256).
link(cloud2, edge21, 31, 256).
link(cloud7, cloud2, 19, 495).
link(cloud2, cloud7, 19, 495).
link(cloud8, cloud2, 19, 414).
link(cloud2, cloud8, 19, 414).
link(edge24, cloud2, 27, 231).
link(cloud2, edge24, 27, 231).
link(edge26, cloud2, 56, 275).
link(cloud2, edge26, 56, 275).
link(edge29, cloud2, 50, 228).
link(cloud2, edge29, 50, 228).
link(edge30, cloud2, 35, 288).
link(cloud2, edge30, 35, 288).
link(edge36, cloud2, 58, 266).
link(cloud2, edge36, 58, 266).
link(edge37, cloud2, 76, 219).
link(cloud2, edge37, 76, 219).
link(cloud2, edge10, 51, 254).
link(edge10, cloud2, 51, 254).
link(cloud2, cloud3, 18, 664).
link(cloud3, cloud2, 18, 664).
link(cloud2, edge13, 42, 254).
link(edge13, cloud2, 42, 254).
link(cloud2, edge14, 40, 220).
link(edge14, cloud2, 40, 220).
link(cloud2, edge15, 43, 287).
link(edge15, cloud2, 43, 287).
link(cloud2, edge17, 38, 219).
link(edge17, cloud2, 38, 219).
link(cloud2, cloud10, 13, 988).
link(cloud10, cloud2, 13, 988).
link(cloud2, edge25, 37, 262).
link(edge25, cloud2, 37, 262).
link(cloud2, cloud11, 12, 500).
link(cloud11, cloud2, 12, 500).
link(cloud2, edge31, 40, 258).
link(edge31, cloud2, 40, 258).
link(cloud2, edge32, 37, 261).
link(edge32, cloud2, 37, 261).
link(cloud2, edge34, 39, 279).
link(edge34, cloud2, 39, 279).
link(cloud2, cloud13, 16, 808).
link(cloud13, cloud2, 16, 808).
link(edge3, edge4, 33, 102).
link(edge4, edge3, 33, 102).
link(edge3, edge6, 19, 150).
link(edge6, edge3, 19, 150).
link(edge3, edge9, 45, 164).
link(edge9, edge3, 45, 164).
link(edge3, edge11, 25, 150).
link(edge11, edge3, 25, 150).
link(edge3, edge14, 29, 175).
link(edge14, edge3, 29, 175).
link(edge3, edge16, 38, 176).
link(edge16, edge3, 38, 176).
link(edge3, edge17, 32, 158).
link(edge17, edge3, 32, 158).
link(edge3, edge21, 31, 138).
link(edge21, edge3, 31, 138).
link(edge3, cloud7, 54, 270).
link(cloud7, edge3, 54, 270).
link(edge3, edge22, 43, 187).
link(edge22, edge3, 43, 187).
link(edge3, edge23, 18, 132).
link(edge23, edge3, 18, 132).
link(edge3, cloud9, 67, 248).
link(cloud9, edge3, 67, 248).
link(edge3, cloud10, 68, 276).
link(cloud10, edge3, 68, 276).
link(edge3, edge26, 21, 181).
link(edge26, edge3, 21, 181).
link(edge3, edge30, 45, 182).
link(edge30, edge3, 45, 182).
link(edge3, edge31, 30, 117).
link(edge31, edge3, 30, 117).
link(edge3, edge32, 39, 158).
link(edge32, edge3, 39, 158).
link(edge3, edge34, 36, 129).
link(edge34, edge3, 36, 129).
link(edge3, cloud12, 76, 200).
link(cloud12, edge3, 76, 200).
link(edge3, edge37, 44, 175).
link(edge37, edge3, 44, 175).
link(edge7, edge3, 49, 148).
link(edge3, edge7, 49, 148).
link(cloud4, edge3, 79, 255).
link(edge3, cloud4, 79, 255).
link(edge13, edge3, 45, 162).
link(edge3, edge13, 45, 162).
link(edge19, edge3, 24, 145).
link(edge3, edge19, 24, 145).
link(cloud8, edge3, 63, 253).
link(edge3, cloud8, 63, 253).
link(cloud11, edge3, 75, 284).
link(edge3, cloud11, 75, 284).
link(edge35, edge3, 37, 165).
link(edge3, edge35, 37, 165).
link(edge3, edge5, 48, 195).
link(edge5, edge3, 48, 195).
link(edge3, edge8, 39, 121).
link(edge8, edge3, 39, 121).
link(edge3, edge10, 36, 158).
link(edge10, edge3, 36, 158).
link(edge3, cloud3, 50, 283).
link(cloud3, edge3, 50, 283).
link(edge3, cloud5, 54, 297).
link(cloud5, edge3, 54, 297).
link(edge3, edge12, 46, 102).
link(edge12, edge3, 46, 102).
link(edge3, edge15, 44, 157).
link(edge15, edge3, 44, 157).
link(edge3, edge18, 34, 125).
link(edge18, edge3, 34, 125).
link(edge3, cloud6, 46, 272).
link(cloud6, edge3, 46, 272).
link(edge3, edge20, 50, 123).
link(edge20, edge3, 50, 123).
link(edge3, edge24, 44, 106).
link(edge24, edge3, 44, 106).
link(edge3, edge25, 40, 187).
link(edge25, edge3, 40, 187).
link(edge3, edge27, 49, 106).
link(edge27, edge3, 49, 106).
link(edge3, edge28, 50, 158).
link(edge28, edge3, 50, 158).
link(edge3, edge29, 41, 147).
link(edge29, edge3, 41, 147).
link(edge3, edge33, 48, 133).
link(edge33, edge3, 48, 133).
link(edge3, edge36, 48, 159).
link(edge36, edge3, 48, 159).
link(edge3, cloud13, 45, 265).
link(cloud13, edge3, 45, 265).
link(edge4, edge5, 37, 115).
link(edge5, edge4, 37, 115).
link(edge4, edge6, 39, 163).
link(edge6, edge4, 39, 163).
link(edge4, edge10, 25, 185).
link(edge10, edge4, 25, 185).
link(edge4, cloud3, 63, 250).
link(cloud3, edge4, 63, 250).
link(edge4, edge17, 23, 125).
link(edge17, edge4, 23, 125).
link(edge4, edge19, 38, 113).
link(edge19, edge4, 38, 113).
link(edge4, cloud7, 37, 213).
link(cloud7, edge4, 37, 213).
link(edge4, edge27, 23, 100).
link(edge27, edge4, 23, 100).
link(edge4, cloud11, 46, 237).
link(cloud11, edge4, 46, 237).
link(edge4, edge29, 25, 111).
link(edge29, edge4, 25, 111).
link(edge4, edge31, 26, 196).
link(edge31, edge4, 26, 196).
link(edge4, edge32, 24, 123).
link(edge32, edge4, 24, 123).
link(edge4, edge34, 47, 103).
link(edge34, edge4, 47, 103).
link(edge4, edge36, 38, 119).
link(edge36, edge4, 38, 119).
link(edge4, cloud13, 64, 209).
link(cloud13, edge4, 64, 209).
link(cloud5, edge4, 26, 255).
link(edge4, cloud5, 26, 255).
link(edge11, edge4, 40, 158).
link(edge4, edge11, 40, 158).
link(edge18, edge4, 45, 138).
link(edge4, edge18, 45, 138).
link(edge20, edge4, 17, 101).
link(edge4, edge20, 17, 101).
link(edge21, edge4, 40, 150).
link(edge4, edge21, 40, 150).
link(cloud8, edge4, 71, 217).
link(edge4, cloud8, 71, 217).
link(edge24, edge4, 39, 157).
link(edge4, edge24, 39, 157).
link(edge26, edge4, 47, 170).
link(edge4, edge26, 47, 170).
link(edge30, edge4, 35, 169).
link(edge4, edge30, 35, 169).
link(edge4, edge7, 40, 146).
link(edge7, edge4, 40, 146).
link(edge4, edge8, 42, 129).
link(edge8, edge4, 42, 129).
link(edge4, edge9, 33, 134).
link(edge9, edge4, 33, 134).
link(edge4, cloud4, 38, 289).
link(cloud4, edge4, 38, 289).
link(edge4, edge12, 40, 150).
link(edge12, edge4, 40, 150).
link(edge4, edge13, 43, 115).
link(edge13, edge4, 43, 115).
link(edge4, edge14, 45, 113).
link(edge14, edge4, 45, 113).
link(edge4, edge15, 42, 194).
link(edge15, edge4, 42, 194).
link(edge4, edge16, 51, 156).
link(edge16, edge4, 51, 156).
link(edge4, cloud6, 34, 229).
link(cloud6, edge4, 34, 229).
link(edge4, edge22, 39, 112).
link(edge22, edge4, 39, 112).
link(edge4, edge23, 43, 138).
link(edge23, edge4, 43, 138).
link(edge4, cloud9, 41, 208).
link(cloud9, edge4, 41, 208).
link(edge4, cloud10, 39, 274).
link(cloud10, edge4, 39, 274).
link(edge4, edge25, 50, 106).
link(edge25, edge4, 50, 106).
link(edge4, edge28, 49, 130).
link(edge28, edge4, 49, 130).
link(edge4, edge33, 34, 104).
link(edge33, edge4, 34, 104).
link(edge4, edge35, 32, 103).
link(edge35, edge4, 32, 103).
link(edge4, cloud12, 41, 284).
link(cloud12, edge4, 41, 284).
link(edge4, edge37, 54, 187).
link(edge37, edge4, 54, 187).
link(edge5, edge6, 47, 172).
link(edge6, edge5, 47, 172).
link(edge5, edge11, 36, 121).
link(edge11, edge5, 36, 121).
link(edge5, edge15, 30, 154).
link(edge15, edge5, 30, 154).
link(edge5, edge17, 16, 192).
link(edge17, edge5, 16, 192).
link(edge5, edge19, 33, 125).
link(edge19, edge5, 33, 125).
link(edge5, cloud6, 74, 213).
link(cloud6, edge5, 74, 213).
link(edge5, edge21, 37, 133).
link(edge21, edge5, 37, 133).
link(edge5, edge22, 42, 181).
link(edge22, edge5, 42, 181).
link(edge5, edge23, 34, 179).
link(edge23, edge5, 34, 179).
link(edge5, cloud10, 59, 205).
link(cloud10, edge5, 59, 205).
link(edge5, cloud11, 76, 277).
link(cloud11, edge5, 76, 277).
link(edge5, edge29, 26, 155).
link(edge29, edge5, 26, 155).
link(edge5, edge32, 28, 146).
link(edge32, edge5, 28, 146).
link(edge5, edge34, 20, 112).
link(edge34, edge5, 20, 112).
link(edge5, edge36, 19, 186).
link(edge36, edge5, 19, 186).
link(edge7, edge5, 22, 180).
link(edge5, edge7, 22, 180).
link(edge12, edge5, 47, 179).
link(edge5, edge12, 47, 179).
link(cloud9, edge5, 33, 296).
link(edge5, cloud9, 33, 296).
link(edge25, edge5, 21, 100).
link(edge5, edge25, 21, 100).
link(edge28, edge5, 47, 109).
link(edge5, edge28, 47, 109).
link(edge33, edge5, 18, 169).
link(edge5, edge33, 18, 169).
link(cloud12, edge5, 56, 254).
link(edge5, cloud12, 56, 254).
link(edge37, edge5, 25, 135).
link(edge5, edge37, 25, 135).
link(edge5, edge8, 35, 121).
link(edge8, edge5, 35, 121).
link(edge5, edge9, 40, 198).
link(edge9, edge5, 40, 198).
link(edge5, edge10, 34, 134).
link(edge10, edge5, 34, 134).
link(edge5, cloud3, 50, 206).
link(cloud3, edge5, 50, 206).
link(edge5, cloud4, 44, 298).
link(cloud4, edge5, 44, 298).
link(edge5, cloud5, 44, 223).
link(cloud5, edge5, 44, 223).
link(edge5, edge13, 50, 199).
link(edge13, edge5, 50, 199).
link(edge5, edge14, 45, 182).
link(edge14, edge5, 45, 182).
link(edge5, edge16, 37, 195).
link(edge16, edge5, 37, 195).
link(edge5, edge18, 42, 118).
link(edge18, edge5, 42, 118).
link(edge5, edge20, 35, 138).
link(edge20, edge5, 35, 138).
link(edge5, cloud7, 46, 297).
link(cloud7, edge5, 46, 297).
link(edge5, cloud8, 53, 291).
link(cloud8, edge5, 53, 291).
link(edge5, edge24, 46, 188).
link(edge24, edge5, 46, 188).
link(edge5, edge26, 40, 135).
link(edge26, edge5, 40, 135).
link(edge5, edge27, 39, 138).
link(edge27, edge5, 39, 138).
link(edge5, edge30, 37, 142).
link(edge30, edge5, 37, 142).
link(edge5, edge31, 38, 105).
link(edge31, edge5, 38, 105).
link(edge5, edge35, 31, 177).
link(edge35, edge5, 31, 177).
link(edge5, cloud13, 49, 206).
link(cloud13, edge5, 49, 206).
link(edge6, edge9, 36, 168).
link(edge9, edge6, 36, 168).
link(edge6, cloud4, 31, 254).
link(cloud4, edge6, 31, 254).
link(edge6, edge12, 37, 143).
link(edge12, edge6, 37, 143).
link(edge6, edge17, 45, 185).
link(edge17, edge6, 45, 185).
link(edge6, edge18, 15, 117).
link(edge18, edge6, 15, 117).
link(edge6, edge19, 33, 196).
link(edge19, edge6, 33, 196).
link(edge6, cloud6, 27, 254).
link(cloud6, edge6, 27, 254).
link(edge6, edge20, 45, 140).
link(edge20, edge6, 45, 140).
link(edge6, edge21, 48, 198).
link(edge21, edge6, 48, 198).
link(edge6, cloud7, 36, 261).
link(cloud7, edge6, 36, 261).
link(edge6, edge23, 15, 104).
link(edge23, edge6, 15, 104).
link(edge6, cloud8, 44, 235).
link(cloud8, edge6, 44, 235).
link(edge6, cloud10, 58, 245).
link(cloud10, edge6, 58, 245).
link(edge6, edge25, 49, 172).
link(edge25, edge6, 49, 172).
link(edge6, edge26, 42, 153).
link(edge26, edge6, 42, 153).
link(edge6, cloud11, 63, 260).
link(cloud11, edge6, 63, 260).
link(edge6, edge30, 38, 183).
link(edge30, edge6, 38, 183).
link(edge6, edge32, 15, 114).
link(edge32, edge6, 15, 114).
link(edge6, edge36, 42, 198).
link(edge36, edge6, 42, 198).
link(edge6, cloud12, 78, 202).
link(cloud12, edge6, 78, 202).
link(edge6, cloud13, 26, 272).
link(cloud13, edge6, 26, 272).
link(edge8, edge6, 20, 178).
link(edge6, edge8, 20, 178).
link(cloud5, edge6, 45, 227).
link(edge6, cloud5, 45, 227).
link(edge14, edge6, 35, 129).
link(edge6, edge14, 35, 129).
link(cloud9, edge6, 48, 214).
link(edge6, cloud9, 48, 214).
link(edge27, edge6, 43, 194).
link(edge6, edge27, 43, 194).
link(edge31, edge6, 17, 107).
link(edge6, edge31, 17, 107).
link(edge6, edge7, 47, 190).
link(edge7, edge6, 47, 190).
link(edge6, edge10, 33, 128).
link(edge10, edge6, 33, 128).
link(edge6, cloud3, 31, 280).
link(cloud3, edge6, 31, 280).
link(edge6, edge11, 32, 124).
link(edge11, edge6, 32, 124).
link(edge6, edge13, 33, 133).
link(edge13, edge6, 33, 133).
link(edge6, edge15, 36, 143).
link(edge15, edge6, 36, 143).
link(edge6, edge16, 49, 170).
link(edge16, edge6, 49, 170).
link(edge6, edge22, 31, 139).
link(edge22, edge6, 31, 139).
link(edge6, edge24, 51, 112).
link(edge24, edge6, 51, 112).
link(edge6, edge28, 38, 189).
link(edge28, edge6, 38, 189).
link(edge6, edge29, 32, 171).
link(edge29, edge6, 32, 171).
link(edge6, edge33, 49, 109).
link(edge33, edge6, 49, 109).
link(edge6, edge34, 41, 100).
link(edge34, edge6, 41, 100).
link(edge6, edge35, 41, 118).
link(edge35, edge6, 41, 118).
link(edge6, edge37, 31, 111).
link(edge37, edge6, 31, 111).
link(edge7, edge8, 32, 149).
link(edge8, edge7, 32, 149).
link(edge7, edge10, 23, 191).
link(edge10, edge7, 23, 191).
link(edge7, cloud3, 46, 201).
link(cloud3, edge7, 46, 201).
link(edge7, cloud5, 67, 211).
link(cloud5, edge7, 67, 211).
link(edge7, edge12, 39, 184).
link(edge12, edge7, 39, 184).
link(edge7, edge19, 29, 189).
link(edge19, edge7, 29, 189).
link(edge7, edge21, 19, 111).
link(edge21, edge7, 19, 111).
link(edge7, edge25, 17, 194).
link(edge25, edge7, 17, 194).
link(edge7, edge26, 42, 134).
link(edge26, edge7, 42, 134).
link(edge7, edge28, 29, 143).
link(edge28, edge7, 29, 143).
link(edge7, edge30, 48, 113).
link(edge30, edge7, 48, 113).
link(edge7, edge31, 38, 149).
link(edge31, edge7, 38, 149).
link(edge7, edge32, 40, 128).
link(edge32, edge7, 40, 128).
link(edge7, edge34, 48, 141).
link(edge34, edge7, 48, 141).
link(edge7, cloud12, 68, 210).
link(cloud12, edge7, 68, 210).
link(edge11, edge7, 40, 116).
link(edge7, edge11, 40, 116).
link(edge14, edge7, 38, 176).
link(edge7, edge14, 38, 176).
link(edge16, edge7, 37, 134).
link(edge7, edge16, 37, 134).
link(edge20, edge7, 25, 108).
link(edge7, edge20, 25, 108).
link(cloud7, edge7, 37, 273).
link(edge7, cloud7, 37, 273).
link(edge23, edge7, 35, 124).
link(edge7, edge23, 35, 124).
link(cloud9, edge7, 78, 268).
link(edge7, cloud9, 78, 268).
link(cloud10, edge7, 42, 292).
link(edge7, cloud10, 42, 292).
link(edge29, edge7, 15, 198).
link(edge7, edge29, 15, 198).
link(edge37, edge7, 26, 121).
link(edge7, edge37, 26, 121).
link(edge7, edge9, 41, 134).
link(edge9, edge7, 41, 134).
link(edge7, cloud4, 47, 261).
link(cloud4, edge7, 47, 261).
link(edge7, edge13, 41, 172).
link(edge13, edge7, 41, 172).
link(edge7, edge15, 40, 177).
link(edge15, edge7, 40, 177).
link(edge7, edge17, 38, 181).
link(edge17, edge7, 38, 181).
link(edge7, edge18, 38, 150).
link(edge18, edge7, 38, 150).
link(edge7, cloud6, 42, 222).
link(cloud6, edge7, 42, 222).
link(edge7, edge22, 40, 195).
link(edge22, edge7, 40, 195).
link(edge7, cloud8, 51, 200).
link(cloud8, edge7, 51, 200).
link(edge7, edge24, 49, 171).
link(edge24, edge7, 49, 171).
link(edge7, edge27, 47, 106).
link(edge27, edge7, 47, 106).
link(edge7, cloud11, 42, 204).
link(cloud11, edge7, 42, 204).
link(edge7, edge33, 36, 160).
link(edge33, edge7, 36, 160).
link(edge7, edge35, 40, 109).
link(edge35, edge7, 40, 109).
link(edge7, edge36, 37, 132).
link(edge36, edge7, 37, 132).
link(edge7, cloud13, 47, 208).
link(cloud13, edge7, 47, 208).
link(edge8, cloud3, 54, 253).
link(cloud3, edge8, 54, 253).
link(edge8, edge16, 42, 183).
link(edge16, edge8, 42, 183).
link(edge8, edge17, 19, 132).
link(edge17, edge8, 19, 132).
link(edge8, cloud6, 72, 225).
link(cloud6, edge8, 72, 225).
link(edge8, edge21, 34, 174).
link(edge21, edge8, 34, 174).
link(edge8, edge23, 41, 125).
link(edge23, edge8, 41, 125).
link(edge8, cloud8, 39, 206).
link(cloud8, edge8, 39, 206).
link(edge8, cloud9, 71, 284).
link(cloud9, edge8, 71, 284).
link(edge8, edge25, 26, 108).
link(edge25, edge8, 26, 108).
link(edge8, edge28, 18, 132).
link(edge28, edge8, 18, 132).
link(edge8, edge29, 46, 186).
link(edge29, edge8, 46, 186).
link(edge8, edge30, 23, 190).
link(edge30, edge8, 23, 190).
link(edge8, edge31, 35, 188).
link(edge31, edge8, 35, 188).
link(edge8, edge33, 40, 192).
link(edge33, edge8, 40, 192).
link(edge10, edge8, 30, 116).
link(edge8, edge10, 30, 116).
link(cloud5, edge8, 41, 249).
link(edge8, cloud5, 41, 249).
link(edge11, edge8, 31, 175).
link(edge8, edge11, 31, 175).
link(edge22, edge8, 21, 192).
link(edge8, edge22, 21, 192).
link(edge24, edge8, 36, 135).
link(edge8, edge24, 36, 135).
link(cloud10, edge8, 61, 214).
link(edge8, cloud10, 61, 214).
link(edge36, edge8, 36, 166).
link(edge8, edge36, 36, 166).
link(edge37, edge8, 40, 192).
link(edge8, edge37, 40, 192).
link(cloud13, edge8, 76, 254).
link(edge8, cloud13, 76, 254).
link(edge8, edge9, 43, 100).
link(edge9, edge8, 43, 100).
link(edge8, cloud4, 50, 253).
link(cloud4, edge8, 50, 253).
link(edge8, edge12, 50, 116).
link(edge12, edge8, 50, 116).
link(edge8, edge13, 48, 145).
link(edge13, edge8, 48, 145).
link(edge8, edge14, 55, 159).
link(edge14, edge8, 55, 159).
link(edge8, edge15, 47, 105).
link(edge15, edge8, 47, 105).
link(edge8, edge18, 35, 182).
link(edge18, edge8, 35, 182).
link(edge8, edge19, 39, 193).
link(edge19, edge8, 39, 193).
link(edge8, edge20, 43, 177).
link(edge20, edge8, 43, 177).
link(edge8, cloud7, 46, 254).
link(cloud7, edge8, 46, 254).
link(edge8, edge26, 45, 190).
link(edge26, edge8, 45, 190).
link(edge8, edge27, 50, 172).
link(edge27, edge8, 50, 172).
link(edge8, cloud11, 51, 270).
link(cloud11, edge8, 51, 270).
link(edge8, edge32, 35, 134).
link(edge32, edge8, 35, 134).
link(edge8, edge34, 40, 115).
link(edge34, edge8, 40, 115).
link(edge8, edge35, 34, 175).
link(edge35, edge8, 34, 175).
link(edge8, cloud12, 46, 211).
link(cloud12, edge8, 46, 211).
link(edge9, edge10, 18, 135).
link(edge10, edge9, 18, 135).
link(edge9, cloud3, 69, 248).
link(cloud3, edge9, 69, 248).
link(edge9, edge11, 16, 183).
link(edge11, edge9, 16, 183).
link(edge9, edge13, 35, 144).
link(edge13, edge9, 35, 144).
link(edge9, edge16, 37, 198).
link(edge16, edge9, 37, 198).
link(edge9, edge21, 48, 125).
link(edge21, edge9, 48, 125).
link(edge9, cloud7, 43, 235).
link(cloud7, edge9, 43, 235).
link(edge9, edge24, 41, 176).
link(edge24, edge9, 41, 176).
link(edge9, cloud9, 62, 278).
link(cloud9, edge9, 62, 278).
link(edge9, cloud10, 32, 261).
link(cloud10, edge9, 32, 261).
link(edge9, edge27, 17, 111).
link(edge27, edge9, 17, 111).
link(edge9, edge28, 34, 151).
link(edge28, edge9, 34, 151).
link(edge9, edge32, 15, 140).
link(edge32, edge9, 15, 140).
link(edge9, edge34, 23, 105).
link(edge34, edge9, 23, 105).
link(edge9, edge35, 48, 160).
link(edge35, edge9, 48, 160).
link(edge9, cloud13, 48, 235).
link(cloud13, edge9, 48, 235).
link(edge12, edge9, 35, 185).
link(edge9, edge12, 35, 185).
link(edge14, edge9, 30, 156).
link(edge9, edge14, 30, 156).
link(edge17, edge9, 24, 196).
link(edge9, edge17, 24, 196).
link(edge18, edge9, 25, 171).
link(edge9, edge18, 25, 171).
link(edge19, edge9, 20, 194).
link(edge9, edge19, 20, 194).
link(cloud6, edge9, 46, 295).
link(edge9, cloud6, 46, 295).
link(edge20, edge9, 16, 185).
link(edge9, edge20, 16, 185).
link(edge29, edge9, 42, 199).
link(edge9, edge29, 42, 199).
link(edge30, edge9, 40, 151).
link(edge9, edge30, 40, 151).
link(edge37, edge9, 42, 104).
link(edge9, edge37, 42, 104).
link(edge9, cloud4, 38, 281).
link(cloud4, edge9, 38, 281).
link(edge9, cloud5, 45, 229).
link(cloud5, edge9, 45, 229).
link(edge9, edge15, 35, 113).
link(edge15, edge9, 35, 113).
link(edge9, edge22, 31, 135).
link(edge22, edge9, 31, 135).
link(edge9, edge23, 36, 119).
link(edge23, edge9, 36, 119).
link(edge9, cloud8, 41, 207).
link(cloud8, edge9, 41, 207).
link(edge9, edge25, 46, 134).
link(edge25, edge9, 46, 134).
link(edge9, edge26, 40, 145).
link(edge26, edge9, 40, 145).
link(edge9, cloud11, 43, 213).
link(cloud11, edge9, 43, 213).
link(edge9, edge31, 46, 180).
link(edge31, edge9, 46, 180).
link(edge9, edge33, 33, 198).
link(edge33, edge9, 33, 198).
link(edge9, edge36, 37, 126).
link(edge36, edge9, 37, 126).
link(edge9, cloud12, 43, 210).
link(cloud12, edge9, 43, 210).
link(edge10, cloud4, 73, 225).
link(cloud4, edge10, 73, 225).
link(edge10, cloud5, 61, 297).
link(cloud5, edge10, 61, 297).
link(edge10, edge12, 27, 135).
link(edge12, edge10, 27, 135).
link(edge10, edge15, 17, 130).
link(edge15, edge10, 17, 130).
link(edge10, edge21, 38, 117).
link(edge21, edge10, 38, 117).
link(edge10, edge23, 18, 162).
link(edge23, edge10, 18, 162).
link(edge10, cloud8, 79, 230).
link(cloud8, edge10, 79, 230).
link(edge10, edge24, 46, 187).
link(edge24, edge10, 46, 187).
link(edge10, edge26, 37, 109).
link(edge26, edge10, 37, 109).
link(edge10, edge27, 24, 170).
link(edge27, edge10, 24, 170).
link(edge10, edge30, 34, 196).
link(edge30, edge10, 34, 196).
link(edge10, edge31, 43, 153).
link(edge31, edge10, 43, 153).
link(edge10, edge33, 16, 101).
link(edge33, edge10, 16, 101).
link(edge10, edge34, 28, 140).
link(edge34, edge10, 28, 140).
link(edge10, edge37, 48, 150).
link(edge37, edge10, 48, 150).
link(edge10, cloud13, 58, 246).
link(cloud13, edge10, 58, 246).
link(edge13, edge10, 18, 192).
link(edge10, edge13, 18, 192).
link(edge14, edge10, 26, 111).
link(edge10, edge14, 26, 111).
link(edge20, edge10, 48, 119).
link(edge10, edge20, 48, 119).
link(cloud9, edge10, 68, 253).
link(edge10, cloud9, 68, 253).
link(edge29, edge10, 41, 166).
link(edge10, edge29, 41, 166).
link(edge32, edge10, 39, 116).
link(edge10, edge32, 39, 116).
link(edge35, edge10, 49, 162).
link(edge10, edge35, 49, 162).
link(cloud12, edge10, 58, 253).
link(edge10, cloud12, 58, 253).
link(edge10, cloud3, 50, 250).
link(cloud3, edge10, 50, 250).
link(edge10, edge11, 34, 130).
link(edge11, edge10, 34, 130).
link(edge10, edge16, 54, 102).
link(edge16, edge10, 54, 102).
link(edge10, edge17, 38, 108).
link(edge17, edge10, 38, 108).
link(edge10, edge18, 36, 149).
link(edge18, edge10, 36, 149).
link(edge10, edge19, 38, 184).
link(edge19, edge10, 38, 184).
link(edge10, cloud6, 51, 268).
link(cloud6, edge10, 51, 268).
link(edge10, cloud7, 46, 202).
link(cloud7, edge10, 46, 202).
link(edge10, edge22, 43, 108).
link(edge22, edge10, 43, 108).
link(edge10, cloud10, 50, 292).
link(cloud10, edge10, 50, 292).
link(edge10, edge25, 40, 101).
link(edge25, edge10, 40, 101).
link(edge10, edge28, 48, 188).
link(edge28, edge10, 48, 188).
link(edge10, cloud11, 41, 229).
link(cloud11, edge10, 41, 229).
link(edge10, edge36, 44, 172).
link(edge36, edge10, 44, 172).
link(cloud3, edge11, 62, 212).
link(edge11, cloud3, 62, 212).
link(cloud3, edge12, 63, 216).
link(edge12, cloud3, 63, 216).
link(cloud3, edge13, 64, 229).
link(edge13, cloud3, 64, 229).
link(cloud3, edge14, 73, 214).
link(edge14, cloud3, 73, 214).
link(cloud3, edge16, 70, 248).
link(edge16, cloud3, 70, 248).
link(cloud3, edge17, 56, 256).
link(edge17, cloud3, 56, 256).
link(cloud3, cloud6, 7, 555).
link(cloud6, cloud3, 7, 555).
link(cloud3, edge21, 73, 246).
link(edge21, cloud3, 73, 246).
link(cloud3, edge22, 66, 206).
link(edge22, cloud3, 66, 206).
link(cloud3, cloud8, 6, 762).
link(cloud8, cloud3, 6, 762).
link(cloud3, edge24, 28, 248).
link(edge24, cloud3, 28, 248).
link(cloud3, edge29, 41, 219).
link(edge29, cloud3, 41, 219).
link(cloud3, edge30, 41, 256).
link(edge30, cloud3, 41, 256).
link(cloud3, edge33, 39, 271).
link(edge33, cloud3, 39, 271).
link(cloud3, edge34, 63, 219).
link(edge34, cloud3, 63, 219).
link(cloud3, cloud12, 6, 653).
link(cloud12, cloud3, 6, 653).
link(edge15, cloud3, 33, 230).
link(cloud3, edge15, 33, 230).
link(cloud7, cloud3, 9, 357).
link(cloud3, cloud7, 9, 357).
link(cloud10, cloud3, 5, 833).
link(cloud3, cloud10, 5, 833).
link(edge31, cloud3, 30, 272).
link(cloud3, edge31, 30, 272).
link(edge36, cloud3, 37, 280).
link(cloud3, edge36, 37, 280).
link(edge37, cloud3, 58, 296).
link(cloud3, edge37, 58, 296).
link(cloud13, cloud3, 5, 811).
link(cloud3, cloud13, 5, 811).
link(cloud3, cloud4, 11, 851).
link(cloud4, cloud3, 11, 851).
link(cloud3, cloud5, 14, 384).
link(cloud5, cloud3, 14, 384).
link(cloud3, edge18, 32, 279).
link(edge18, cloud3, 32, 279).
link(cloud3, edge19, 42, 233).
link(edge19, cloud3, 42, 233).
link(cloud3, edge20, 46, 254).
link(edge20, cloud3, 46, 254).
link(cloud3, edge23, 46, 258).
link(edge23, cloud3, 46, 258).
link(cloud3, cloud9, 17, 773).
link(cloud9, cloud3, 17, 773).
link(cloud3, edge25, 32, 291).
link(edge25, cloud3, 32, 291).
link(cloud3, edge26, 32, 256).
link(edge26, cloud3, 32, 256).
link(cloud3, edge27, 37, 285).
link(edge27, cloud3, 37, 285).
link(cloud3, edge28, 36, 246).
link(edge28, cloud3, 36, 246).
link(cloud3, cloud11, 14, 981).
link(cloud11, cloud3, 14, 981).
link(cloud3, edge32, 36, 251).
link(edge32, cloud3, 36, 251).
link(cloud3, edge35, 36, 251).
link(edge35, cloud3, 36, 251).
link(cloud4, edge11, 43, 299).
link(edge11, cloud4, 43, 299).
link(cloud4, edge13, 35, 214).
link(edge13, cloud4, 35, 214).
link(cloud4, edge18, 77, 274).
link(edge18, cloud4, 77, 274).
link(cloud4, cloud6, 5, 525).
link(cloud6, cloud4, 5, 525).
link(cloud4, cloud10, 6, 964).
link(cloud10, cloud4, 6, 964).
link(cloud4, edge28, 45, 206).
link(edge28, cloud4, 45, 206).
link(cloud4, cloud11, 5, 888).
link(cloud11, cloud4, 5, 888).
link(cloud4, edge29, 73, 221).
link(edge29, cloud4, 73, 221).
link(cloud4, edge33, 53, 262).
link(edge33, cloud4, 53, 262).
link(cloud4, edge35, 50, 258).
link(edge35, cloud4, 50, 258).
link(cloud4, edge36, 25, 291).
link(edge36, cloud4, 25, 291).
link(cloud4, cloud12, 13, 750).
link(cloud12, cloud4, 13, 750).
link(cloud4, edge37, 40, 239).
link(edge37, cloud4, 40, 239).
link(cloud4, cloud13, 9, 640).
link(cloud13, cloud4, 9, 640).
link(edge14, cloud4, 70, 239).
link(cloud4, edge14, 70, 239).
link(edge16, cloud4, 76, 271).
link(cloud4, edge16, 76, 271).
link(edge17, cloud4, 31, 239).
link(cloud4, edge17, 31, 239).
link(edge24, cloud4, 78, 268).
link(cloud4, edge24, 78, 268).
link(edge25, cloud4, 61, 218).
link(cloud4, edge25, 61, 218).
link(edge27, cloud4, 78, 290).
link(cloud4, edge27, 78, 290).
link(edge31, cloud4, 63, 223).
link(cloud4, edge31, 63, 223).
link(cloud4, cloud5, 12, 724).
link(cloud5, cloud4, 12, 724).
link(cloud4, edge12, 41, 249).
link(edge12, cloud4, 41, 249).
link(cloud4, edge15, 44, 206).
link(edge15, cloud4, 44, 206).
link(cloud4, edge19, 37, 291).
link(edge19, cloud4, 37, 291).
link(cloud4, edge20, 47, 206).
link(edge20, cloud4, 47, 206).
link(cloud4, edge21, 33, 227).
link(edge21, cloud4, 33, 227).
link(cloud4, cloud7, 10, 518).
link(cloud7, cloud4, 10, 518).
link(cloud4, edge22, 32, 215).
link(edge22, cloud4, 32, 215).
link(cloud4, edge23, 46, 205).
link(edge23, cloud4, 46, 205).
link(cloud4, cloud8, 15, 417).
link(cloud8, cloud4, 15, 417).
link(cloud4, cloud9, 13, 853).
link(cloud9, cloud4, 13, 853).
link(cloud4, edge26, 33, 276).
link(edge26, cloud4, 33, 276).
link(cloud4, edge30, 38, 236).
link(edge30, cloud4, 38, 236).
link(cloud4, edge32, 37, 284).
link(edge32, cloud4, 37, 284).
link(cloud4, edge34, 32, 291).
link(edge34, cloud4, 32, 291).
link(cloud5, edge11, 73, 241).
link(edge11, cloud5, 73, 241).
link(cloud5, edge12, 79, 281).
link(edge12, cloud5, 79, 281).
link(cloud5, edge17, 66, 207).
link(edge17, cloud5, 66, 207).
link(cloud5, edge19, 47, 264).
link(edge19, cloud5, 47, 264).
link(cloud5, cloud6, 8, 410).
link(cloud6, cloud5, 8, 410).
link(cloud5, cloud7, 5, 610).
link(cloud7, cloud5, 5, 610).
link(cloud5, edge22, 69, 264).
link(edge22, cloud5, 69, 264).
link(cloud5, edge23, 49, 270).
link(edge23, cloud5, 49, 270).
link(cloud5, cloud8, 11, 406).
link(cloud8, cloud5, 11, 406).
link(cloud5, cloud9, 17, 499).
link(cloud9, cloud5, 17, 499).
link(cloud5, edge25, 63, 243).
link(edge25, cloud5, 63, 243).
link(cloud5, edge28, 34, 293).
link(edge28, cloud5, 34, 293).
link(cloud5, edge29, 40, 206).
link(edge29, cloud5, 40, 206).
link(cloud5, edge32, 44, 216).
link(edge32, cloud5, 44, 216).
link(cloud5, edge35, 55, 205).
link(edge35, cloud5, 55, 205).
link(cloud5, edge36, 25, 251).
link(edge36, cloud5, 25, 251).
link(cloud5, cloud13, 15, 857).
link(cloud13, cloud5, 15, 857).
link(edge13, cloud5, 71, 260).
link(cloud5, edge13, 71, 260).
link(edge24, cloud5, 48, 258).
link(cloud5, edge24, 48, 258).
link(cloud10, cloud5, 13, 824).
link(cloud5, cloud10, 13, 824).
link(edge26, cloud5, 69, 290).
link(cloud5, edge26, 69, 290).
link(edge30, cloud5, 35, 219).
link(cloud5, edge30, 35, 219).
link(edge31, cloud5, 45, 258).
link(cloud5, edge31, 45, 258).
link(edge34, cloud5, 78, 253).
link(cloud5, edge34, 78, 253).
link(edge37, cloud5, 66, 223).
link(cloud5, edge37, 66, 223).
link(cloud5, edge14, 36, 277).
link(edge14, cloud5, 36, 277).
link(cloud5, edge15, 47, 252).
link(edge15, cloud5, 47, 252).
link(cloud5, edge16, 36, 267).
link(edge16, cloud5, 36, 267).
link(cloud5, edge18, 38, 272).
link(edge18, cloud5, 38, 272).
link(cloud5, edge20, 43, 264).
link(edge20, cloud5, 43, 264).
link(cloud5, edge21, 36, 253).
link(edge21, cloud5, 36, 253).
link(cloud5, edge27, 32, 285).
link(edge27, cloud5, 32, 285).
link(cloud5, cloud11, 10, 638).
link(cloud11, cloud5, 10, 638).
link(cloud5, edge33, 35, 200).
link(edge33, cloud5, 35, 200).
link(cloud5, cloud12, 15, 445).
link(cloud12, cloud5, 15, 445).
link(edge11, edge15, 46, 195).
link(edge15, edge11, 46, 195).
link(edge11, edge16, 34, 102).
link(edge16, edge11, 34, 102).
link(edge11, cloud6, 30, 212).
link(cloud6, edge11, 30, 212).
link(edge11, cloud7, 27, 279).
link(cloud7, edge11, 27, 279).
link(edge11, edge22, 19, 164).
link(edge22, edge11, 19, 164).
link(edge11, edge23, 25, 171).
link(edge23, edge11, 25, 171).
link(edge11, edge26, 40, 151).
link(edge26, edge11, 40, 151).
link(edge11, edge27, 46, 131).
link(edge27, edge11, 46, 131).
link(edge11, edge28, 33, 124).
link(edge28, edge11, 33, 124).
link(edge11, cloud11, 53, 292).
link(cloud11, edge11, 53, 292).
link(edge11, edge29, 16, 131).
link(edge29, edge11, 16, 131).
link(edge11, edge31, 46, 194).
link(edge31, edge11, 46, 194).
link(edge11, edge33, 34, 121).
link(edge33, edge11, 34, 121).
link(edge11, cloud12, 54, 212).
link(cloud12, edge11, 54, 212).
link(edge13, edge11, 43, 128).
link(edge11, edge13, 43, 128).
link(edge14, edge11, 33, 118).
link(edge11, edge14, 33, 118).
link(edge17, edge11, 34, 104).
link(edge11, edge17, 34, 104).
link(edge20, edge11, 49, 181).
link(edge11, edge20, 49, 181).
link(cloud8, edge11, 54, 260).
link(edge11, cloud8, 54, 260).
link(edge30, edge11, 25, 150).
link(edge11, edge30, 25, 150).
link(edge32, edge11, 49, 188).
link(edge11, edge32, 49, 188).
link(edge34, edge11, 33, 148).
link(edge11, edge34, 33, 148).
link(edge35, edge11, 32, 117).
link(edge11, edge35, 32, 117).
link(edge36, edge11, 24, 188).
link(edge11, edge36, 24, 188).
link(edge37, edge11, 27, 161).
link(edge11, edge37, 27, 161).
link(cloud13, edge11, 52, 258).
link(edge11, cloud13, 52, 258).
link(edge11, edge12, 38, 152).
link(edge12, edge11, 38, 152).
link(edge11, edge18, 41, 172).
link(edge18, edge11, 41, 172).
link(edge11, edge19, 36, 183).
link(edge19, edge11, 36, 183).
link(edge11, edge21, 50, 185).
link(edge21, edge11, 50, 185).
link(edge11, edge24, 49, 144).
link(edge24, edge11, 49, 144).
link(edge11, cloud9, 40, 253).
link(cloud9, edge11, 40, 253).
link(edge11, cloud10, 36, 224).
link(cloud10, edge11, 36, 224).
link(edge11, edge25, 41, 130).
link(edge25, edge11, 41, 130).
link(edge12, edge13, 24, 165).
link(edge13, edge12, 24, 165).
link(edge12, edge14, 17, 166).
link(edge14, edge12, 17, 166).
link(edge12, edge17, 38, 192).
link(edge17, edge12, 38, 192).
link(edge12, edge19, 37, 121).
link(edge19, edge12, 37, 121).
link(edge12, edge22, 33, 153).
link(edge22, edge12, 33, 153).
link(edge12, cloud8, 52, 249).
link(cloud8, edge12, 52, 249).
link(edge12, edge24, 43, 161).
link(edge24, edge12, 43, 161).
link(edge12, cloud10, 60, 223).
link(cloud10, edge12, 60, 223).
link(edge12, edge26, 29, 107).
link(edge26, edge12, 29, 107).
link(edge12, edge27, 17, 136).
link(edge27, edge12, 17, 136).
link(edge12, edge28, 32, 147).
link(edge28, edge12, 32, 147).
link(edge12, edge30, 32, 171).
link(edge30, edge12, 32, 171).
link(edge12, edge35, 48, 110).
link(edge35, edge12, 48, 110).
link(edge12, edge36, 29, 189).
link(edge36, edge12, 29, 189).
link(edge12, edge37, 29, 106).
link(edge37, edge12, 29, 106).
link(edge16, edge12, 46, 167).
link(edge12, edge16, 46, 167).
link(cloud7, edge12, 72, 251).
link(edge12, cloud7, 72, 251).
link(edge32, edge12, 29, 142).
link(edge12, edge32, 29, 142).
link(cloud13, edge12, 32, 292).
link(edge12, cloud13, 32, 292).
link(edge12, edge15, 32, 166).
link(edge15, edge12, 32, 166).
link(edge12, edge18, 38, 192).
link(edge18, edge12, 38, 192).
link(edge12, cloud6, 44, 238).
link(cloud6, edge12, 44, 238).
link(edge12, edge20, 45, 142).
link(edge20, edge12, 45, 142).
link(edge12, edge21, 45, 156).
link(edge21, edge12, 45, 156).
link(edge12, edge23, 45, 172).
link(edge23, edge12, 45, 172).
link(edge12, cloud9, 48, 294).
link(cloud9, edge12, 48, 294).
link(edge12, edge25, 48, 189).
link(edge25, edge12, 48, 189).
link(edge12, cloud11, 46, 255).
link(cloud11, edge12, 46, 255).
link(edge12, edge29, 38, 104).
link(edge29, edge12, 38, 104).
link(edge12, edge31, 51, 149).
link(edge31, edge12, 51, 149).
link(edge12, edge33, 43, 130).
link(edge33, edge12, 43, 130).
link(edge12, edge34, 50, 188).
link(edge34, edge12, 50, 188).
link(edge12, cloud12, 39, 287).
link(cloud12, edge12, 39, 287).
link(edge13, edge16, 43, 147).
link(edge16, edge13, 43, 147).
link(edge13, edge18, 18, 111).
link(edge18, edge13, 18, 111).
link(edge13, edge20, 43, 106).
link(edge20, edge13, 43, 106).
link(edge13, edge22, 44, 140).
link(edge22, edge13, 44, 140).
link(edge13, edge24, 26, 127).
link(edge24, edge13, 26, 127).
link(edge13, cloud9, 45, 291).
link(cloud9, edge13, 45, 291).
link(edge13, edge25, 42, 169).
link(edge25, edge13, 42, 169).
link(edge13, edge26, 39, 166).
link(edge26, edge13, 39, 166).
link(edge13, edge28, 32, 141).
link(edge28, edge13, 32, 141).
link(edge13, cloud11, 61, 236).
link(cloud11, edge13, 61, 236).
link(edge13, edge33, 49, 154).
link(edge33, edge13, 49, 154).
link(edge13, cloud12, 76, 220).
link(cloud12, edge13, 76, 220).
link(edge13, edge37, 43, 198).
link(edge37, edge13, 43, 198).
link(edge15, edge13, 44, 110).
link(edge13, edge15, 44, 110).
link(edge23, edge13, 28, 132).
link(edge13, edge23, 28, 132).
link(edge32, edge13, 31, 127).
link(edge13, edge32, 31, 127).
link(edge35, edge13, 19, 164).
link(edge13, edge35, 19, 164).
link(cloud13, edge13, 52, 246).
link(edge13, cloud13, 52, 246).
link(edge13, edge14, 41, 153).
link(edge14, edge13, 41, 153).
link(edge13, edge17, 34, 158).
link(edge17, edge13, 34, 158).
link(edge13, edge19, 46, 142).
link(edge19, edge13, 46, 142).
link(edge13, cloud6, 40, 260).
link(cloud6, edge13, 40, 260).
link(edge13, edge21, 51, 190).
link(edge21, edge13, 51, 190).
link(edge13, cloud7, 45, 211).
link(cloud7, edge13, 45, 211).
link(edge13, cloud8, 47, 284).
link(cloud8, edge13, 47, 284).
link(edge13, cloud10, 41, 244).
link(cloud10, edge13, 41, 244).
link(edge13, edge27, 41, 158).
link(edge27, edge13, 41, 158).
link(edge13, edge29, 48, 163).
link(edge29, edge13, 48, 163).
link(edge13, edge30, 47, 103).
link(edge30, edge13, 47, 103).
link(edge13, edge31, 43, 140).
link(edge31, edge13, 43, 140).
link(edge13, edge34, 44, 183).
link(edge34, edge13, 44, 183).
link(edge13, edge36, 48, 119).
link(edge36, edge13, 48, 119).
link(edge14, edge15, 15, 109).
link(edge15, edge14, 15, 109).
link(edge14, edge18, 32, 129).
link(edge18, edge14, 32, 129).
link(edge14, cloud6, 28, 259).
link(cloud6, edge14, 28, 259).
link(edge14, cloud7, 58, 239).
link(cloud7, edge14, 58, 239).
link(edge14, edge23, 39, 113).
link(edge23, edge14, 39, 113).
link(edge14, cloud8, 39, 296).
link(cloud8, edge14, 39, 296).
link(edge14, edge32, 35, 164).
link(edge32, edge14, 35, 164).
link(edge14, edge34, 46, 168).
link(edge34, edge14, 46, 168).
link(edge14, edge35, 41, 116).
link(edge35, edge14, 41, 116).
link(edge14, edge37, 43, 112).
link(edge37, edge14, 43, 112).
link(edge16, edge14, 45, 170).
link(edge14, edge16, 45, 170).
link(edge19, edge14, 20, 198).
link(edge14, edge19, 20, 198).
link(edge20, edge14, 28, 108).
link(edge14, edge20, 28, 108).
link(edge21, edge14, 28, 185).
link(edge14, edge21, 28, 185).
link(cloud10, edge14, 42, 270).
link(edge14, cloud10, 42, 270).
link(cloud12, edge14, 71, 209).
link(edge14, cloud12, 71, 209).
link(cloud13, edge14, 56, 228).
link(edge14, cloud13, 56, 228).
link(edge14, edge17, 40, 190).
link(edge17, edge14, 40, 190).
link(edge14, edge22, 50, 166).
link(edge22, edge14, 50, 166).
link(edge14, edge24, 31, 182).
link(edge24, edge14, 31, 182).
link(edge14, cloud9, 46, 264).
link(cloud9, edge14, 46, 264).
link(edge14, edge25, 53, 141).
link(edge25, edge14, 53, 141).
link(edge14, edge26, 46, 173).
link(edge26, edge14, 46, 173).
link(edge14, edge27, 34, 191).
link(edge27, edge14, 34, 191).
link(edge14, edge28, 46, 138).
link(edge28, edge14, 46, 138).
link(edge14, cloud11, 38, 280).
link(cloud11, edge14, 38, 280).
link(edge14, edge29, 40, 157).
link(edge29, edge14, 40, 157).
link(edge14, edge30, 40, 126).
link(edge30, edge14, 40, 126).
link(edge14, edge31, 34, 178).
link(edge31, edge14, 34, 178).
link(edge14, edge33, 42, 153).
link(edge33, edge14, 42, 153).
link(edge14, edge36, 46, 140).
link(edge36, edge14, 46, 140).
link(edge15, edge16, 49, 107).
link(edge16, edge15, 49, 107).
link(edge15, edge17, 28, 170).
link(edge17, edge15, 28, 170).
link(edge15, cloud6, 71, 254).
link(cloud6, edge15, 71, 254).
link(edge15, edge20, 33, 116).
link(edge20, edge15, 33, 116).
link(edge15, edge21, 33, 117).
link(edge21, edge15, 33, 117).
link(edge15, edge23, 38, 153).
link(edge23, edge15, 38, 153).
link(edge15, edge24, 16, 128).
link(edge24, edge15, 16, 128).
link(edge15, edge26, 43, 139).
link(edge26, edge15, 43, 139).
link(edge15, edge27, 30, 119).
link(edge27, edge15, 30, 119).
link(edge15, edge28, 43, 110).
link(edge28, edge15, 43, 110).
link(edge15, edge29, 41, 161).
link(edge29, edge15, 41, 161).
link(edge15, edge30, 25, 157).
link(edge30, edge15, 25, 157).
link(edge15, edge32, 41, 199).
link(edge32, edge15, 41, 199).
link(edge15, edge33, 37, 128).
link(edge33, edge15, 37, 128).
link(edge15, cloud12, 75, 218).
link(cloud12, edge15, 75, 218).
link(edge15, edge37, 19, 172).
link(edge37, edge15, 19, 172).
link(edge18, edge15, 22, 126).
link(edge15, edge18, 22, 126).
link(edge19, edge15, 21, 199).
link(edge15, edge19, 21, 199).
link(cloud8, edge15, 68, 287).
link(edge15, cloud8, 68, 287).
link(cloud11, edge15, 59, 224).
link(edge15, cloud11, 59, 224).
link(edge31, edge15, 19, 138).
link(edge15, edge31, 19, 138).
link(edge15, cloud7, 42, 260).
link(cloud7, edge15, 42, 260).
link(edge15, edge22, 35, 163).
link(edge22, edge15, 35, 163).
link(edge15, cloud9, 45, 260).
link(cloud9, edge15, 45, 260).
link(edge15, cloud10, 38, 287).
link(cloud10, edge15, 38, 287).
link(edge15, edge25, 43, 180).
link(edge25, edge15, 43, 180).
link(edge15, edge34, 45, 136).
link(edge34, edge15, 45, 136).
link(edge15, edge35, 43, 179).
link(edge35, edge15, 43, 179).
link(edge15, edge36, 44, 144).
link(edge36, edge15, 44, 144).
link(edge15, cloud13, 38, 215).
link(cloud13, edge15, 38, 215).
link(edge16, edge18, 47, 164).
link(edge18, edge16, 47, 164).
link(edge16, edge19, 16, 149).
link(edge19, edge16, 16, 149).
link(edge16, cloud6, 28, 253).
link(cloud6, edge16, 28, 253).
link(edge16, edge21, 49, 183).
link(edge21, edge16, 49, 183).
link(edge16, cloud8, 59, 287).
link(cloud8, edge16, 59, 287).
link(edge16, cloud9, 65, 236).
link(cloud9, edge16, 65, 236).
link(edge16, edge25, 48, 182).
link(edge25, edge16, 48, 182).
link(edge16, edge28, 15, 134).
link(edge28, edge16, 15, 134).
link(edge16, edge31, 35, 104).
link(edge31, edge16, 35, 104).
link(edge16, edge32, 41, 100).
link(edge32, edge16, 41, 100).
link(edge16, edge35, 41, 112).
link(edge35, edge16, 41, 112).
link(edge16, edge36, 18, 141).
link(edge36, edge16, 18, 141).
link(edge16, cloud12, 79, 294).
link(cloud12, edge16, 79, 294).
link(edge20, edge16, 34, 164).
link(edge16, edge20, 34, 164).
link(edge26, edge16, 24, 126).
link(edge16, edge26, 24, 126).
link(cloud11, edge16, 75, 241).
link(edge16, cloud11, 75, 241).
link(edge30, edge16, 29, 199).
link(edge16, edge30, 29, 199).
link(edge37, edge16, 47, 182).
link(edge16, edge37, 47, 182).
link(cloud13, edge16, 51, 220).
link(edge16, cloud13, 51, 220).
link(edge16, edge17, 36, 115).
link(edge17, edge16, 36, 115).
link(edge16, cloud7, 35, 234).
link(cloud7, edge16, 35, 234).
link(edge16, edge22, 33, 110).
link(edge22, edge16, 33, 110).
link(edge16, edge23, 51, 108).
link(edge23, edge16, 51, 108).
link(edge16, edge24, 36, 185).
link(edge24, edge16, 36, 185).
link(edge16, cloud10, 36, 210).
link(cloud10, edge16, 36, 210).
link(edge16, edge27, 38, 172).
link(edge27, edge16, 38, 172).
link(edge16, edge29, 36, 189).
link(edge29, edge16, 36, 189).
link(edge16, edge33, 48, 159).
link(edge33, edge16, 48, 159).
link(edge16, edge34, 37, 162).
link(edge34, edge16, 37, 162).
link(edge17, edge19, 20, 137).
link(edge19, edge17, 20, 137).
link(edge17, cloud6, 50, 211).
link(cloud6, edge17, 50, 211).
link(edge17, edge20, 47, 187).
link(edge20, edge17, 47, 187).
link(edge17, edge22, 45, 146).
link(edge22, edge17, 45, 146).
link(edge17, edge23, 36, 128).
link(edge23, edge17, 36, 128).
link(edge17, cloud9, 54, 281).
link(cloud9, edge17, 54, 281).
link(edge17, edge25, 45, 116).
link(edge25, edge17, 45, 116).
link(edge17, cloud11, 52, 240).
link(cloud11, edge17, 52, 240).
link(edge17, edge29, 42, 167).
link(edge29, edge17, 42, 167).
link(edge17, edge30, 36, 198).
link(edge30, edge17, 36, 198).
link(edge17, edge34, 49, 149).
link(edge34, edge17, 49, 149).
link(edge17, edge35, 15, 150).
link(edge35, edge17, 15, 150).
link(edge17, edge37, 31, 156).
link(edge37, edge17, 31, 156).
link(edge21, edge17, 33, 146).
link(edge17, edge21, 33, 146).
link(cloud8, edge17, 68, 223).
link(edge17, cloud8, 68, 223).
link(edge24, edge17, 42, 180).
link(edge17, edge24, 42, 180).
link(cloud10, edge17, 72, 249).
link(edge17, cloud10, 72, 249).
link(edge31, edge17, 22, 178).
link(edge17, edge31, 22, 178).
link(edge33, edge17, 22, 158).
link(edge17, edge33, 22, 158).
link(edge17, edge18, 49, 102).
link(edge18, edge17, 49, 102).
link(edge17, cloud7, 41, 243).
link(cloud7, edge17, 41, 243).
link(edge17, edge26, 53, 196).
link(edge26, edge17, 53, 196).
link(edge17, edge27, 41, 149).
link(edge27, edge17, 41, 149).
link(edge17, edge28, 36, 179).
link(edge28, edge17, 36, 179).
link(edge17, edge32, 39, 199).
link(edge32, edge17, 39, 199).
link(edge17, edge36, 35, 143).
link(edge36, edge17, 35, 143).
link(edge17, cloud12, 44, 243).
link(cloud12, edge17, 44, 243).
link(edge17, cloud13, 40, 229).
link(cloud13, edge17, 40, 229).
link(edge18, cloud6, 65, 227).
link(cloud6, edge18, 65, 227).
link(edge18, cloud8, 29, 203).
link(cloud8, edge18, 29, 203).
link(edge18, edge27, 34, 197).
link(edge27, edge18, 34, 197).
link(edge18, cloud11, 74, 267).
link(cloud11, edge18, 74, 267).
link(edge18, edge32, 23, 151).
link(edge32, edge18, 23, 151).
link(edge18, edge34, 26, 137).
link(edge34, edge18, 26, 137).
link(edge18, edge35, 47, 148).
link(edge35, edge18, 47, 148).
link(edge18, edge36, 38, 188).
link(edge36, edge18, 38, 188).
link(edge18, cloud13, 27, 250).
link(cloud13, edge18, 27, 250).
link(edge19, edge18, 39, 178).
link(edge18, edge19, 39, 178).
link(edge20, edge18, 31, 110).
link(edge18, edge20, 31, 110).
link(cloud9, edge18, 65, 230).
link(edge18, cloud9, 65, 230).
link(cloud10, edge18, 63, 203).
link(edge18, cloud10, 63, 203).
link(edge25, edge18, 21, 188).
link(edge18, edge25, 21, 188).
link(edge26, edge18, 39, 160).
link(edge18, edge26, 39, 160).
link(edge29, edge18, 41, 154).
link(edge18, edge29, 41, 154).
link(edge30, edge18, 44, 119).
link(edge18, edge30, 44, 119).
link(edge18, edge21, 43, 112).
link(edge21, edge18, 43, 112).
link(edge18, cloud7, 41, 205).
link(cloud7, edge18, 41, 205).
link(edge18, edge22, 39, 193).
link(edge22, edge18, 39, 193).
link(edge18, edge23, 30, 177).
link(edge23, edge18, 30, 177).
link(edge18, edge24, 38, 102).
link(edge24, edge18, 38, 102).
link(edge18, edge28, 48, 190).
link(edge28, edge18, 48, 190).
link(edge18, edge31, 32, 116).
link(edge31, edge18, 32, 116).
link(edge18, edge33, 47, 113).
link(edge33, edge18, 47, 113).
link(edge18, cloud12, 34, 202).
link(cloud12, edge18, 34, 202).
link(edge18, edge37, 41, 127).
link(edge37, edge18, 41, 127).
link(edge19, cloud6, 57, 275).
link(cloud6, edge19, 57, 275).
link(edge19, edge22, 41, 130).
link(edge22, edge19, 41, 130).
link(edge19, edge24, 20, 162).
link(edge24, edge19, 20, 162).
link(edge19, cloud9, 55, 268).
link(cloud9, edge19, 55, 268).
link(edge19, edge25, 36, 183).
link(edge25, edge19, 36, 183).
link(edge19, edge26, 47, 138).
link(edge26, edge19, 47, 138).
link(edge19, cloud11, 51, 227).
link(cloud11, edge19, 51, 227).
link(edge19, edge35, 36, 139).
link(edge35, edge19, 36, 139).
link(edge19, cloud12, 68, 215).
link(cloud12, edge19, 68, 215).
link(edge19, edge37, 19, 146).
link(edge37, edge19, 19, 146).
link(edge19, cloud13, 73, 262).
link(cloud13, edge19, 73, 262).
link(edge20, edge19, 42, 153).
link(edge19, edge20, 42, 153).
link(edge21, edge19, 32, 160).
link(edge19, edge21, 32, 160).
link(edge28, edge19, 26, 147).
link(edge19, edge28, 26, 147).
link(edge29, edge19, 20, 133).
link(edge19, edge29, 20, 133).
link(edge33, edge19, 42, 161).
link(edge19, edge33, 42, 161).
link(edge19, cloud7, 40, 272).
link(cloud7, edge19, 40, 272).
link(edge19, edge23, 35, 130).
link(edge23, edge19, 35, 130).
link(edge19, cloud8, 45, 260).
link(cloud8, edge19, 45, 260).
link(edge19, cloud10, 43, 253).
link(cloud10, edge19, 43, 253).
link(edge19, edge27, 37, 134).
link(edge27, edge19, 37, 134).
link(edge19, edge30, 45, 198).
link(edge30, edge19, 45, 198).
link(edge19, edge31, 40, 154).
link(edge31, edge19, 40, 154).
link(edge19, edge32, 35, 153).
link(edge32, edge19, 35, 153).
link(edge19, edge34, 43, 142).
link(edge34, edge19, 43, 142).
link(edge19, edge36, 34, 114).
link(edge36, edge19, 34, 114).
link(cloud6, cloud9, 19, 929).
link(cloud9, cloud6, 19, 929).
link(cloud6, edge25, 25, 212).
link(edge25, cloud6, 25, 212).
link(cloud6, cloud11, 17, 407).
link(cloud11, cloud6, 17, 407).
link(cloud6, edge31, 52, 249).
link(edge31, cloud6, 52, 249).
link(cloud6, edge34, 27, 209).
link(edge34, cloud6, 27, 209).
link(edge21, cloud6, 59, 245).
link(cloud6, edge21, 59, 245).
link(cloud7, cloud6, 7, 682).
link(cloud6, cloud7, 7, 682).
link(edge22, cloud6, 27, 218).
link(cloud6, edge22, 27, 218).
link(cloud10, cloud6, 8, 765).
link(cloud6, cloud10, 8, 765).
link(edge28, cloud6, 61, 214).
link(cloud6, edge28, 61, 214).
link(edge32, cloud6, 67, 239).
link(cloud6, edge32, 67, 239).
link(edge33, cloud6, 37, 207).
link(cloud6, edge33, 37, 207).
link(edge35, cloud6, 29, 228).
link(cloud6, edge35, 29, 228).
link(cloud6, edge20, 44, 236).
link(edge20, cloud6, 44, 236).
link(cloud6, edge23, 42, 236).
link(edge23, cloud6, 42, 236).
link(cloud6, cloud8, 13, 372).
link(cloud8, cloud6, 13, 372).
link(cloud6, edge24, 35, 222).
link(edge24, cloud6, 35, 222).
link(cloud6, edge26, 35, 233).
link(edge26, cloud6, 35, 233).
link(cloud6, edge27, 39, 232).
link(edge27, cloud6, 39, 232).
link(cloud6, edge29, 46, 290).
link(edge29, cloud6, 46, 290).
link(cloud6, edge30, 41, 257).
link(edge30, cloud6, 41, 257).
link(cloud6, edge36, 30, 250).
link(edge36, cloud6, 30, 250).
link(cloud6, cloud12, 13, 852).
link(cloud12, cloud6, 13, 852).
link(cloud6, edge37, 36, 236).
link(edge37, cloud6, 36, 236).
link(cloud6, cloud13, 12, 360).
link(cloud13, cloud6, 12, 360).
link(edge20, edge21, 32, 182).
link(edge21, edge20, 32, 182).
link(edge20, cloud10, 61, 282).
link(cloud10, edge20, 61, 282).
link(edge20, edge25, 49, 121).
link(edge25, edge20, 49, 121).
link(edge20, edge28, 46, 111).
link(edge28, edge20, 46, 111).
link(edge20, edge31, 49, 143).
link(edge31, edge20, 49, 143).
link(edge20, edge33, 17, 171).
link(edge33, edge20, 17, 171).
link(edge20, edge35, 15, 174).
link(edge35, edge20, 15, 174).
link(edge20, edge36, 35, 118).
link(edge36, edge20, 35, 118).
link(edge20, cloud12, 40, 269).
link(cloud12, edge20, 40, 269).
link(edge20, cloud13, 70, 251).
link(cloud13, edge20, 70, 251).
link(edge22, edge20, 22, 163).
link(edge20, edge22, 22, 163).
link(edge24, edge20, 30, 141).
link(edge20, edge24, 30, 141).
link(edge26, edge20, 34, 170).
link(edge20, edge26, 34, 170).
link(cloud11, edge20, 47, 277).
link(edge20, cloud11, 47, 277).
link(edge30, edge20, 33, 101).
link(edge20, edge30, 33, 101).
link(edge34, edge20, 18, 102).
link(edge20, edge34, 18, 102).
link(edge20, cloud7, 47, 296).
link(cloud7, edge20, 47, 296).
link(edge20, edge23, 47, 169).
link(edge23, edge20, 47, 169).
link(edge20, cloud8, 47, 292).
link(cloud8, edge20, 47, 292).
link(edge20, cloud9, 42, 210).
link(cloud9, edge20, 42, 210).
link(edge20, edge27, 33, 199).
link(edge27, edge20, 33, 199).
link(edge20, edge29, 40, 185).
link(edge29, edge20, 40, 185).
link(edge20, edge32, 31, 137).
link(edge32, edge20, 31, 137).
link(edge20, edge37, 38, 176).
link(edge37, edge20, 38, 176).
link(edge21, cloud7, 60, 277).
link(cloud7, edge21, 60, 277).
link(edge21, edge23, 32, 124).
link(edge23, edge21, 32, 124).
link(edge21, cloud9, 28, 251).
link(cloud9, edge21, 28, 251).
link(edge21, cloud10, 79, 266).
link(cloud10, edge21, 79, 266).
link(edge21, cloud11, 28, 261).
link(cloud11, edge21, 28, 261).
link(edge21, edge31, 45, 111).
link(edge31, edge21, 45, 111).
link(edge21, edge33, 17, 157).
link(edge33, edge21, 17, 157).
link(edge22, edge21, 49, 191).
link(edge21, edge22, 49, 191).
link(edge29, edge21, 45, 170).
link(edge21, edge29, 45, 170).
link(edge30, edge21, 49, 192).
link(edge21, edge30, 49, 192).
link(edge32, edge21, 38, 139).
link(edge21, edge32, 38, 139).
link(cloud13, edge21, 78, 255).
link(edge21, cloud13, 78, 255).
link(edge21, cloud8, 47, 213).
link(cloud8, edge21, 47, 213).
link(edge21, edge24, 49, 151).
link(edge24, edge21, 49, 151).
link(edge21, edge25, 36, 154).
link(edge25, edge21, 36, 154).
link(edge21, edge26, 52, 177).
link(edge26, edge21, 52, 177).
link(edge21, edge27, 53, 166).
link(edge27, edge21, 53, 166).
link(edge21, edge28, 48, 130).
link(edge28, edge21, 48, 130).
link(edge21, edge34, 38, 142).
link(edge34, edge21, 38, 142).
link(edge21, edge35, 47, 128).
link(edge35, edge21, 47, 128).
link(edge21, edge36, 54, 177).
link(edge36, edge21, 54, 177).
link(edge21, cloud12, 43, 210).
link(cloud12, edge21, 43, 210).
link(edge21, edge37, 45, 163).
link(edge37, edge21, 45, 163).
link(cloud7, edge22, 55, 251).
link(edge22, cloud7, 55, 251).
link(cloud7, cloud8, 19, 849).
link(cloud8, cloud7, 19, 849).
link(cloud7, cloud9, 18, 474).
link(cloud9, cloud7, 18, 474).
link(cloud7, cloud10, 9, 993).
link(cloud10, cloud7, 9, 993).
link(cloud7, edge30, 77, 237).
link(edge30, cloud7, 77, 237).
link(cloud7, edge31, 30, 221).
link(edge31, cloud7, 30, 221).
link(cloud7, edge32, 27, 217).
link(edge32, cloud7, 27, 217).
link(cloud7, edge35, 62, 262).
link(edge35, cloud7, 62, 262).
link(cloud7, edge37, 29, 285).
link(edge37, cloud7, 29, 285).
link(edge24, cloud7, 72, 252).
link(cloud7, edge24, 72, 252).
link(edge27, cloud7, 68, 216).
link(cloud7, edge27, 68, 216).
link(edge28, cloud7, 69, 270).
link(cloud7, edge28, 69, 270).
link(cloud11, cloud7, 5, 761).
link(cloud7, cloud11, 5, 761).
link(edge29, cloud7, 51, 288).
link(cloud7, edge29, 51, 288).
link(edge34, cloud7, 63, 208).
link(cloud7, edge34, 63, 208).
link(edge36, cloud7, 77, 222).
link(cloud7, edge36, 77, 222).
link(cloud12, cloud7, 10, 958).
link(cloud7, cloud12, 10, 958).
link(cloud13, cloud7, 16, 482).
link(cloud7, cloud13, 16, 482).
link(cloud7, edge23, 45, 266).
link(edge23, cloud7, 45, 266).
link(cloud7, edge25, 32, 291).
link(edge25, cloud7, 32, 291).
link(cloud7, edge26, 36, 220).
link(edge26, cloud7, 36, 220).
link(cloud7, edge33, 30, 238).
link(edge33, cloud7, 30, 238).
link(edge22, edge23, 25, 122).
link(edge23, edge22, 25, 122).
link(edge22, cloud8, 76, 253).
link(cloud8, edge22, 76, 253).
link(edge22, edge25, 23, 123).
link(edge25, edge22, 23, 123).
link(edge22, edge28, 18, 129).
link(edge28, edge22, 18, 129).
link(edge22, edge30, 18, 188).
link(edge30, edge22, 18, 188).
link(edge22, edge35, 21, 174).
link(edge35, edge22, 21, 174).
link(edge22, edge37, 16, 128).
link(edge37, edge22, 16, 128).
link(cloud9, edge22, 58, 200).
link(edge22, cloud9, 58, 200).
link(cloud10, edge22, 75, 230).
link(edge22, cloud10, 75, 230).
link(cloud11, edge22, 67, 208).
link(edge22, cloud11, 67, 208).
link(edge29, edge22, 41, 192).
link(edge22, edge29, 41, 192).
link(edge32, edge22, 16, 102).
link(edge22, edge32, 16, 102).
link(edge34, edge22, 24, 193).
link(edge22, edge34, 24, 193).
link(edge36, edge22, 38, 103).
link(edge22, edge36, 38, 103).
link(cloud12, edge22, 59, 211).
link(edge22, cloud12, 59, 211).
link(edge22, edge24, 51, 184).
link(edge24, edge22, 51, 184).
link(edge22, edge26, 41, 124).
link(edge26, edge22, 41, 124).
link(edge22, edge27, 31, 190).
link(edge27, edge22, 31, 190).
link(edge22, edge31, 45, 144).
link(edge31, edge22, 45, 144).
link(edge22, edge33, 37, 110).
link(edge33, edge22, 37, 110).
link(edge22, cloud13, 31, 296).
link(cloud13, edge22, 31, 296).
link(edge23, cloud9, 38, 249).
link(cloud9, edge23, 38, 249).
link(edge23, edge26, 46, 194).
link(edge26, edge23, 46, 194).
link(edge23, edge28, 41, 160).
link(edge28, edge23, 41, 160).
link(edge23, edge31, 26, 179).
link(edge31, edge23, 26, 179).
link(edge23, edge32, 22, 138).
link(edge32, edge23, 22, 138).
link(edge23, edge35, 43, 137).
link(edge35, edge23, 43, 137).
link(edge23, edge37, 16, 165).
link(edge37, edge23, 16, 165).
link(edge23, cloud13, 52, 204).
link(cloud13, edge23, 52, 204).
link(edge25, edge23, 29, 141).
link(edge23, edge25, 29, 141).
link(cloud12, edge23, 58, 211).
link(edge23, cloud12, 58, 211).
link(edge23, cloud8, 52, 282).
link(cloud8, edge23, 52, 282).
link(edge23, edge24, 51, 127).
link(edge24, edge23, 51, 127).
link(edge23, cloud10, 46, 211).
link(cloud10, edge23, 46, 211).
link(edge23, edge27, 37, 123).
link(edge27, edge23, 37, 123).
link(edge23, cloud11, 46, 237).
link(cloud11, edge23, 46, 237).
link(edge23, edge29, 39, 143).
link(edge29, edge23, 39, 143).
link(edge23, edge30, 43, 177).
link(edge30, edge23, 43, 177).
link(edge23, edge33, 34, 197).
link(edge33, edge23, 34, 197).
link(edge23, edge34, 46, 150).
link(edge34, edge23, 46, 150).
link(edge23, edge36, 49, 178).
link(edge36, edge23, 49, 178).
link(cloud8, edge26, 31, 246).
link(edge26, cloud8, 31, 246).
link(cloud8, edge28, 54, 274).
link(edge28, cloud8, 54, 274).
link(cloud8, edge34, 79, 214).
link(edge34, cloud8, 79, 214).
link(cloud8, edge35, 67, 286).
link(edge35, cloud8, 67, 286).
link(cloud8, cloud12, 7, 387).
link(cloud12, cloud8, 7, 387).
link(edge24, cloud8, 49, 240).
link(cloud8, edge24, 49, 240).
link(cloud10, cloud8, 9, 829).
link(cloud8, cloud10, 9, 829).
link(edge25, cloud8, 45, 228).
link(cloud8, edge25, 45, 228).
link(edge29, cloud8, 75, 228).
link(cloud8, edge29, 75, 228).
link(edge31, cloud8, 45, 231).
link(cloud8, edge31, 45, 231).
link(edge33, cloud8, 70, 208).
link(cloud8, edge33, 70, 208).
link(cloud8, cloud9, 20, 855).
link(cloud9, cloud8, 20, 855).
link(cloud8, edge27, 43, 255).
link(edge27, cloud8, 43, 255).
link(cloud8, cloud11, 20, 792).
link(cloud11, cloud8, 20, 792).
link(cloud8, edge30, 40, 234).
link(edge30, cloud8, 40, 234).
link(cloud8, edge32, 42, 225).
link(edge32, cloud8, 42, 225).
link(cloud8, edge36, 36, 242).
link(edge36, cloud8, 36, 242).
link(cloud8, edge37, 44, 238).
link(edge37, cloud8, 44, 238).
link(cloud8, cloud13, 11, 711).
link(cloud13, cloud8, 11, 711).
link(edge24, cloud9, 29, 258).
link(cloud9, edge24, 29, 258).
link(edge24, cloud10, 56, 284).
link(cloud10, edge24, 56, 284).
link(edge24, edge27, 38, 174).
link(edge27, edge24, 38, 174).
link(edge24, cloud11, 69, 232).
link(cloud11, edge24, 69, 232).
link(edge24, edge30, 44, 160).
link(edge30, edge24, 44, 160).
link(edge24, edge33, 40, 133).
link(edge33, edge24, 40, 133).
link(edge24, edge36, 28, 120).
link(edge36, edge24, 28, 120).
link(edge28, edge24, 45, 176).
link(edge24, edge28, 45, 176).
link(edge29, edge24, 40, 160).
link(edge24, edge29, 40, 160).
link(cloud12, edge24, 45, 273).
link(edge24, cloud12, 45, 273).
link(edge24, edge25, 48, 108).
link(edge25, edge24, 48, 108).
link(edge24, edge26, 55, 116).
link(edge26, edge24, 55, 116).
link(edge24, edge31, 35, 170).
link(edge31, edge24, 35, 170).
link(edge24, edge32, 53, 126).
link(edge32, edge24, 53, 126).
link(edge24, edge34, 48, 117).
link(edge34, edge24, 48, 117).
link(edge24, edge35, 45, 179).
link(edge35, edge24, 45, 179).
link(edge24, edge37, 35, 102).
link(edge37, edge24, 35, 102).
link(edge24, cloud13, 33, 244).
link(cloud13, edge24, 33, 244).
link(cloud9, cloud11, 8, 472).
link(cloud11, cloud9, 8, 472).
link(cloud9, edge29, 30, 229).
link(edge29, cloud9, 30, 229).
link(cloud9, edge31, 42, 265).
link(edge31, cloud9, 42, 265).
link(cloud9, edge32, 61, 225).
link(edge32, cloud9, 61, 225).
link(cloud9, edge33, 25, 271).
link(edge33, cloud9, 25, 271).
link(cloud9, edge36, 79, 230).
link(edge36, cloud9, 79, 230).
link(cloud9, cloud12, 15, 442).
link(cloud12, cloud9, 15, 442).
link(cloud9, edge37, 67, 265).
link(edge37, cloud9, 67, 265).
link(cloud9, cloud13, 16, 459).
link(cloud13, cloud9, 16, 459).
link(edge25, cloud9, 77, 258).
link(cloud9, edge25, 77, 258).
link(edge27, cloud9, 53, 247).
link(cloud9, edge27, 53, 247).
link(cloud9, cloud10, 19, 398).
link(cloud10, cloud9, 19, 398).
link(cloud9, edge26, 46, 293).
link(edge26, cloud9, 46, 293).
link(cloud9, edge28, 49, 233).
link(edge28, cloud9, 49, 233).
link(cloud9, edge30, 44, 216).
link(edge30, cloud9, 44, 216).
link(cloud9, edge34, 45, 286).
link(edge34, cloud9, 45, 286).
link(cloud9, edge35, 42, 225).
link(edge35, cloud9, 42, 225).
link(cloud10, edge27, 48, 299).
link(edge27, cloud10, 48, 299).
link(cloud10, edge28, 31, 232).
link(edge28, cloud10, 31, 232).
link(cloud10, edge30, 53, 214).
link(edge30, cloud10, 53, 214).
link(cloud10, edge31, 59, 289).
link(edge31, cloud10, 59, 289).
link(cloud10, edge32, 63, 274).
link(edge32, cloud10, 63, 274).
link(cloud10, edge33, 63, 288).
link(edge33, cloud10, 63, 288).
link(cloud10, edge34, 45, 204).
link(edge34, cloud10, 45, 204).
link(cloud10, edge35, 70, 280).
link(edge35, cloud10, 70, 280).
link(cloud10, cloud12, 13, 995).
link(cloud12, cloud10, 13, 995).
link(cloud10, edge37, 60, 200).
link(edge37, cloud10, 60, 200).
link(cloud10, cloud13, 5, 622).
link(cloud13, cloud10, 5, 622).
link(edge26, cloud10, 27, 243).
link(cloud10, edge26, 27, 243).
link(cloud11, cloud10, 16, 412).
link(cloud10, cloud11, 16, 412).
link(edge36, cloud10, 32, 248).
link(cloud10, edge36, 32, 248).
link(cloud10, edge25, 33, 286).
link(edge25, cloud10, 33, 286).
link(cloud10, edge29, 46, 219).
link(edge29, cloud10, 46, 219).
link(edge25, edge26, 19, 129).
link(edge26, edge25, 19, 129).
link(edge25, edge27, 47, 171).
link(edge27, edge25, 47, 171).
link(edge25, cloud11, 35, 245).
link(cloud11, edge25, 35, 245).
link(edge25, edge33, 39, 153).
link(edge33, edge25, 39, 153).
link(edge25, edge35, 30, 159).
link(edge35, edge25, 30, 159).
link(edge25, edge36, 20, 189).
link(edge36, edge25, 20, 189).
link(edge25, edge37, 33, 106).
link(edge37, edge25, 33, 106).
link(edge28, edge25, 32, 147).
link(edge25, edge28, 32, 147).
link(edge29, edge25, 25, 192).
link(edge25, edge29, 25, 192).
link(cloud13, edge25, 76, 281).
link(edge25, cloud13, 76, 281).
link(edge25, edge30, 41, 175).
link(edge30, edge25, 41, 175).
link(edge25, edge31, 53, 151).
link(edge31, edge25, 53, 151).
link(edge25, edge32, 39, 100).
link(edge32, edge25, 39, 100).
link(edge25, edge34, 41, 169).
link(edge34, edge25, 41, 169).
link(edge25, cloud12, 38, 250).
link(cloud12, edge25, 38, 250).
link(edge26, edge27, 45, 110).
link(edge27, edge26, 45, 110).
link(edge26, edge29, 44, 128).
link(edge29, edge26, 44, 128).
link(edge26, edge35, 45, 109).
link(edge35, edge26, 45, 109).
link(edge26, cloud12, 33, 269).
link(cloud12, edge26, 33, 269).
link(edge26, cloud13, 47, 242).
link(cloud13, edge26, 47, 242).
link(cloud11, edge26, 70, 240).
link(edge26, cloud11, 70, 240).
link(edge36, edge26, 27, 181).
link(edge26, edge36, 27, 181).
link(edge37, edge26, 25, 102).
link(edge26, edge37, 25, 102).
link(edge26, edge28, 39, 183).
link(edge28, edge26, 39, 183).
link(edge26, edge30, 53, 180).
link(edge30, edge26, 53, 180).
link(edge26, edge31, 51, 191).
link(edge31, edge26, 51, 191).
link(edge26, edge32, 55, 138).
link(edge32, edge26, 55, 138).
link(edge26, edge33, 51, 130).
link(edge33, edge26, 51, 130).
link(edge26, edge34, 52, 119).
link(edge34, edge26, 52, 119).
link(edge27, edge32, 15, 187).
link(edge32, edge27, 15, 187).
link(edge27, edge33, 39, 105).
link(edge33, edge27, 39, 105).
link(edge27, edge35, 33, 100).
link(edge35, edge27, 33, 100).
link(edge27, cloud12, 77, 267).
link(cloud12, edge27, 77, 267).
link(edge27, edge37, 31, 167).
link(edge37, edge27, 31, 167).
link(edge27, cloud13, 32, 277).
link(cloud13, edge27, 32, 277).
link(edge30, edge27, 41, 150).
link(edge27, edge30, 41, 150).
link(edge31, edge27, 43, 120).
link(edge27, edge31, 43, 120).
link(edge36, edge27, 20, 187).
link(edge27, edge36, 20, 187).
link(edge27, edge28, 40, 100).
link(edge28, edge27, 40, 100).
link(edge27, cloud11, 39, 219).
link(cloud11, edge27, 39, 219).
link(edge27, edge29, 32, 115).
link(edge29, edge27, 32, 115).
link(edge27, edge34, 40, 141).
link(edge34, edge27, 40, 141).
link(edge28, cloud11, 42, 267).
link(cloud11, edge28, 42, 267).
link(edge28, edge30, 35, 115).
link(edge30, edge28, 35, 115).
link(edge28, edge32, 25, 163).
link(edge32, edge28, 25, 163).
link(edge28, edge37, 20, 179).
link(edge37, edge28, 20, 179).
link(edge28, cloud13, 79, 298).
link(cloud13, edge28, 79, 298).
link(edge31, edge28, 33, 117).
link(edge28, edge31, 33, 117).
link(edge33, edge28, 48, 170).
link(edge28, edge33, 48, 170).
link(edge34, edge28, 22, 171).
link(edge28, edge34, 22, 171).
link(edge35, edge28, 21, 160).
link(edge28, edge35, 21, 160).
link(edge28, edge29, 42, 130).
link(edge29, edge28, 42, 130).
link(edge28, edge36, 33, 148).
link(edge36, edge28, 33, 148).
link(edge28, cloud12, 42, 237).
link(cloud12, edge28, 42, 237).
link(cloud11, edge33, 25, 217).
link(edge33, cloud11, 25, 217).
link(cloud11, edge34, 67, 215).
link(edge34, cloud11, 67, 215).
link(edge32, cloud11, 56, 251).
link(cloud11, edge32, 56, 251).
link(edge36, cloud11, 78, 213).
link(cloud11, edge36, 78, 213).
link(cloud11, edge29, 38, 296).
link(edge29, cloud11, 38, 296).
link(cloud11, edge30, 43, 228).
link(edge30, cloud11, 43, 228).
link(cloud11, edge31, 35, 221).
link(edge31, cloud11, 35, 221).
link(cloud11, edge35, 39, 295).
link(edge35, cloud11, 39, 295).
link(cloud11, cloud12, 15, 755).
link(cloud12, cloud11, 15, 755).
link(cloud11, edge37, 34, 278).
link(edge37, cloud11, 34, 278).
link(cloud11, cloud13, 14, 791).
link(cloud13, cloud11, 14, 791).
link(edge29, edge31, 35, 136).
link(edge31, edge29, 35, 136).
link(edge29, edge32, 17, 166).
link(edge32, edge29, 17, 166).
link(edge29, edge33, 44, 129).
link(edge33, edge29, 44, 129).
link(edge29, edge34, 45, 166).
link(edge34, edge29, 45, 166).
link(cloud12, edge29, 43, 204).
link(edge29, cloud12, 43, 204).
link(cloud13, edge29, 72, 209).
link(edge29, cloud13, 72, 209).
link(edge29, edge30, 41, 159).
link(edge30, edge29, 41, 159).
link(edge29, edge35, 48, 194).
link(edge35, edge29, 48, 194).
link(edge29, edge36, 40, 151).
link(edge36, edge29, 40, 151).
link(edge29, edge37, 39, 173).
link(edge37, edge29, 39, 173).
link(edge30, edge35, 28, 154).
link(edge35, edge30, 28, 154).
link(edge30, edge36, 47, 138).
link(edge36, edge30, 47, 138).
link(edge30, cloud12, 44, 225).
link(cloud12, edge30, 44, 225).
link(edge31, edge30, 48, 143).
link(edge30, edge31, 48, 143).
link(edge33, edge30, 19, 132).
link(edge30, edge33, 19, 132).
link(edge37, edge30, 36, 176).
link(edge30, edge37, 36, 176).
link(cloud13, edge30, 29, 291).
link(edge30, cloud13, 29, 291).
link(edge30, edge32, 34, 137).
link(edge32, edge30, 34, 137).
link(edge30, edge34, 40, 131).
link(edge34, edge30, 40, 131).
link(edge31, edge34, 41, 110).
link(edge34, edge31, 41, 110).
link(edge31, edge35, 24, 103).
link(edge35, edge31, 24, 103).
link(edge31, cloud12, 64, 262).
link(cloud12, edge31, 64, 262).
link(edge31, cloud13, 64, 232).
link(cloud13, edge31, 64, 232).
link(edge31, edge32, 32, 160).
link(edge32, edge31, 32, 160).
link(edge31, edge33, 44, 114).
link(edge33, edge31, 44, 114).
link(edge31, edge36, 53, 168).
link(edge36, edge31, 53, 168).
link(edge31, edge37, 38, 113).
link(edge37, edge31, 38, 113).
link(edge35, edge32, 40, 148).
link(edge32, edge35, 40, 148).
link(cloud12, edge32, 44, 271).
link(edge32, cloud12, 44, 271).
link(edge37, edge32, 43, 120).
link(edge32, edge37, 43, 120).
link(edge32, edge33, 46, 198).
link(edge33, edge32, 46, 198).
link(edge32, edge34, 38, 165).
link(edge34, edge32, 38, 165).
link(edge32, edge36, 35, 156).
link(edge36, edge32, 35, 156).
link(edge32, cloud13, 41, 223).
link(cloud13, edge32, 41, 223).
link(edge33, edge34, 21, 122).
link(edge34, edge33, 21, 122).
link(edge33, edge36, 44, 151).
link(edge36, edge33, 44, 151).
link(edge33, cloud12, 55, 250).
link(cloud12, edge33, 55, 250).
link(edge33, edge37, 44, 169).
link(edge37, edge33, 44, 169).
link(cloud13, edge33, 42, 280).
link(edge33, cloud13, 42, 280).
link(edge33, edge35, 32, 135).
link(edge35, edge33, 32, 135).
link(edge34, edge35, 33, 178).
link(edge35, edge34, 33, 178).
link(edge34, edge36, 46, 168).
link(edge36, edge34, 46, 168).
link(edge34, cloud13, 45, 290).
link(cloud13, edge34, 45, 290).
link(edge37, edge34, 34, 198).
link(edge34, edge37, 34, 198).
link(edge34, cloud12, 40, 253).
link(cloud12, edge34, 40, 253).
link(edge35, edge36, 29, 119).
link(edge36, edge35, 29, 119).
link(cloud12, edge35, 58, 205).
link(edge35, cloud12, 58, 205).
link(edge35, edge37, 37, 127).
link(edge37, edge35, 37, 127).
link(edge35, cloud13, 38, 252).
link(cloud13, edge35, 38, 252).
link(edge36, cloud13, 30, 284).
link(cloud13, edge36, 30, 284).
link(cloud12, edge36, 68, 276).
link(edge36, cloud12, 68, 276).
link(edge37, edge36, 45, 169).
link(edge36, edge37, 45, 169).
link(cloud12, edge37, 69, 269).
link(edge37, cloud12, 69, 269).
link(cloud12, cloud13, 7, 356).
link(cloud13, cloud12, 7, 356).
link(cloud13, edge37, 47, 275).
link(edge37, cloud13, 47, 275).
link(N, N, 0, 100000).