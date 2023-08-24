:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

globalIntent(footprint, smaller, 1.460, kg).

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

node(edge1, edge, (18, 8, 1086)).
	totHW(edge1, (20, 9, 1170)).
	pue(edge1, 1.07).
	energySourceMix(edge1, [(0.18,coal), (0.56,gas), (0.27,solar)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.13 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.007 * L.
	energyCost(edge1, 0.494).

node(edge2, edge, (23, 12, 1032)).
	totHW(edge2, (29, 15, 1266)).
	pue(edge2, 1.13).
	energySourceMix(edge2, [(0.31,solar), (0.09,offshorewind), (0.6,coal)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.18 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.01 * L.
	energyCost(edge2, 0.329).

node(edge3, edge, (21, 7, 603)).
	totHW(edge3, (27, 9, 746)).
	pue(edge3, 1.12).
	energySourceMix(edge3, [(0.66,onshorewind), (0.34,offshorewind)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.132 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.007 * L.
	energyCost(edge3, 0.218).

node(edge4, edge, (24, 8, 781)).
	totHW(edge4, (29, 10, 926)).
	pue(edge4, 1.09).
	energySourceMix(edge4, [(0.38,gas), (0.62,coal)]).
	ramEnergyProfile(edge4, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge4, L, E) :- E is 0.124 * L.
	storageEnergyProfile(edge4, L, E) :- E is 0.006 * L.
	energyCost(edge4, 0.459).

node(cloud1, cloud, (186, 28, 11654)).
	totHW(cloud1, (188, 29, 11727)).
	pue(cloud1, 1.22).
	energySourceMix(cloud1, [(0.55,solar), (0.45,gas)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.068 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.301 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.08 * L.
	energyCost(cloud1, 0.099).

node(edge5, edge, (26, 12, 544)).
	totHW(edge5, (27, 13, 554)).
	pue(edge5, 1.08).
	energySourceMix(edge5, [(0.3,solar), (0.7,offshorewind)]).
	ramEnergyProfile(edge5, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge5, L, E) :- E is 0.172 * L.
	storageEnergyProfile(edge5, L, E) :- E is 0.005 * L.
	energyCost(edge5, 0.459).

node(edge6, edge, (12, 11, 628)).
	totHW(edge6, (17, 15, 822)).
	pue(edge6, 1.12).
	energySourceMix(edge6, [(0.3,onshorewind), (0.7,offshorewind)]).
	ramEnergyProfile(edge6, L, E) :- E is 0.008 * L.
	cpuEnergyProfile(edge6, L, E) :- E is 0.195 * L.
	storageEnergyProfile(edge6, L, E) :- E is 0.006 * L.
	energyCost(edge6, 0.081).

node(edge7, edge, (20, 7, 1182)).
	totHW(edge7, (27, 10, 1579)).
	pue(edge7, 1.1).
	energySourceMix(edge7, [(0.96,offshorewind), (0.01,coal), (0.03,gas)]).
	ramEnergyProfile(edge7, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge7, L, E) :- E is 0.13 * L.
	storageEnergyProfile(edge7, L, E) :- E is 0.011 * L.
	energyCost(edge7, 0.166).

node(edge8, edge, (19, 8, 1539)).
	totHW(edge8, (24, 10, 1872)).
	pue(edge8, 1.08).
	energySourceMix(edge8, [(0.26,offshorewind), (0.36,onshorewind), (0.38,coal)]).
	ramEnergyProfile(edge8, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge8, L, E) :- E is 0.15 * L.
	storageEnergyProfile(edge8, L, E) :- E is 0.018 * L.
	energyCost(edge8, 0.191).

node(edge9, edge, (22, 13, 1658)).
	totHW(edge9, (24, 14, 1750)).
	pue(edge9, 1.14).
	energySourceMix(edge9, [(0.13,offshorewind), (0.87,coal)]).
	ramEnergyProfile(edge9, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge9, L, E) :- E is 0.184 * L.
	storageEnergyProfile(edge9, L, E) :- E is 0.014 * L.
	energyCost(edge9, 0.081).

node(edge10, edge, (22, 12, 946)).
	totHW(edge10, (24, 13, 1015)).
	pue(edge10, 1.11).
	energySourceMix(edge10, [(0.12,solar), (0.04,offshorewind), (0.84,onshorewind)]).
	ramEnergyProfile(edge10, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge10, L, E) :- E is 0.177 * L.
	storageEnergyProfile(edge10, L, E) :- E is 0.008 * L.
	energyCost(edge10, 0.218).

node(cloud2, cloud, (135, 33, 9253)).
	totHW(cloud2, (158, 39, 10783)).
	pue(cloud2, 1.51).
	energySourceMix(cloud2, [(0.7,solar), (0.3,gas)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.049 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.422 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.058 * L.
	energyCost(cloud2, 0.417).

node(edge11, edge, (28, 11, 1099)).
	totHW(edge11, (31, 12, 1182)).
	pue(edge11, 1.09).
	energySourceMix(edge11, [(0.1,onshorewind), (0.9,gas)]).
	ramEnergyProfile(edge11, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge11, L, E) :- E is 0.178 * L.
	storageEnergyProfile(edge11, L, E) :- E is 0.007 * L.
	energyCost(edge11, 0.519).

node(edge12, edge, (26, 9, 610)).
	totHW(edge12, (31, 11, 717)).
	pue(edge12, 1.19).
	energySourceMix(edge12, [(0.9,offshorewind), (0.1,gas)]).
	ramEnergyProfile(edge12, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge12, L, E) :- E is 0.153 * L.
	storageEnergyProfile(edge12, L, E) :- E is 0.006 * L.
	energyCost(edge12, 0.529).

node(edge13, edge, (16, 11, 908)).
	totHW(edge13, (21, 15, 1156)).
	pue(edge13, 1.17).
	energySourceMix(edge13, [(0.08,coal), (0.5,gas), (0.42,solar)]).
	ramEnergyProfile(edge13, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge13, L, E) :- E is 0.189 * L.
	storageEnergyProfile(edge13, L, E) :- E is 0.01 * L.
	energyCost(edge13, 0.329).

node(edge14, edge, (14, 8, 1122)).
	totHW(edge14, (19, 11, 1432)).
	pue(edge14, 1.15).
	energySourceMix(edge14, [(0.43,offshorewind), (0.38,onshorewind), (0.18,gas)]).
	ramEnergyProfile(edge14, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge14, L, E) :- E is 0.137 * L.
	storageEnergyProfile(edge14, L, E) :- E is 0.013 * L.
	energyCost(edge14, 0.459).

node(cloud3, cloud, (141, 37, 9184)).
	totHW(cloud3, (171, 46, 11118)).
	pue(cloud3, 1.38).
	energySourceMix(cloud3, [(0.93,onshorewind), (0.02,coal), (0.05,gas)]).
	ramEnergyProfile(cloud3, L, E) :- E is 0.065 * L.
	cpuEnergyProfile(cloud3, L, E) :- E is 0.464 * L.
	storageEnergyProfile(cloud3, L, E) :- E is 0.064 * L.
	energyCost(cloud3, 0.48).

node(edge15, edge, (17, 11, 565)).
	totHW(edge15, (21, 14, 698)).
	pue(edge15, 1.17).
	energySourceMix(edge15, [(0.69,solar), (0.31,onshorewind)]).
	ramEnergyProfile(edge15, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge15, L, E) :- E is 0.189 * L.
	storageEnergyProfile(edge15, L, E) :- E is 0.005 * L.
	energyCost(edge15, 0.519).

node(edge16, edge, (14, 8, 1422)).
	totHW(edge16, (17, 10, 1654)).
	pue(edge16, 1.13).
	energySourceMix(edge16, [(0.07,onshorewind), (0.91,solar), (0.02,coal)]).
	ramEnergyProfile(edge16, L, E) :- E is 0.008 * L.
	cpuEnergyProfile(edge16, L, E) :- E is 0.149 * L.
	storageEnergyProfile(edge16, L, E) :- E is 0.011 * L.
	energyCost(edge16, 0.215).

node(cloud4, cloud, (116, 36, 4614)).
	totHW(cloud4, (142, 45, 5616)).
	pue(cloud4, 1.28).
	energySourceMix(cloud4, [(0.69,onshorewind), (0.31,solar)]).
	ramEnergyProfile(cloud4, L, E) :- E is 0.046 * L.
	cpuEnergyProfile(cloud4, L, E) :- E is 0.437 * L.
	storageEnergyProfile(cloud4, L, E) :- E is 0.038 * L.
	energyCost(cloud4, 0.218).

node(edge17, edge, (16, 10, 981)).
	totHW(edge17, (22, 14, 1276)).
	pue(edge17, 1.05).
	energySourceMix(edge17, [(0.11,offshorewind), (0.48,solar), (0.41,coal)]).
	ramEnergyProfile(edge17, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge17, L, E) :- E is 0.207 * L.
	storageEnergyProfile(edge17, L, E) :- E is 0.012 * L.
	energyCost(edge17, 0.383).

node(edge18, edge, (26, 6, 551)).
	totHW(edge18, (31, 8, 637)).
	pue(edge18, 1.09).
	energySourceMix(edge18, [(0.12,onshorewind), (0.6,solar), (0.28,offshorewind)]).
	ramEnergyProfile(edge18, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge18, L, E) :- E is 0.101 * L.
	storageEnergyProfile(edge18, L, E) :- E is 0.004 * L.
	energyCost(edge18, 0.524).

node(edge19, edge, (25, 12, 1409)).
	totHW(edge19, (28, 14, 1539)).
	pue(edge19, 1.13).
	energySourceMix(edge19, [(0.74,coal), (0.26,solar)]).
	ramEnergyProfile(edge19, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge19, L, E) :- E is 0.205 * L.
	storageEnergyProfile(edge19, L, E) :- E is 0.01 * L.
	energyCost(edge19, 0.238).

node(edge20, edge, (17, 8, 1591)).
	totHW(edge20, (20, 10, 1830)).
	pue(edge20, 1.15).
	energySourceMix(edge20, [(0.76,offshorewind), (0.07,gas), (0.17,onshorewind)]).
	ramEnergyProfile(edge20, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge20, L, E) :- E is 0.143 * L.
	storageEnergyProfile(edge20, L, E) :- E is 0.015 * L.
	energyCost(edge20, 0.191).

node(cloud5, cloud, (242, 45, 7446)).
	totHW(cloud5, (248, 47, 7626)).
	pue(cloud5, 1.43).
	energySourceMix(cloud5, [(0.85,gas), (0.13,solar), (0.01,onshorewind)]).
	ramEnergyProfile(cloud5, L, E) :- E is 0.078 * L.
	cpuEnergyProfile(cloud5, L, E) :- E is 0.433 * L.
	storageEnergyProfile(cloud5, L, E) :- E is 0.048 * L.
	energyCost(cloud5, 0.383).

node(edge21, edge, (21, 12, 1069)).
	totHW(edge21, (26, 15, 1265)).
	pue(edge21, 1.14).
	energySourceMix(edge21, [(0.36,coal), (0.64,onshorewind)]).
	ramEnergyProfile(edge21, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge21, L, E) :- E is 0.21 * L.
	storageEnergyProfile(edge21, L, E) :- E is 0.011 * L.
	energyCost(edge21, 0.417).

node(edge22, edge, (16, 6, 631)).
	totHW(edge22, (21, 8, 801)).
	pue(edge22, 1.07).
	energySourceMix(edge22, [(0.51,onshorewind), (0.46,offshorewind), (0.03,gas)]).
	ramEnergyProfile(edge22, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge22, L, E) :- E is 0.105 * L.
	storageEnergyProfile(edge22, L, E) :- E is 0.006 * L.
	energyCost(edge22, 0.299).

node(cloud6, cloud, (214, 38, 6531)).
	totHW(cloud6, (248, 44, 7559)).
	pue(cloud6, 1.23).
	energySourceMix(cloud6, [(0.02,gas), (0.07,coal), (0.91,solar)]).
	ramEnergyProfile(cloud6, L, E) :- E is 0.09 * L.
	cpuEnergyProfile(cloud6, L, E) :- E is 0.496 * L.
	storageEnergyProfile(cloud6, L, E) :- E is 0.046 * L.
	energyCost(cloud6, 0.299).

node(edge23, edge, (16, 6, 762)).
	totHW(edge23, (22, 9, 1022)).
	pue(edge23, 1.07).
	energySourceMix(edge23, [(0.01,offshorewind), (0.99,gas)]).
	ramEnergyProfile(edge23, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge23, L, E) :- E is 0.117 * L.
	storageEnergyProfile(edge23, L, E) :- E is 0.008 * L.
	energyCost(edge23, 0.099).

node(edge24, edge, (24, 12, 1333)).
	totHW(edge24, (30, 15, 1625)).
	pue(edge24, 1.14).
	energySourceMix(edge24, [(0.32,coal), (0.68,onshorewind)]).
	ramEnergyProfile(edge24, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge24, L, E) :- E is 0.212 * L.
	storageEnergyProfile(edge24, L, E) :- E is 0.015 * L.
	energyCost(edge24, 0.081).

node(edge25, edge, (20, 10, 1151)).
	totHW(edge25, (24, 12, 1352)).
	pue(edge25, 1.06).
	energySourceMix(edge25, [(0.15,solar), (0.85,onshorewind)]).
	ramEnergyProfile(edge25, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge25, L, E) :- E is 0.144 * L.
	storageEnergyProfile(edge25, L, E) :- E is 0.011 * L.
	energyCost(edge25, 0.072).

node(edge26, edge, (16, 14, 1818)).
	totHW(edge26, (17, 15, 1870)).
	pue(edge26, 1.17).
	energySourceMix(edge26, [(0.1,onshorewind), (0.87,gas), (0.02,solar)]).
	ramEnergyProfile(edge26, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge26, L, E) :- E is 0.204 * L.
	storageEnergyProfile(edge26, L, E) :- E is 0.014 * L.
	energyCost(edge26, 0.29).

node(edge27, edge, (15, 11, 1262)).
	totHW(edge27, (18, 14, 1489)).
	pue(edge27, 1.1).
	energySourceMix(edge27, [(0.59,offshorewind), (0.31,gas), (0.09,coal)]).
	ramEnergyProfile(edge27, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge27, L, E) :- E is 0.206 * L.
	storageEnergyProfile(edge27, L, E) :- E is 0.009 * L.
	energyCost(edge27, 0.064).

node(edge28, edge, (17, 7, 628)).
	totHW(edge28, (23, 10, 807)).
	pue(edge28, 1.05).
	energySourceMix(edge28, [(0.35,solar), (0.06,coal), (0.6,offshorewind)]).
	ramEnergyProfile(edge28, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge28, L, E) :- E is 0.148 * L.
	storageEnergyProfile(edge28, L, E) :- E is 0.006 * L.
	energyCost(edge28, 0.29).

node(cloud7, cloud, (195, 20, 4999)).
	totHW(cloud7, (243, 26, 6225)).
	pue(cloud7, 1.52).
	energySourceMix(cloud7, [(0.25,coal), (0.55,gas), (0.2,offshorewind)]).
	ramEnergyProfile(cloud7, L, E) :- E is 0.097 * L.
	cpuEnergyProfile(cloud7, L, E) :- E is 0.305 * L.
	storageEnergyProfile(cloud7, L, E) :- E is 0.032 * L.
	energyCost(cloud7, 0.081).

node(cloud8, cloud, (146, 28, 4217)).
	totHW(cloud8, (185, 36, 5337)).
	pue(cloud8, 1.41).
	energySourceMix(cloud8, [(0.03,coal), (0.62,solar), (0.35,gas)]).
	ramEnergyProfile(cloud8, L, E) :- E is 0.068 * L.
	cpuEnergyProfile(cloud8, L, E) :- E is 0.337 * L.
	storageEnergyProfile(cloud8, L, E) :- E is 0.04 * L.
	energyCost(cloud8, 0.383).

node(edge29, edge, (22, 13, 1714)).
	totHW(edge29, (26, 15, 1955)).
	pue(edge29, 1.15).
	energySourceMix(edge29, [(0.61,coal), (0.39,onshorewind)]).
	ramEnergyProfile(edge29, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge29, L, E) :- E is 0.194 * L.
	storageEnergyProfile(edge29, L, E) :- E is 0.017 * L.
	energyCost(edge29, 0.064).

node(edge30, edge, (20, 12, 459)).
	totHW(edge30, (24, 15, 536)).
	pue(edge30, 1.19).
	energySourceMix(edge30, [(0.25,coal), (0.1,solar), (0.66,onshorewind)]).
	ramEnergyProfile(edge30, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge30, L, E) :- E is 0.193 * L.
	storageEnergyProfile(edge30, L, E) :- E is 0.005 * L.
	energyCost(edge30, 0.166).

node(edge31, edge, (22, 11, 646)).
	totHW(edge31, (30, 15, 845)).
	pue(edge31, 1.06).
	energySourceMix(edge31, [(0.16,onshorewind), (0.83,offshorewind), (0.01,coal)]).
	ramEnergyProfile(edge31, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge31, L, E) :- E is 0.205 * L.
	storageEnergyProfile(edge31, L, E) :- E is 0.007 * L.
	energyCost(edge31, 0.072).

node(cloud9, cloud, (204, 27, 5689)).
	totHW(cloud9, (219, 29, 6106)).
	pue(cloud9, 1.16).
	energySourceMix(cloud9, [(0.5,solar), (0.5,onshorewind)]).
	ramEnergyProfile(cloud9, L, E) :- E is 0.086 * L.
	cpuEnergyProfile(cloud9, L, E) :- E is 0.318 * L.
	storageEnergyProfile(cloud9, L, E) :- E is 0.034 * L.
	energyCost(cloud9, 0.276).

node(edge32, edge, (19, 6, 1123)).
	totHW(edge32, (22, 8, 1294)).
	pue(edge32, 1.06).
	energySourceMix(edge32, [(0.74,coal), (0.26,offshorewind)]).
	ramEnergyProfile(edge32, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge32, L, E) :- E is 0.12 * L.
	storageEnergyProfile(edge32, L, E) :- E is 0.012 * L.
	energyCost(edge32, 0.081).

node(edge33, edge, (18, 10, 477)).
	totHW(edge33, (20, 11, 521)).
	pue(edge33, 1.11).
	energySourceMix(edge33, [(0.11,gas), (0.59,onshorewind), (0.3,solar)]).
	ramEnergyProfile(edge33, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge33, L, E) :- E is 0.139 * L.
	storageEnergyProfile(edge33, L, E) :- E is 0.004 * L.
	energyCost(edge33, 0.099).

node(edge34, edge, (26, 12, 893)).
	totHW(edge34, (30, 14, 1027)).
	pue(edge34, 1.07).
	energySourceMix(edge34, [(0.0,offshorewind), (0.68,gas), (0.32,onshorewind)]).
	ramEnergyProfile(edge34, L, E) :- E is 0.016 * L.
	cpuEnergyProfile(edge34, L, E) :- E is 0.193 * L.
	storageEnergyProfile(edge34, L, E) :- E is 0.007 * L.
	energyCost(edge34, 0.064).

node(cloud10, cloud, (194, 20, 5129)).
	totHW(cloud10, (239, 25, 6290)).
	pue(cloud10, 1.4).
	energySourceMix(cloud10, [(0.81,coal), (0.19,onshorewind)]).
	ramEnergyProfile(cloud10, L, E) :- E is 0.088 * L.
	cpuEnergyProfile(cloud10, L, E) :- E is 0.249 * L.
	storageEnergyProfile(cloud10, L, E) :- E is 0.033 * L.
	energyCost(cloud10, 0.276).

node(edge35, edge, (16, 7, 628)).
	totHW(edge35, (20, 9, 762)).
	pue(edge35, 1.06).
	energySourceMix(edge35, [(0.29,coal), (0.71,gas)]).
	ramEnergyProfile(edge35, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge35, L, E) :- E is 0.114 * L.
	storageEnergyProfile(edge35, L, E) :- E is 0.006 * L.
	energyCost(edge35, 0.146).

node(edge36, edge, (14, 10, 1273)).
	totHW(edge36, (19, 13, 1643)).
	pue(edge36, 1.17).
	energySourceMix(edge36, [(0.44,gas), (0.12,solar), (0.44,onshorewind)]).
	ramEnergyProfile(edge36, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge36, L, E) :- E is 0.175 * L.
	storageEnergyProfile(edge36, L, E) :- E is 0.011 * L.
	energyCost(edge36, 0.29).

node(edge37, edge, (13, 11, 1127)).
	totHW(edge37, (18, 15, 1454)).
	pue(edge37, 1.08).
	energySourceMix(edge37, [(0.15,offshorewind), (0.0,onshorewind), (0.85,solar)]).
	ramEnergyProfile(edge37, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge37, L, E) :- E is 0.182 * L.
	storageEnergyProfile(edge37, L, E) :- E is 0.013 * L.
	energyCost(edge37, 0.081).

node(cloud11, cloud, (160, 38, 5388)).
	totHW(cloud11, (188, 45, 6320)).
	pue(cloud11, 1.5).
	energySourceMix(cloud11, [(0.25,onshorewind), (0.31,offshorewind), (0.44,coal)]).
	ramEnergyProfile(cloud11, L, E) :- E is 0.073 * L.
	cpuEnergyProfile(cloud11, L, E) :- E is 0.525 * L.
	storageEnergyProfile(cloud11, L, E) :- E is 0.038 * L.
	energyCost(cloud11, 0.276).

node(cloud12, cloud, (161, 34, 6266)).
	totHW(cloud12, (208, 44, 8074)).
	pue(cloud12, 1.38).
	energySourceMix(cloud12, [(0.71,coal), (0.08,gas), (0.22,solar)]).
	ramEnergyProfile(cloud12, L, E) :- E is 0.079 * L.
	cpuEnergyProfile(cloud12, L, E) :- E is 0.473 * L.
	storageEnergyProfile(cloud12, L, E) :- E is 0.063 * L.
	energyCost(cloud12, 0.215).

node(edge38, edge, (19, 10, 958)).
	totHW(edge38, (25, 13, 1232)).
	pue(edge38, 1.1).
	energySourceMix(edge38, [(0.07,onshorewind), (0.93,coal)]).
	ramEnergyProfile(edge38, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge38, L, E) :- E is 0.157 * L.
	storageEnergyProfile(edge38, L, E) :- E is 0.012 * L.
	energyCost(edge38, 0.238).

link(edge1, edge2, 17, 146).
link(edge2, edge1, 17, 146).
link(edge1, edge3, 28, 179).
link(edge3, edge1, 28, 179).
link(edge1, cloud1, 54, 275).
link(cloud1, edge1, 54, 275).
link(edge1, edge6, 24, 149).
link(edge6, edge1, 24, 149).
link(edge1, edge7, 25, 126).
link(edge7, edge1, 25, 126).
link(edge1, edge10, 34, 145).
link(edge10, edge1, 34, 145).
link(edge1, edge11, 31, 179).
link(edge11, edge1, 31, 179).
link(edge1, edge12, 28, 118).
link(edge12, edge1, 28, 118).
link(edge1, cloud3, 61, 272).
link(cloud3, edge1, 61, 272).
link(edge1, edge16, 11, 142).
link(edge16, edge1, 11, 142).
link(edge1, edge18, 16, 131).
link(edge18, edge1, 16, 131).
link(edge1, edge21, 18, 138).
link(edge21, edge1, 18, 138).
link(edge1, edge22, 25, 136).
link(edge22, edge1, 25, 136).
link(edge1, edge23, 34, 178).
link(edge23, edge1, 34, 178).
link(edge1, edge24, 26, 189).
link(edge24, edge1, 26, 189).
link(edge1, edge25, 35, 192).
link(edge25, edge1, 35, 192).
link(edge1, edge26, 33, 111).
link(edge26, edge1, 33, 111).
link(edge1, edge27, 24, 165).
link(edge27, edge1, 24, 165).
link(edge1, edge28, 31, 138).
link(edge28, edge1, 31, 138).
link(edge1, edge29, 34, 109).
link(edge29, edge1, 34, 109).
link(edge1, edge31, 17, 172).
link(edge31, edge1, 17, 172).
link(edge1, edge33, 31, 163).
link(edge33, edge1, 31, 163).
link(edge1, edge34, 32, 184).
link(edge34, edge1, 32, 184).
link(edge1, cloud10, 70, 218).
link(cloud10, edge1, 70, 218).
link(edge1, edge37, 18, 149).
link(edge37, edge1, 18, 149).
link(edge1, cloud12, 67, 232).
link(cloud12, edge1, 67, 232).
link(edge4, edge1, 34, 115).
link(edge1, edge4, 34, 115).
link(edge8, edge1, 11, 108).
link(edge1, edge8, 11, 108).
link(edge14, edge1, 19, 184).
link(edge1, edge14, 19, 184).
link(cloud4, edge1, 65, 212).
link(edge1, cloud4, 65, 212).
link(edge17, edge1, 36, 162).
link(edge1, edge17, 36, 162).
link(edge20, edge1, 29, 115).
link(edge1, edge20, 29, 115).
link(cloud7, edge1, 54, 298).
link(edge1, cloud7, 54, 298).
link(cloud8, edge1, 61, 233).
link(edge1, cloud8, 61, 233).
link(cloud9, edge1, 54, 283).
link(edge1, cloud9, 54, 283).
link(cloud11, edge1, 60, 214).
link(edge1, cloud11, 60, 214).
link(edge1, edge5, 26, 114).
link(edge5, edge1, 26, 114).
link(edge1, edge9, 31, 176).
link(edge9, edge1, 31, 176).
link(edge1, cloud2, 59, 231).
link(cloud2, edge1, 59, 231).
link(edge1, edge13, 25, 195).
link(edge13, edge1, 25, 195).
link(edge1, edge15, 29, 118).
link(edge15, edge1, 29, 118).
link(edge1, edge19, 29, 120).
link(edge19, edge1, 29, 120).
link(edge1, cloud5, 61, 208).
link(cloud5, edge1, 61, 208).
link(edge1, cloud6, 69, 200).
link(cloud6, edge1, 69, 200).
link(edge1, edge30, 39, 121).
link(edge30, edge1, 39, 121).
link(edge1, edge32, 34, 113).
link(edge32, edge1, 34, 113).
link(edge1, edge35, 25, 157).
link(edge35, edge1, 25, 157).
link(edge1, edge36, 24, 132).
link(edge36, edge1, 24, 132).
link(edge1, edge38, 41, 171).
link(edge38, edge1, 41, 171).
link(edge2, edge9, 33, 121).
link(edge9, edge2, 33, 121).
link(edge2, edge10, 18, 146).
link(edge10, edge2, 18, 146).
link(edge2, edge11, 30, 125).
link(edge11, edge2, 30, 125).
link(edge2, edge12, 38, 161).
link(edge12, edge2, 38, 161).
link(edge2, cloud3, 69, 291).
link(cloud3, edge2, 69, 291).
link(edge2, edge15, 30, 136).
link(edge15, edge2, 30, 136).
link(edge2, edge18, 33, 124).
link(edge18, edge2, 33, 124).
link(edge2, edge19, 19, 140).
link(edge19, edge2, 19, 140).
link(edge2, edge23, 17, 198).
link(edge23, edge2, 17, 198).
link(edge2, edge24, 21, 148).
link(edge24, edge2, 21, 148).
link(edge2, edge28, 27, 174).
link(edge28, edge2, 27, 174).
link(edge2, edge31, 34, 154).
link(edge31, edge2, 34, 154).
link(edge2, edge32, 38, 111).
link(edge32, edge2, 38, 111).
link(edge2, edge33, 20, 108).
link(edge33, edge2, 20, 108).
link(edge2, edge34, 33, 181).
link(edge34, edge2, 33, 181).
link(edge2, edge35, 25, 161).
link(edge35, edge2, 25, 161).
link(edge2, edge36, 38, 148).
link(edge36, edge2, 38, 148).
link(edge2, edge38, 31, 109).
link(edge38, edge2, 31, 109).
link(edge3, edge2, 26, 184).
link(edge2, edge3, 26, 184).
link(edge5, edge2, 30, 142).
link(edge2, edge5, 30, 142).
link(cloud6, edge2, 56, 281).
link(edge2, cloud6, 56, 281).
link(edge25, edge2, 28, 156).
link(edge2, edge25, 28, 156).
link(edge26, edge2, 42, 131).
link(edge2, edge26, 42, 131).
link(cloud8, edge2, 64, 253).
link(edge2, cloud8, 64, 253).
link(edge30, edge2, 34, 100).
link(edge2, edge30, 34, 100).
link(cloud9, edge2, 64, 282).
link(edge2, cloud9, 64, 282).
link(cloud10, edge2, 63, 233).
link(edge2, cloud10, 63, 233).
link(cloud11, edge2, 70, 244).
link(edge2, cloud11, 70, 244).
link(cloud12, edge2, 50, 229).
link(edge2, cloud12, 50, 229).
link(edge2, edge4, 31, 133).
link(edge4, edge2, 31, 133).
link(edge2, cloud1, 70, 234).
link(cloud1, edge2, 70, 234).
link(edge2, edge6, 41, 164).
link(edge6, edge2, 41, 164).
link(edge2, edge7, 42, 177).
link(edge7, edge2, 42, 177).
link(edge2, edge8, 28, 110).
link(edge8, edge2, 28, 110).
link(edge2, cloud2, 62, 231).
link(cloud2, edge2, 62, 231).
link(edge2, edge13, 42, 177).
link(edge13, edge2, 42, 177).
link(edge2, edge14, 29, 119).
link(edge14, edge2, 29, 119).
link(edge2, edge16, 28, 152).
link(edge16, edge2, 28, 152).
link(edge2, cloud4, 55, 213).
link(cloud4, edge2, 55, 213).
link(edge2, edge17, 40, 152).
link(edge17, edge2, 40, 152).
link(edge2, edge20, 30, 149).
link(edge20, edge2, 30, 149).
link(edge2, cloud5, 64, 249).
link(cloud5, edge2, 64, 249).
link(edge2, edge21, 35, 185).
link(edge21, edge2, 35, 185).
link(edge2, edge22, 33, 138).
link(edge22, edge2, 33, 138).
link(edge2, edge27, 34, 113).
link(edge27, edge2, 34, 113).
link(edge2, cloud7, 67, 260).
link(cloud7, edge2, 67, 260).
link(edge2, edge29, 37, 192).
link(edge29, edge2, 37, 192).
link(edge2, edge37, 33, 116).
link(edge37, edge2, 33, 116).
link(edge3, cloud1, 75, 292).
link(cloud1, edge3, 75, 292).
link(edge3, edge5, 22, 147).
link(edge5, edge3, 22, 147).
link(edge3, edge7, 29, 129).
link(edge7, edge3, 29, 129).
link(edge3, edge8, 26, 118).
link(edge8, edge3, 26, 118).
link(edge3, edge9, 30, 110).
link(edge9, edge3, 30, 110).
link(edge3, edge12, 15, 181).
link(edge12, edge3, 15, 181).
link(edge3, edge13, 34, 196).
link(edge13, edge3, 34, 196).
link(edge3, edge14, 38, 123).
link(edge14, edge3, 38, 123).
link(edge3, edge15, 25, 179).
link(edge15, edge3, 25, 179).
link(edge3, edge16, 17, 123).
link(edge16, edge3, 17, 123).
link(edge3, cloud4, 76, 276).
link(cloud4, edge3, 76, 276).
link(edge3, cloud5, 76, 262).
link(cloud5, edge3, 76, 262).
link(edge3, cloud6, 75, 204).
link(cloud6, edge3, 75, 204).
link(edge3, edge24, 11, 156).
link(edge24, edge3, 11, 156).
link(edge3, edge27, 13, 111).
link(edge27, edge3, 13, 111).
link(edge3, edge28, 27, 184).
link(edge28, edge3, 27, 184).
link(edge3, cloud8, 69, 288).
link(cloud8, edge3, 69, 288).
link(edge3, edge30, 35, 183).
link(edge30, edge3, 35, 183).
link(edge3, edge31, 11, 103).
link(edge31, edge3, 11, 103).
link(edge3, cloud9, 67, 234).
link(cloud9, edge3, 67, 234).
link(edge3, edge34, 17, 178).
link(edge34, edge3, 17, 178).
link(edge3, cloud10, 74, 223).
link(cloud10, edge3, 74, 223).
link(edge3, edge36, 31, 139).
link(edge36, edge3, 31, 139).
link(edge3, cloud11, 73, 216).
link(cloud11, edge3, 73, 216).
link(edge3, edge38, 38, 165).
link(edge38, edge3, 38, 165).
link(edge4, edge3, 27, 150).
link(edge3, edge4, 27, 150).
link(edge11, edge3, 40, 179).
link(edge3, edge11, 40, 179).
link(edge17, edge3, 21, 156).
link(edge3, edge17, 21, 156).
link(edge19, edge3, 37, 169).
link(edge3, edge19, 37, 169).
link(edge21, edge3, 33, 154).
link(edge3, edge21, 33, 154).
link(edge23, edge3, 19, 123).
link(edge3, edge23, 19, 123).
link(edge29, edge3, 27, 114).
link(edge3, edge29, 27, 114).
link(edge33, edge3, 30, 130).
link(edge3, edge33, 30, 130).
link(edge37, edge3, 25, 197).
link(edge3, edge37, 25, 197).
link(cloud12, edge3, 74, 230).
link(edge3, cloud12, 74, 230).
link(edge3, edge6, 23, 159).
link(edge6, edge3, 23, 159).
link(edge3, edge10, 22, 150).
link(edge10, edge3, 22, 150).
link(edge3, cloud2, 75, 235).
link(cloud2, edge3, 75, 235).
link(edge3, cloud3, 65, 215).
link(cloud3, edge3, 65, 215).
link(edge3, edge18, 24, 185).
link(edge18, edge3, 24, 185).
link(edge3, edge20, 31, 120).
link(edge20, edge3, 31, 120).
link(edge3, edge22, 33, 189).
link(edge22, edge3, 33, 189).
link(edge3, edge25, 34, 151).
link(edge25, edge3, 34, 151).
link(edge3, edge26, 38, 156).
link(edge26, edge3, 38, 156).
link(edge3, cloud7, 70, 230).
link(cloud7, edge3, 70, 230).
link(edge3, edge32, 37, 189).
link(edge32, edge3, 37, 189).
link(edge3, edge35, 38, 118).
link(edge35, edge3, 38, 118).
link(edge4, edge6, 10, 159).
link(edge6, edge4, 10, 159).
link(edge4, edge7, 27, 115).
link(edge7, edge4, 27, 115).
link(edge4, edge8, 24, 186).
link(edge8, edge4, 24, 186).
link(edge4, edge9, 20, 154).
link(edge9, edge4, 20, 154).
link(edge4, cloud2, 62, 289).
link(cloud2, edge4, 62, 289).
link(edge4, edge12, 20, 137).
link(edge12, edge4, 20, 137).
link(edge4, edge18, 35, 152).
link(edge18, edge4, 35, 152).
link(edge4, edge19, 26, 136).
link(edge19, edge4, 26, 136).
link(edge4, edge21, 33, 175).
link(edge21, edge4, 33, 175).
link(edge4, edge22, 24, 162).
link(edge22, edge4, 24, 162).
link(edge4, edge23, 14, 111).
link(edge23, edge4, 14, 111).
link(edge4, edge24, 26, 177).
link(edge24, edge4, 26, 177).
link(edge4, edge25, 26, 122).
link(edge25, edge4, 26, 122).
link(edge4, edge26, 11, 199).
link(edge26, edge4, 11, 199).
link(edge4, cloud8, 59, 234).
link(cloud8, edge4, 59, 234).
link(edge4, edge29, 14, 165).
link(edge29, edge4, 14, 165).
link(edge4, edge34, 37, 122).
link(edge34, edge4, 37, 122).
link(edge4, edge35, 14, 185).
link(edge35, edge4, 14, 185).
link(edge4, edge38, 38, 198).
link(edge38, edge4, 38, 198).
link(cloud1, edge4, 67, 267).
link(edge4, cloud1, 67, 267).
link(edge5, edge4, 27, 145).
link(edge4, edge5, 27, 145).
link(edge10, edge4, 15, 125).
link(edge4, edge10, 15, 125).
link(edge13, edge4, 29, 188).
link(edge4, edge13, 29, 188).
link(cloud3, edge4, 64, 291).
link(edge4, cloud3, 64, 291).
link(cloud4, edge4, 68, 203).
link(edge4, cloud4, 68, 203).
link(edge20, edge4, 27, 140).
link(edge4, edge20, 27, 140).
link(cloud5, edge4, 68, 207).
link(edge4, cloud5, 68, 207).
link(cloud6, edge4, 74, 264).
link(edge4, cloud6, 74, 264).
link(edge27, edge4, 19, 194).
link(edge4, edge27, 19, 194).
link(edge32, edge4, 28, 180).
link(edge4, edge32, 28, 180).
link(edge33, edge4, 31, 141).
link(edge4, edge33, 31, 141).
link(cloud10, edge4, 70, 291).
link(edge4, cloud10, 70, 291).
link(cloud11, edge4, 53, 295).
link(edge4, cloud11, 53, 295).
link(edge4, edge11, 33, 193).
link(edge11, edge4, 33, 193).
link(edge4, edge14, 36, 113).
link(edge14, edge4, 36, 113).
link(edge4, edge15, 27, 113).
link(edge15, edge4, 27, 113).
link(edge4, edge16, 38, 119).
link(edge16, edge4, 38, 119).
link(edge4, edge17, 37, 133).
link(edge17, edge4, 37, 133).
link(edge4, edge28, 24, 110).
link(edge28, edge4, 24, 110).
link(edge4, cloud7, 66, 230).
link(cloud7, edge4, 66, 230).
link(edge4, edge30, 28, 129).
link(edge30, edge4, 28, 129).
link(edge4, edge31, 22, 106).
link(edge31, edge4, 22, 106).
link(edge4, cloud9, 59, 230).
link(cloud9, edge4, 59, 230).
link(edge4, edge36, 37, 193).
link(edge36, edge4, 37, 193).
link(edge4, edge37, 30, 123).
link(edge37, edge4, 30, 123).
link(edge4, cloud12, 72, 268).
link(cloud12, edge4, 72, 268).
link(cloud1, edge6, 62, 242).
link(edge6, cloud1, 62, 242).
link(cloud1, edge8, 65, 254).
link(edge8, cloud1, 65, 254).
link(cloud1, edge11, 70, 297).
link(edge11, cloud1, 70, 297).
link(cloud1, edge12, 72, 220).
link(edge12, cloud1, 72, 220).
link(cloud1, edge14, 70, 254).
link(edge14, cloud1, 70, 254).
link(cloud1, edge15, 69, 280).
link(edge15, cloud1, 69, 280).
link(cloud1, edge17, 64, 292).
link(edge17, cloud1, 64, 292).
link(cloud1, edge18, 59, 237).
link(edge18, cloud1, 59, 237).
link(cloud1, edge20, 56, 211).
link(edge20, cloud1, 56, 211).
link(cloud1, cloud5, 7, 971).
link(cloud5, cloud1, 7, 971).
link(cloud1, edge23, 68, 251).
link(edge23, cloud1, 68, 251).
link(cloud1, edge25, 69, 269).
link(edge25, cloud1, 69, 269).
link(cloud1, edge30, 73, 272).
link(edge30, cloud1, 73, 272).
link(cloud1, cloud9, 8, 596).
link(cloud9, cloud1, 8, 596).
link(cloud1, edge32, 74, 212).
link(edge32, cloud1, 74, 212).
link(cloud1, cloud10, 19, 809).
link(cloud10, cloud1, 19, 809).
link(cloud1, edge36, 70, 220).
link(edge36, cloud1, 70, 220).
link(cloud1, cloud11, 14, 670).
link(cloud11, cloud1, 14, 670).
link(cloud1, cloud12, 20, 730).
link(cloud12, cloud1, 20, 730).
link(cloud1, edge38, 81, 299).
link(edge38, cloud1, 81, 299).
link(edge5, cloud1, 74, 299).
link(cloud1, edge5, 74, 299).
link(edge7, cloud1, 67, 200).
link(cloud1, edge7, 67, 200).
link(cloud2, cloud1, 10, 892).
link(cloud1, cloud2, 10, 892).
link(cloud3, cloud1, 15, 598).
link(cloud1, cloud3, 15, 598).
link(cloud4, cloud1, 18, 470).
link(cloud1, cloud4, 18, 470).
link(edge24, cloud1, 77, 206).
link(cloud1, edge24, 77, 206).
link(edge26, cloud1, 78, 259).
link(cloud1, edge26, 78, 259).
link(cloud7, cloud1, 15, 823).
link(cloud1, cloud7, 15, 823).
link(edge29, cloud1, 67, 288).
link(cloud1, edge29, 67, 288).
link(edge31, cloud1, 69, 239).
link(cloud1, edge31, 69, 239).
link(edge33, cloud1, 60, 270).
link(cloud1, edge33, 60, 270).
link(edge34, cloud1, 68, 225).
link(cloud1, edge34, 68, 225).
link(cloud1, edge9, 58, 210).
link(edge9, cloud1, 58, 210).
link(cloud1, edge10, 68, 246).
link(edge10, cloud1, 68, 246).
link(cloud1, edge13, 67, 243).
link(edge13, cloud1, 67, 243).
link(cloud1, edge16, 65, 205).
link(edge16, cloud1, 65, 205).
link(cloud1, edge19, 78, 201).
link(edge19, cloud1, 78, 201).
link(cloud1, edge21, 71, 225).
link(edge21, cloud1, 71, 225).
link(cloud1, edge22, 64, 226).
link(edge22, cloud1, 64, 226).
link(cloud1, cloud6, 17, 575).
link(cloud6, cloud1, 17, 575).
link(cloud1, edge27, 73, 214).
link(edge27, cloud1, 73, 214).
link(cloud1, edge28, 69, 289).
link(edge28, cloud1, 69, 289).
link(cloud1, cloud8, 16, 590).
link(cloud8, cloud1, 16, 590).
link(cloud1, edge35, 68, 209).
link(edge35, cloud1, 68, 209).
link(cloud1, edge37, 63, 205).
link(edge37, cloud1, 63, 205).
link(edge5, edge8, 15, 174).
link(edge8, edge5, 15, 174).
link(edge5, edge13, 12, 145).
link(edge13, edge5, 12, 145).
link(edge5, edge14, 29, 102).
link(edge14, edge5, 29, 102).
link(edge5, cloud3, 64, 287).
link(cloud3, edge5, 64, 287).
link(edge5, edge15, 22, 161).
link(edge15, edge5, 22, 161).
link(edge5, edge16, 24, 148).
link(edge16, edge5, 24, 148).
link(edge5, edge18, 32, 161).
link(edge18, edge5, 32, 161).
link(edge5, edge19, 36, 106).
link(edge19, edge5, 36, 106).
link(edge5, edge22, 33, 162).
link(edge22, edge5, 33, 162).
link(edge5, cloud6, 59, 270).
link(cloud6, edge5, 59, 270).
link(edge5, cloud7, 61, 285).
link(cloud7, edge5, 61, 285).
link(edge5, edge29, 36, 107).
link(edge29, edge5, 36, 107).
link(edge5, edge34, 21, 196).
link(edge34, edge5, 21, 196).
link(edge5, edge35, 27, 198).
link(edge35, edge5, 27, 198).
link(edge5, cloud11, 74, 232).
link(cloud11, edge5, 74, 232).
link(edge5, cloud12, 65, 232).
link(cloud12, edge5, 65, 232).
link(edge9, edge5, 24, 131).
link(edge5, edge9, 24, 131).
link(edge10, edge5, 12, 195).
link(edge5, edge10, 12, 195).
link(edge12, edge5, 36, 122).
link(edge5, edge12, 36, 122).
link(edge17, edge5, 10, 107).
link(edge5, edge17, 10, 107).
link(edge24, edge5, 11, 151).
link(edge5, edge24, 11, 151).
link(edge25, edge5, 13, 169).
link(edge5, edge25, 13, 169).
link(edge28, edge5, 15, 137).
link(edge5, edge28, 15, 137).
link(edge30, edge5, 13, 190).
link(edge5, edge30, 13, 190).
link(cloud9, edge5, 71, 207).
link(edge5, cloud9, 71, 207).
link(cloud10, edge5, 57, 264).
link(edge5, cloud10, 57, 264).
link(edge38, edge5, 25, 131).
link(edge5, edge38, 25, 131).
link(edge5, edge6, 29, 192).
link(edge6, edge5, 29, 192).
link(edge5, edge7, 27, 119).
link(edge7, edge5, 27, 119).
link(edge5, cloud2, 66, 279).
link(cloud2, edge5, 66, 279).
link(edge5, edge11, 29, 104).
link(edge11, edge5, 29, 104).
link(edge5, cloud4, 70, 277).
link(cloud4, edge5, 70, 277).
link(edge5, edge20, 24, 135).
link(edge20, edge5, 24, 135).
link(edge5, cloud5, 69, 235).
link(cloud5, edge5, 69, 235).
link(edge5, edge21, 26, 121).
link(edge21, edge5, 26, 121).
link(edge5, edge23, 25, 194).
link(edge23, edge5, 25, 194).
link(edge5, edge26, 28, 196).
link(edge26, edge5, 28, 196).
link(edge5, edge27, 28, 195).
link(edge27, edge5, 28, 195).
link(edge5, cloud8, 68, 255).
link(cloud8, edge5, 68, 255).
link(edge5, edge31, 32, 186).
link(edge31, edge5, 32, 186).
link(edge5, edge32, 30, 153).
link(edge32, edge5, 30, 153).
link(edge5, edge33, 25, 168).
link(edge33, edge5, 25, 168).
link(edge5, edge36, 28, 182).
link(edge36, edge5, 28, 182).
link(edge5, edge37, 36, 142).
link(edge37, edge5, 36, 142).
link(edge6, edge7, 17, 106).
link(edge7, edge6, 17, 106).
link(edge6, edge8, 14, 130).
link(edge8, edge6, 14, 130).
link(edge6, edge9, 30, 155).
link(edge9, edge6, 30, 155).
link(edge6, edge10, 25, 128).
link(edge10, edge6, 25, 128).
link(edge6, cloud2, 52, 230).
link(cloud2, edge6, 52, 230).
link(edge6, edge12, 30, 117).
link(edge12, edge6, 30, 117).
link(edge6, cloud4, 67, 260).
link(cloud4, edge6, 67, 260).
link(edge6, edge17, 38, 149).
link(edge17, edge6, 38, 149).
link(edge6, edge18, 25, 151).
link(edge18, edge6, 25, 151).
link(edge6, edge19, 36, 176).
link(edge19, edge6, 36, 176).
link(edge6, edge20, 24, 107).
link(edge20, edge6, 24, 107).
link(edge6, edge22, 32, 137).
link(edge22, edge6, 32, 137).
link(edge6, cloud6, 70, 220).
link(cloud6, edge6, 70, 220).
link(edge6, edge25, 36, 108).
link(edge25, edge6, 36, 108).
link(edge6, edge26, 21, 120).
link(edge26, edge6, 21, 120).
link(edge6, edge27, 20, 137).
link(edge27, edge6, 20, 137).
link(edge6, edge31, 12, 133).
link(edge31, edge6, 12, 133).
link(edge6, cloud9, 63, 286).
link(cloud9, edge6, 63, 286).
link(edge6, edge32, 24, 183).
link(edge32, edge6, 24, 183).
link(edge6, edge33, 40, 128).
link(edge33, edge6, 40, 128).
link(edge6, edge34, 35, 196).
link(edge34, edge6, 35, 196).
link(edge6, edge36, 27, 194).
link(edge36, edge6, 27, 194).
link(edge6, cloud11, 57, 265).
link(cloud11, edge6, 57, 265).
link(edge6, edge38, 35, 102).
link(edge38, edge6, 35, 102).
link(edge11, edge6, 34, 196).
link(edge6, edge11, 34, 196).
link(edge14, edge6, 38, 132).
link(edge6, edge14, 38, 132).
link(cloud3, edge6, 64, 213).
link(edge6, cloud3, 64, 213).
link(edge16, edge6, 28, 115).
link(edge6, edge16, 28, 115).
link(cloud5, edge6, 68, 254).
link(edge6, cloud5, 68, 254).
link(edge23, edge6, 24, 169).
link(edge6, edge23, 24, 169).
link(edge24, edge6, 29, 125).
link(edge6, edge24, 29, 125).
link(edge28, edge6, 34, 173).
link(edge6, edge28, 34, 173).
link(cloud8, edge6, 59, 216).
link(edge6, cloud8, 59, 216).
link(edge29, edge6, 24, 108).
link(edge6, edge29, 24, 108).
link(cloud10, edge6, 65, 275).
link(edge6, cloud10, 65, 275).
link(edge6, edge13, 28, 183).
link(edge13, edge6, 28, 183).
link(edge6, edge15, 37, 110).
link(edge15, edge6, 37, 110).
link(edge6, edge21, 25, 139).
link(edge21, edge6, 25, 139).
link(edge6, cloud7, 57, 294).
link(cloud7, edge6, 57, 294).
link(edge6, edge30, 38, 105).
link(edge30, edge6, 38, 105).
link(edge6, edge35, 24, 178).
link(edge35, edge6, 24, 178).
link(edge6, edge37, 40, 155).
link(edge37, edge6, 40, 155).
link(edge6, cloud12, 64, 268).
link(cloud12, edge6, 64, 268).
link(edge7, edge10, 26, 124).
link(edge10, edge7, 26, 124).
link(edge7, cloud2, 66, 211).
link(cloud2, edge7, 66, 211).
link(edge7, edge11, 25, 115).
link(edge11, edge7, 25, 115).
link(edge7, edge12, 25, 124).
link(edge12, edge7, 25, 124).
link(edge7, edge13, 15, 181).
link(edge13, edge7, 15, 181).
link(edge7, cloud3, 64, 242).
link(cloud3, edge7, 64, 242).
link(edge7, edge15, 28, 137).
link(edge15, edge7, 28, 137).
link(edge7, edge16, 24, 165).
link(edge16, edge7, 24, 165).
link(edge7, cloud4, 50, 221).
link(cloud4, edge7, 50, 221).
link(edge7, edge18, 27, 144).
link(edge18, edge7, 27, 144).
link(edge7, edge19, 32, 163).
link(edge19, edge7, 32, 163).
link(edge7, edge20, 14, 134).
link(edge20, edge7, 14, 134).
link(edge7, edge21, 25, 137).
link(edge21, edge7, 25, 137).
link(edge7, edge22, 16, 159).
link(edge22, edge7, 16, 159).
link(edge7, cloud6, 61, 266).
link(cloud6, edge7, 61, 266).
link(edge7, edge28, 21, 174).
link(edge28, edge7, 21, 174).
link(edge7, cloud7, 63, 292).
link(cloud7, edge7, 63, 292).
link(edge7, cloud8, 59, 225).
link(cloud8, edge7, 59, 225).
link(edge7, edge30, 32, 134).
link(edge30, edge7, 32, 134).
link(edge7, edge31, 29, 198).
link(edge31, edge7, 29, 198).
link(edge7, edge32, 26, 125).
link(edge32, edge7, 26, 125).
link(edge7, edge35, 28, 138).
link(edge35, edge7, 28, 138).
link(edge7, edge36, 27, 158).
link(edge36, edge7, 27, 158).
link(edge7, cloud11, 65, 247).
link(cloud11, edge7, 65, 247).
link(edge7, edge38, 31, 169).
link(edge38, edge7, 31, 169).
link(edge8, edge7, 14, 122).
link(edge7, edge8, 14, 122).
link(cloud5, edge7, 60, 273).
link(edge7, cloud5, 60, 273).
link(edge24, edge7, 29, 154).
link(edge7, edge24, 29, 154).
link(edge27, edge7, 16, 155).
link(edge7, edge27, 16, 155).
link(edge29, edge7, 30, 170).
link(edge7, edge29, 30, 170).
link(cloud9, edge7, 61, 226).
link(edge7, cloud9, 61, 226).
link(edge33, edge7, 31, 173).
link(edge7, edge33, 31, 173).
link(edge34, edge7, 18, 193).
link(edge7, edge34, 18, 193).
link(edge37, edge7, 35, 137).
link(edge7, edge37, 35, 137).
link(cloud12, edge7, 55, 245).
link(edge7, cloud12, 55, 245).
link(edge7, edge9, 27, 113).
link(edge9, edge7, 27, 113).
link(edge7, edge14, 28, 121).
link(edge14, edge7, 28, 121).
link(edge7, edge17, 28, 124).
link(edge17, edge7, 28, 124).
link(edge7, edge23, 31, 149).
link(edge23, edge7, 31, 149).
link(edge7, edge25, 27, 194).
link(edge25, edge7, 27, 194).
link(edge7, edge26, 36, 109).
link(edge26, edge7, 36, 109).
link(edge7, cloud10, 68, 225).
link(cloud10, edge7, 68, 225).
link(edge8, edge9, 24, 113).
link(edge9, edge8, 24, 113).
link(edge8, cloud2, 66, 242).
link(cloud2, edge8, 66, 242).
link(edge8, edge11, 20, 187).
link(edge11, edge8, 20, 187).
link(edge8, edge12, 29, 144).
link(edge12, edge8, 29, 144).
link(edge8, edge13, 14, 173).
link(edge13, edge8, 14, 173).
link(edge8, edge15, 29, 164).
link(edge15, edge8, 29, 164).
link(edge8, edge16, 22, 163).
link(edge16, edge8, 22, 163).
link(edge8, edge19, 40, 194).
link(edge19, edge8, 40, 194).
link(edge8, cloud5, 72, 236).
link(cloud5, edge8, 72, 236).
link(edge8, edge22, 18, 180).
link(edge22, edge8, 18, 180).
link(edge8, cloud6, 74, 257).
link(cloud6, edge8, 74, 257).
link(edge8, edge24, 15, 176).
link(edge24, edge8, 15, 176).
link(edge8, edge26, 35, 125).
link(edge26, edge8, 35, 125).
link(edge8, edge27, 13, 122).
link(edge27, edge8, 13, 122).
link(edge8, edge28, 27, 169).
link(edge28, edge8, 27, 169).
link(edge8, cloud7, 65, 246).
link(cloud7, edge8, 65, 246).
link(edge8, edge29, 26, 170).
link(edge29, edge8, 26, 170).
link(edge8, edge31, 17, 186).
link(edge31, edge8, 17, 186).
link(edge8, edge33, 30, 166).
link(edge33, edge8, 30, 166).
link(edge8, edge34, 21, 174).
link(edge34, edge8, 21, 174).
link(edge8, edge35, 14, 147).
link(edge35, edge8, 14, 147).
link(edge8, edge36, 13, 110).
link(edge36, edge8, 13, 110).
link(edge8, edge37, 26, 198).
link(edge37, edge8, 26, 198).
link(edge8, cloud12, 69, 254).
link(cloud12, edge8, 69, 254).
link(edge10, edge8, 26, 170).
link(edge8, edge10, 26, 170).
link(cloud3, edge8, 66, 299).
link(edge8, cloud3, 66, 299).
link(cloud4, edge8, 64, 231).
link(edge8, cloud4, 64, 231).
link(edge20, edge8, 18, 124).
link(edge8, edge20, 18, 124).
link(edge21, edge8, 11, 125).
link(edge8, edge21, 11, 125).
link(edge32, edge8, 23, 100).
link(edge8, edge32, 23, 100).
link(cloud10, edge8, 72, 208).
link(edge8, cloud10, 72, 208).
link(edge8, edge14, 30, 183).
link(edge14, edge8, 30, 183).
link(edge8, edge17, 25, 190).
link(edge17, edge8, 25, 190).
link(edge8, edge18, 27, 162).
link(edge18, edge8, 27, 162).
link(edge8, edge23, 30, 116).
link(edge23, edge8, 30, 116).
link(edge8, edge25, 28, 190).
link(edge25, edge8, 28, 190).
link(edge8, cloud8, 71, 261).
link(cloud8, edge8, 71, 261).
link(edge8, edge30, 28, 135).
link(edge30, edge8, 28, 135).
link(edge8, cloud9, 65, 212).
link(cloud9, edge8, 65, 212).
link(edge8, cloud11, 71, 275).
link(cloud11, edge8, 71, 275).
link(edge8, edge38, 36, 164).
link(edge38, edge8, 36, 164).
link(edge9, edge13, 12, 145).
link(edge13, edge9, 12, 145).
link(edge9, edge16, 26, 140).
link(edge16, edge9, 26, 140).
link(edge9, cloud4, 51, 210).
link(cloud4, edge9, 51, 210).
link(edge9, edge17, 28, 105).
link(edge17, edge9, 28, 105).
link(edge9, edge20, 33, 180).
link(edge20, edge9, 33, 180).
link(edge9, edge21, 13, 115).
link(edge21, edge9, 13, 115).
link(edge9, edge23, 34, 106).
link(edge23, edge9, 34, 106).
link(edge9, edge26, 31, 137).
link(edge26, edge9, 31, 137).
link(edge9, cloud7, 60, 212).
link(cloud7, edge9, 60, 212).
link(edge9, edge29, 30, 150).
link(edge29, edge9, 30, 150).
link(edge9, edge33, 30, 150).
link(edge33, edge9, 30, 150).
link(edge9, edge35, 34, 117).
link(edge35, edge9, 34, 117).
link(edge9, edge36, 32, 156).
link(edge36, edge9, 32, 156).
link(edge9, edge38, 32, 166).
link(edge38, edge9, 32, 166).
link(edge10, edge9, 21, 130).
link(edge9, edge10, 21, 130).
link(cloud2, edge9, 60, 221).
link(edge9, cloud2, 60, 221).
link(edge11, edge9, 32, 156).
link(edge9, edge11, 32, 156).
link(edge12, edge9, 28, 156).
link(edge9, edge12, 28, 156).
link(edge14, edge9, 30, 148).
link(edge9, edge14, 30, 148).
link(edge15, edge9, 33, 167).
link(edge9, edge15, 33, 167).
link(edge18, edge9, 32, 153).
link(edge9, edge18, 32, 153).
link(edge19, edge9, 20, 131).
link(edge9, edge19, 20, 131).
link(cloud5, edge9, 62, 247).
link(edge9, cloud5, 62, 247).
link(edge24, edge9, 32, 129).
link(edge9, edge24, 32, 129).
link(edge27, edge9, 34, 143).
link(edge9, edge27, 34, 143).
link(cloud8, edge9, 53, 244).
link(edge9, cloud8, 53, 244).
link(edge30, edge9, 27, 195).
link(edge9, edge30, 27, 195).
link(cloud9, edge9, 50, 232).
link(edge9, cloud9, 50, 232).
link(edge34, edge9, 17, 139).
link(edge9, edge34, 17, 139).
link(edge9, cloud3, 57, 260).
link(cloud3, edge9, 57, 260).
link(edge9, edge22, 40, 151).
link(edge22, edge9, 40, 151).
link(edge9, cloud6, 62, 295).
link(cloud6, edge9, 62, 295).
link(edge9, edge25, 34, 154).
link(edge25, edge9, 34, 154).
link(edge9, edge28, 37, 197).
link(edge28, edge9, 37, 197).
link(edge9, edge31, 35, 174).
link(edge31, edge9, 35, 174).
link(edge9, edge32, 37, 145).
link(edge32, edge9, 37, 145).
link(edge9, cloud10, 69, 231).
link(cloud10, edge9, 69, 231).
link(edge9, edge37, 28, 152).
link(edge37, edge9, 28, 152).
link(edge9, cloud11, 56, 227).
link(cloud11, edge9, 56, 227).
link(edge9, cloud12, 56, 231).
link(cloud12, edge9, 56, 231).
link(edge10, edge11, 18, 122).
link(edge11, edge10, 18, 122).
link(edge10, edge12, 28, 190).
link(edge12, edge10, 28, 190).
link(edge10, edge14, 26, 107).
link(edge14, edge10, 26, 107).
link(edge10, edge16, 30, 114).
link(edge16, edge10, 30, 114).
link(edge10, cloud4, 62, 242).
link(cloud4, edge10, 62, 242).
link(edge10, edge18, 32, 183).
link(edge18, edge10, 32, 183).
link(edge10, edge19, 24, 142).
link(edge19, edge10, 24, 142).
link(edge10, edge20, 12, 115).
link(edge20, edge10, 12, 115).
link(edge10, cloud5, 71, 263).
link(cloud5, edge10, 71, 263).
link(edge10, edge21, 32, 124).
link(edge21, edge10, 32, 124).
link(edge10, edge22, 24, 179).
link(edge22, edge10, 24, 179).
link(edge10, cloud6, 63, 293).
link(cloud6, edge10, 63, 293).
link(edge10, edge23, 25, 113).
link(edge23, edge10, 25, 113).
link(edge10, edge25, 16, 177).
link(edge25, edge10, 16, 177).
link(edge10, edge26, 26, 174).
link(edge26, edge10, 26, 174).
link(edge10, edge28, 20, 155).
link(edge28, edge10, 20, 155).
link(edge10, edge29, 28, 190).
link(edge29, edge10, 28, 190).
link(edge10, edge31, 32, 166).
link(edge31, edge10, 32, 166).
link(edge10, edge33, 25, 171).
link(edge33, edge10, 25, 171).
link(edge10, edge34, 33, 142).
link(edge34, edge10, 33, 142).
link(edge10, edge35, 16, 123).
link(edge35, edge10, 16, 123).
link(edge10, edge37, 38, 115).
link(edge37, edge10, 38, 115).
link(edge10, cloud11, 68, 260).
link(cloud11, edge10, 68, 260).
link(cloud2, edge10, 64, 261).
link(edge10, cloud2, 64, 261).
link(edge13, edge10, 24, 112).
link(edge10, edge13, 24, 112).
link(edge15, edge10, 12, 108).
link(edge10, edge15, 12, 108).
link(edge24, edge10, 11, 131).
link(edge10, edge24, 11, 131).
link(edge27, edge10, 34, 180).
link(edge10, edge27, 34, 180).
link(cloud7, edge10, 66, 225).
link(edge10, cloud7, 66, 225).
link(cloud9, edge10, 65, 284).
link(edge10, cloud9, 65, 284).
link(edge36, edge10, 34, 131).
link(edge10, edge36, 34, 131).
link(cloud12, edge10, 57, 266).
link(edge10, cloud12, 57, 266).
link(edge38, edge10, 36, 127).
link(edge10, edge38, 36, 127).
link(edge10, cloud3, 72, 230).
link(cloud3, edge10, 72, 230).
link(edge10, edge17, 22, 117).
link(edge17, edge10, 22, 117).
link(edge10, cloud8, 71, 293).
link(cloud8, edge10, 71, 293).
link(edge10, edge30, 25, 175).
link(edge30, edge10, 25, 175).
link(edge10, edge32, 34, 173).
link(edge32, edge10, 34, 173).
link(edge10, cloud10, 64, 204).
link(cloud10, edge10, 64, 204).
link(cloud2, edge11, 60, 282).
link(edge11, cloud2, 60, 282).
link(cloud2, edge12, 73, 273).
link(edge12, cloud2, 73, 273).
link(cloud2, cloud3, 12, 819).
link(cloud3, cloud2, 12, 819).
link(cloud2, cloud4, 16, 970).
link(cloud4, cloud2, 16, 970).
link(cloud2, edge20, 59, 292).
link(edge20, cloud2, 59, 292).
link(cloud2, cloud5, 16, 955).
link(cloud5, cloud2, 16, 955).
link(cloud2, edge22, 73, 202).
link(edge22, cloud2, 73, 202).
link(cloud2, edge23, 58, 226).
link(edge23, cloud2, 58, 226).
link(cloud2, edge26, 73, 262).
link(edge26, cloud2, 73, 262).
link(cloud2, cloud7, 5, 651).
link(cloud7, cloud2, 5, 651).
link(cloud2, edge31, 64, 270).
link(edge31, cloud2, 64, 270).
link(cloud2, edge32, 69, 234).
link(edge32, cloud2, 69, 234).
link(cloud2, edge33, 50, 238).
link(edge33, cloud2, 50, 238).
link(cloud2, edge34, 59, 276).
link(edge34, cloud2, 59, 276).
link(cloud2, cloud10, 13, 908).
link(cloud10, cloud2, 13, 908).
link(cloud2, edge35, 63, 297).
link(edge35, cloud2, 63, 297).
link(cloud2, edge37, 63, 227).
link(edge37, cloud2, 63, 227).
link(cloud2, cloud11, 13, 351).
link(cloud11, cloud2, 13, 351).
link(cloud2, edge38, 73, 223).
link(edge38, cloud2, 73, 223).
link(edge14, cloud2, 64, 247).
link(cloud2, edge14, 64, 247).
link(edge15, cloud2, 63, 243).
link(cloud2, edge15, 63, 243).
link(edge19, cloud2, 74, 271).
link(cloud2, edge19, 74, 271).
link(cloud6, cloud2, 18, 578).
link(cloud2, cloud6, 18, 578).
link(edge24, cloud2, 67, 286).
link(cloud2, edge24, 67, 286).
link(edge25, cloud2, 72, 245).
link(cloud2, edge25, 72, 245).
link(edge28, cloud2, 59, 261).
link(cloud2, edge28, 59, 261).
link(cloud8, cloud2, 7, 445).
link(cloud2, cloud8, 7, 445).
link(edge30, cloud2, 67, 207).
link(cloud2, edge30, 67, 207).
link(cloud9, cloud2, 11, 432).
link(cloud2, cloud9, 11, 432).
link(cloud12, cloud2, 12, 703).
link(cloud2, cloud12, 12, 703).
link(cloud2, edge13, 64, 291).
link(edge13, cloud2, 64, 291).
link(cloud2, edge16, 70, 209).
link(edge16, cloud2, 70, 209).
link(cloud2, edge17, 56, 252).
link(edge17, cloud2, 56, 252).
link(cloud2, edge18, 69, 275).
link(edge18, cloud2, 69, 275).
link(cloud2, edge21, 73, 243).
link(edge21, cloud2, 73, 243).
link(cloud2, edge27, 63, 212).
link(edge27, cloud2, 63, 212).
link(cloud2, edge29, 57, 246).
link(edge29, cloud2, 57, 246).
link(cloud2, edge36, 74, 251).
link(edge36, cloud2, 74, 251).
link(edge11, edge13, 34, 115).
link(edge13, edge11, 34, 115).
link(edge11, edge15, 20, 115).
link(edge15, edge11, 20, 115).
link(edge11, edge16, 33, 159).
link(edge16, edge11, 33, 159).
link(edge11, cloud4, 70, 219).
link(cloud4, edge11, 70, 219).
link(edge11, edge23, 29, 161).
link(edge23, edge11, 29, 161).
link(edge11, edge25, 16, 124).
link(edge25, edge11, 16, 124).
link(edge11, edge28, 19, 180).
link(edge28, edge11, 19, 180).
link(edge11, cloud7, 65, 244).
link(cloud7, edge11, 65, 244).
link(edge11, cloud8, 61, 223).
link(cloud8, edge11, 61, 223).
link(edge11, edge29, 27, 153).
link(edge29, edge11, 27, 153).
link(edge11, edge31, 37, 186).
link(edge31, edge11, 37, 186).
link(edge11, edge32, 30, 132).
link(edge32, edge11, 30, 132).
link(edge11, edge33, 10, 156).
link(edge33, edge11, 10, 156).
link(edge11, cloud10, 71, 295).
link(cloud10, edge11, 71, 295).
link(edge11, edge35, 34, 100).
link(edge35, edge11, 34, 100).
link(edge11, cloud11, 67, 255).
link(cloud11, edge11, 67, 255).
link(edge11, cloud12, 72, 269).
link(cloud12, edge11, 72, 269).
link(edge20, edge11, 29, 177).
link(edge11, edge20, 29, 177).
link(edge21, edge11, 30, 195).
link(edge11, edge21, 30, 195).
link(edge27, edge11, 30, 103).
link(edge11, edge27, 30, 103).
link(edge30, edge11, 33, 147).
link(edge11, edge30, 33, 147).
link(edge37, edge11, 23, 106).
link(edge11, edge37, 23, 106).
link(edge38, edge11, 21, 163).
link(edge11, edge38, 21, 163).
link(edge11, edge12, 33, 147).
link(edge12, edge11, 33, 147).
link(edge11, edge14, 24, 155).
link(edge14, edge11, 24, 155).
link(edge11, cloud3, 66, 262).
link(cloud3, edge11, 66, 262).
link(edge11, edge17, 34, 130).
link(edge17, edge11, 34, 130).
link(edge11, edge18, 42, 192).
link(edge18, edge11, 42, 192).
link(edge11, edge19, 33, 164).
link(edge19, edge11, 33, 164).
link(edge11, cloud5, 70, 211).
link(cloud5, edge11, 70, 211).
link(edge11, edge22, 32, 151).
link(edge22, edge11, 32, 151).
link(edge11, cloud6, 78, 284).
link(cloud6, edge11, 78, 284).
link(edge11, edge24, 29, 161).
link(edge24, edge11, 29, 161).
link(edge11, edge26, 31, 127).
link(edge26, edge11, 31, 127).
link(edge11, cloud9, 71, 222).
link(cloud9, edge11, 71, 222).
link(edge11, edge34, 23, 139).
link(edge34, edge11, 23, 139).
link(edge11, edge36, 33, 170).
link(edge36, edge11, 33, 170).
link(edge12, edge13, 38, 150).
link(edge13, edge12, 38, 150).
link(edge12, edge14, 23, 141).
link(edge14, edge12, 23, 141).
link(edge12, edge15, 36, 164).
link(edge15, edge12, 36, 164).
link(edge12, edge16, 32, 195).
link(edge16, edge12, 32, 195).
link(edge12, cloud4, 74, 283).
link(cloud4, edge12, 74, 283).
link(edge12, cloud6, 72, 279).
link(cloud6, edge12, 72, 279).
link(edge12, edge23, 33, 194).
link(edge23, edge12, 33, 194).
link(edge12, edge24, 26, 168).
link(edge24, edge12, 26, 168).
link(edge12, edge25, 25, 115).
link(edge25, edge12, 25, 115).
link(edge12, edge27, 16, 159).
link(edge27, edge12, 16, 159).
link(edge12, cloud7, 70, 288).
link(cloud7, edge12, 70, 288).
link(edge12, edge31, 26, 141).
link(edge31, edge12, 26, 141).
link(edge12, cloud9, 78, 206).
link(cloud9, edge12, 78, 206).
link(edge12, edge33, 23, 142).
link(edge33, edge12, 23, 142).
link(edge12, edge34, 32, 158).
link(edge34, edge12, 32, 158).
link(edge12, cloud10, 65, 276).
link(cloud10, edge12, 65, 276).
link(edge12, edge36, 38, 188).
link(edge36, edge12, 38, 188).
link(edge12, edge37, 10, 124).
link(edge37, edge12, 10, 124).
link(edge12, cloud12, 69, 266).
link(cloud12, edge12, 69, 266).
link(edge12, edge38, 39, 191).
link(edge38, edge12, 39, 191).
link(edge20, edge12, 16, 184).
link(edge12, edge20, 16, 184).
link(cloud5, edge12, 66, 204).
link(edge12, cloud5, 66, 204).
link(edge22, edge12, 38, 184).
link(edge12, edge22, 38, 184).
link(edge26, edge12, 23, 193).
link(edge12, edge26, 23, 193).
link(edge28, edge12, 27, 130).
link(edge12, edge28, 27, 130).
link(cloud11, edge12, 73, 255).
link(edge12, cloud11, 73, 255).
link(edge12, cloud3, 77, 254).
link(cloud3, edge12, 77, 254).
link(edge12, edge17, 30, 118).
link(edge17, edge12, 30, 118).
link(edge12, edge18, 30, 120).
link(edge18, edge12, 30, 120).
link(edge12, edge19, 33, 113).
link(edge19, edge12, 33, 113).
link(edge12, edge21, 25, 160).
link(edge21, edge12, 25, 160).
link(edge12, cloud8, 75, 270).
link(cloud8, edge12, 75, 270).
link(edge12, edge29, 26, 165).
link(edge29, edge12, 26, 165).
link(edge12, edge30, 41, 103).
link(edge30, edge12, 41, 103).
link(edge12, edge32, 28, 168).
link(edge32, edge12, 28, 168).
link(edge12, edge35, 34, 108).
link(edge35, edge12, 34, 108).
link(edge13, edge14, 20, 197).
link(edge14, edge13, 20, 197).
link(edge13, edge16, 36, 161).
link(edge16, edge13, 36, 161).
link(edge13, edge17, 22, 174).
link(edge17, edge13, 22, 174).
link(edge13, edge20, 29, 150).
link(edge20, edge13, 29, 150).
link(edge13, edge21, 25, 103).
link(edge21, edge13, 25, 103).
link(edge13, edge22, 28, 188).
link(edge22, edge13, 28, 188).
link(edge13, cloud6, 71, 251).
link(cloud6, edge13, 71, 251).
link(edge13, edge24, 23, 195).
link(edge24, edge13, 23, 195).
link(edge13, edge25, 25, 121).
link(edge25, edge13, 25, 121).
link(edge13, edge28, 25, 141).
link(edge28, edge13, 25, 141).
link(edge13, cloud7, 64, 261).
link(cloud7, edge13, 64, 261).
link(edge13, cloud9, 59, 290).
link(cloud9, edge13, 59, 290).
link(edge13, edge32, 31, 131).
link(edge32, edge13, 31, 131).
link(edge13, edge34, 29, 179).
link(edge34, edge13, 29, 179).
link(edge13, cloud10, 66, 209).
link(cloud10, edge13, 66, 209).
link(edge13, edge35, 28, 126).
link(edge35, edge13, 28, 126).
link(edge13, cloud12, 68, 203).
link(cloud12, edge13, 68, 203).
link(edge13, edge38, 22, 172).
link(edge38, edge13, 22, 172).
link(cloud3, edge13, 52, 254).
link(edge13, cloud3, 52, 254).
link(edge18, edge13, 34, 177).
link(edge13, edge18, 34, 177).
link(edge23, edge13, 25, 138).
link(edge13, edge23, 25, 138).
link(edge26, edge13, 37, 158).
link(edge13, edge26, 37, 158).
link(edge27, edge13, 22, 111).
link(edge13, edge27, 22, 111).
link(cloud8, edge13, 57, 233).
link(edge13, cloud8, 57, 233).
link(edge33, edge13, 27, 104).
link(edge13, edge33, 27, 104).
link(edge13, edge15, 34, 103).
link(edge15, edge13, 34, 103).
link(edge13, cloud4, 63, 249).
link(cloud4, edge13, 63, 249).
link(edge13, edge19, 30, 125).
link(edge19, edge13, 30, 125).
link(edge13, cloud5, 63, 267).
link(cloud5, edge13, 63, 267).
link(edge13, edge29, 36, 196).
link(edge29, edge13, 36, 196).
link(edge13, edge30, 25, 184).
link(edge30, edge13, 25, 184).
link(edge13, edge31, 31, 127).
link(edge31, edge13, 31, 127).
link(edge13, edge36, 27, 112).
link(edge36, edge13, 27, 112).
link(edge13, edge37, 40, 199).
link(edge37, edge13, 40, 199).
link(edge13, cloud11, 63, 238).
link(cloud11, edge13, 63, 238).
link(edge14, cloud3, 70, 240).
link(cloud3, edge14, 70, 240).
link(edge14, edge15, 27, 104).
link(edge15, edge14, 27, 104).
link(edge14, edge18, 31, 113).
link(edge18, edge14, 31, 113).
link(edge14, edge19, 10, 162).
link(edge19, edge14, 10, 162).
link(edge14, edge20, 14, 188).
link(edge20, edge14, 14, 188).
link(edge14, edge21, 34, 116).
link(edge21, edge14, 34, 116).
link(edge14, edge22, 37, 155).
link(edge22, edge14, 37, 155).
link(edge14, cloud6, 63, 210).
link(cloud6, edge14, 63, 210).
link(edge14, edge25, 16, 152).
link(edge25, edge14, 16, 152).
link(edge14, edge29, 31, 149).
link(edge29, edge14, 31, 149).
link(edge14, edge31, 31, 182).
link(edge31, edge14, 31, 182).
link(edge14, cloud9, 73, 226).
link(cloud9, edge14, 73, 226).
link(edge14, edge34, 24, 187).
link(edge34, edge14, 24, 187).
link(edge14, edge37, 27, 144).
link(edge37, edge14, 27, 144).
link(edge14, cloud12, 67, 216).
link(cloud12, edge14, 67, 216).
link(edge17, edge14, 28, 195).
link(edge14, edge17, 28, 195).
link(cloud5, edge14, 73, 229).
link(edge14, cloud5, 73, 229).
link(edge30, edge14, 34, 176).
link(edge14, edge30, 34, 176).
link(edge32, edge14, 29, 191).
link(edge14, edge32, 29, 191).
link(edge33, edge14, 14, 178).
link(edge14, edge33, 14, 178).
link(cloud10, edge14, 56, 229).
link(edge14, cloud10, 56, 229).
link(edge35, edge14, 32, 185).
link(edge14, edge35, 32, 185).
link(cloud11, edge14, 73, 269).
link(edge14, cloud11, 73, 269).
link(edge14, edge16, 30, 179).
link(edge16, edge14, 30, 179).
link(edge14, cloud4, 72, 289).
link(cloud4, edge14, 72, 289).
link(edge14, edge23, 34, 162).
link(edge23, edge14, 34, 162).
link(edge14, edge24, 37, 126).
link(edge24, edge14, 37, 126).
link(edge14, edge26, 31, 191).
link(edge26, edge14, 31, 191).
link(edge14, edge27, 34, 103).
link(edge27, edge14, 34, 103).
link(edge14, edge28, 24, 153).
link(edge28, edge14, 24, 153).
link(edge14, cloud7, 68, 251).
link(cloud7, edge14, 68, 251).
link(edge14, cloud8, 71, 239).
link(cloud8, edge14, 71, 239).
link(edge14, edge36, 39, 103).
link(edge36, edge14, 39, 103).
link(edge14, edge38, 22, 127).
link(edge38, edge14, 22, 127).
link(cloud3, edge15, 65, 285).
link(edge15, cloud3, 65, 285).
link(cloud3, edge18, 67, 229).
link(edge18, cloud3, 67, 229).
link(cloud3, edge22, 68, 226).
link(edge22, cloud3, 68, 226).
link(cloud3, cloud6, 21, 426).
link(cloud6, cloud3, 21, 426).
link(cloud3, cloud7, 12, 594).
link(cloud7, cloud3, 12, 594).
link(cloud3, cloud8, 5, 785).
link(cloud8, cloud3, 5, 785).
link(cloud3, edge29, 60, 275).
link(edge29, cloud3, 60, 275).
link(cloud3, edge30, 68, 279).
link(edge30, cloud3, 68, 279).
link(cloud3, cloud9, 7, 458).
link(cloud9, cloud3, 7, 458).
link(cloud3, edge32, 59, 288).
link(edge32, cloud3, 59, 288).
link(cloud3, edge34, 57, 225).
link(edge34, cloud3, 57, 225).
link(cloud3, edge35, 57, 299).
link(edge35, cloud3, 57, 299).
link(cloud3, edge37, 67, 294).
link(edge37, cloud3, 67, 294).
link(cloud3, cloud12, 19, 909).
link(cloud12, cloud3, 19, 909).
link(cloud3, edge38, 73, 263).
link(edge38, cloud3, 73, 263).
link(cloud4, cloud3, 14, 821).
link(cloud3, cloud4, 14, 821).
link(edge19, cloud3, 77, 262).
link(cloud3, edge19, 77, 262).
link(edge20, cloud3, 66, 275).
link(cloud3, edge20, 66, 275).
link(cloud5, cloud3, 11, 387).
link(cloud3, cloud5, 11, 387).
link(edge23, cloud3, 70, 286).
link(cloud3, edge23, 70, 286).
link(edge31, cloud3, 54, 244).
link(cloud3, edge31, 54, 244).
link(cloud10, cloud3, 14, 989).
link(cloud3, cloud10, 14, 989).
link(cloud11, cloud3, 11, 674).
link(cloud3, cloud11, 11, 674).
link(cloud3, edge16, 70, 234).
link(edge16, cloud3, 70, 234).
link(cloud3, edge17, 63, 269).
link(edge17, cloud3, 63, 269).
link(cloud3, edge21, 70, 282).
link(edge21, cloud3, 70, 282).
link(cloud3, edge24, 74, 207).
link(edge24, cloud3, 74, 207).
link(cloud3, edge25, 75, 246).
link(edge25, cloud3, 75, 246).
link(cloud3, edge26, 75, 261).
link(edge26, cloud3, 75, 261).
link(cloud3, edge27, 70, 226).
link(edge27, cloud3, 70, 226).
link(cloud3, edge28, 66, 276).
link(edge28, cloud3, 66, 276).
link(cloud3, edge33, 62, 207).
link(edge33, cloud3, 62, 207).
link(cloud3, edge36, 69, 295).
link(edge36, cloud3, 69, 295).
link(edge15, cloud4, 51, 285).
link(cloud4, edge15, 51, 285).
link(edge15, edge19, 22, 160).
link(edge19, edge15, 22, 160).
link(edge15, edge20, 23, 155).
link(edge20, edge15, 23, 155).
link(edge15, cloud5, 69, 222).
link(cloud5, edge15, 69, 222).
link(edge15, edge22, 12, 163).
link(edge22, edge15, 12, 163).
link(edge15, edge24, 14, 128).
link(edge24, edge15, 14, 128).
link(edge15, edge25, 28, 140).
link(edge25, edge15, 28, 140).
link(edge15, edge26, 32, 118).
link(edge26, edge15, 32, 118).
link(edge15, edge27, 33, 193).
link(edge27, edge15, 33, 193).
link(edge15, cloud9, 62, 268).
link(cloud9, edge15, 62, 268).
link(edge15, edge32, 22, 128).
link(edge32, edge15, 22, 128).
link(edge15, cloud12, 56, 288).
link(cloud12, edge15, 56, 288).
link(edge16, edge15, 18, 102).
link(edge15, edge16, 18, 102).
link(edge17, edge15, 17, 137).
link(edge15, edge17, 17, 137).
link(edge23, edge15, 28, 130).
link(edge15, edge23, 28, 130).
link(edge29, edge15, 26, 157).
link(edge15, edge29, 26, 157).
link(edge33, edge15, 13, 131).
link(edge15, edge33, 13, 131).
link(edge34, edge15, 23, 132).
link(edge15, edge34, 23, 132).
link(cloud10, edge15, 52, 210).
link(edge15, cloud10, 52, 210).
link(cloud11, edge15, 66, 286).
link(edge15, cloud11, 66, 286).
link(edge38, edge15, 34, 122).
link(edge15, edge38, 34, 122).
link(edge15, edge18, 23, 178).
link(edge18, edge15, 23, 178).
link(edge15, edge21, 40, 127).
link(edge21, edge15, 40, 127).
link(edge15, cloud6, 59, 264).
link(cloud6, edge15, 59, 264).
link(edge15, edge28, 23, 119).
link(edge28, edge15, 23, 119).
link(edge15, cloud7, 64, 280).
link(cloud7, edge15, 64, 280).
link(edge15, cloud8, 60, 238).
link(cloud8, edge15, 60, 238).
link(edge15, edge30, 35, 153).
link(edge30, edge15, 35, 153).
link(edge15, edge31, 34, 138).
link(edge31, edge15, 34, 138).
link(edge15, edge35, 28, 120).
link(edge35, edge15, 28, 120).
link(edge15, edge36, 30, 178).
link(edge36, edge15, 30, 178).
link(edge15, edge37, 26, 166).
link(edge37, edge15, 26, 166).
link(edge16, edge19, 20, 180).
link(edge19, edge16, 20, 180).
link(edge16, edge20, 36, 133).
link(edge20, edge16, 36, 133).
link(edge16, cloud6, 58, 275).
link(cloud6, edge16, 58, 275).
link(edge16, edge23, 36, 167).
link(edge23, edge16, 36, 167).
link(edge16, edge24, 22, 112).
link(edge24, edge16, 22, 112).
link(edge16, edge33, 23, 142).
link(edge33, edge16, 23, 142).
link(edge16, edge34, 27, 108).
link(edge34, edge16, 27, 108).
link(edge16, cloud10, 65, 280).
link(cloud10, edge16, 65, 280).
link(edge16, edge36, 35, 132).
link(edge36, edge16, 35, 132).
link(edge16, cloud11, 69, 209).
link(cloud11, edge16, 69, 209).
link(edge16, cloud12, 64, 289).
link(cloud12, edge16, 64, 289).
link(edge16, edge38, 30, 127).
link(edge38, edge16, 30, 127).
link(edge17, edge16, 34, 107).
link(edge16, edge17, 34, 107).
link(edge28, edge16, 33, 147).
link(edge16, edge28, 33, 147).
link(edge29, edge16, 24, 183).
link(edge16, edge29, 24, 183).
link(edge31, edge16, 16, 173).
link(edge16, edge31, 16, 173).
link(edge16, cloud4, 69, 265).
link(cloud4, edge16, 69, 265).
link(edge16, edge18, 27, 183).
link(edge18, edge16, 27, 183).
link(edge16, cloud5, 68, 272).
link(cloud5, edge16, 68, 272).
link(edge16, edge21, 29, 188).
link(edge21, edge16, 29, 188).
link(edge16, edge22, 30, 127).
link(edge22, edge16, 30, 127).
link(edge16, edge25, 37, 114).
link(edge25, edge16, 37, 114).
link(edge16, edge26, 44, 145).
link(edge26, edge16, 44, 145).
link(edge16, edge27, 30, 168).
link(edge27, edge16, 30, 168).
link(edge16, cloud7, 65, 282).
link(cloud7, edge16, 65, 282).
link(edge16, cloud8, 72, 202).
link(cloud8, edge16, 72, 202).
link(edge16, edge30, 37, 112).
link(edge30, edge16, 37, 112).
link(edge16, cloud9, 65, 206).
link(cloud9, edge16, 65, 206).
link(edge16, edge32, 39, 192).
link(edge32, edge16, 39, 192).
link(edge16, edge35, 36, 194).
link(edge35, edge16, 36, 194).
link(edge16, edge37, 29, 154).
link(edge37, edge16, 29, 154).
link(cloud4, edge21, 64, 226).
link(edge21, cloud4, 64, 226).
link(cloud4, edge22, 63, 243).
link(edge22, cloud4, 63, 243).
link(cloud4, cloud6, 11, 534).
link(cloud6, cloud4, 11, 534).
link(cloud4, edge23, 72, 209).
link(edge23, cloud4, 72, 209).
link(cloud4, edge25, 61, 207).
link(edge25, cloud4, 61, 207).
link(cloud4, edge26, 71, 265).
link(edge26, cloud4, 71, 265).
link(cloud4, cloud8, 9, 417).
link(cloud8, cloud4, 9, 417).
link(cloud4, cloud9, 11, 920).
link(cloud9, cloud4, 11, 920).
link(cloud4, cloud10, 18, 642).
link(cloud10, cloud4, 18, 642).
link(cloud4, edge35, 59, 286).
link(edge35, cloud4, 59, 286).
link(cloud4, edge36, 72, 234).
link(edge36, cloud4, 72, 234).
link(cloud4, edge37, 73, 231).
link(edge37, cloud4, 73, 231).
link(cloud4, cloud12, 5, 630).
link(cloud12, cloud4, 5, 630).
link(cloud4, edge38, 75, 207).
link(edge38, cloud4, 75, 207).
link(edge18, cloud4, 74, 237).
link(cloud4, edge18, 74, 237).
link(edge19, cloud4, 68, 215).
link(cloud4, edge19, 68, 215).
link(edge24, cloud4, 65, 279).
link(cloud4, edge24, 65, 279).
link(edge27, cloud4, 66, 237).
link(cloud4, edge27, 66, 237).
link(edge28, cloud4, 67, 288).
link(cloud4, edge28, 67, 288).
link(cloud7, cloud4, 13, 664).
link(cloud4, cloud7, 13, 664).
link(edge29, cloud4, 64, 200).
link(cloud4, edge29, 64, 200).
link(edge33, cloud4, 64, 289).
link(cloud4, edge33, 64, 289).
link(cloud4, edge17, 64, 241).
link(edge17, cloud4, 64, 241).
link(cloud4, edge20, 58, 266).
link(edge20, cloud4, 58, 266).
link(cloud4, cloud5, 18, 492).
link(cloud5, cloud4, 18, 492).
link(cloud4, edge30, 70, 233).
link(edge30, cloud4, 70, 233).
link(cloud4, edge31, 68, 251).
link(edge31, cloud4, 68, 251).
link(cloud4, edge32, 73, 278).
link(edge32, cloud4, 73, 278).
link(cloud4, edge34, 61, 297).
link(edge34, cloud4, 61, 297).
link(cloud4, cloud11, 15, 849).
link(cloud11, cloud4, 15, 849).
link(edge17, edge19, 29, 178).
link(edge19, edge17, 29, 178).
link(edge17, cloud5, 67, 247).
link(cloud5, edge17, 67, 247).
link(edge17, edge21, 28, 162).
link(edge21, edge17, 28, 162).
link(edge17, edge22, 27, 122).
link(edge22, edge17, 27, 122).
link(edge17, edge23, 35, 149).
link(edge23, edge17, 35, 149).
link(edge17, edge24, 21, 117).
link(edge24, edge17, 21, 117).
link(edge17, edge25, 23, 101).
link(edge25, edge17, 23, 101).
link(edge17, edge26, 30, 118).
link(edge26, edge17, 30, 118).
link(edge17, edge27, 34, 168).
link(edge27, edge17, 34, 168).
link(edge17, edge28, 25, 136).
link(edge28, edge17, 25, 136).
link(edge17, edge29, 34, 137).
link(edge29, edge17, 34, 137).
link(edge17, edge31, 32, 176).
link(edge31, edge17, 32, 176).
link(edge17, cloud9, 67, 295).
link(cloud9, edge17, 67, 295).
link(edge17, edge33, 24, 130).
link(edge33, edge17, 24, 130).
link(edge17, edge36, 37, 110).
link(edge36, edge17, 37, 110).
link(edge17, edge37, 26, 172).
link(edge37, edge17, 26, 172).
link(edge17, cloud11, 64, 293).
link(cloud11, edge17, 64, 293).
link(edge17, cloud12, 64, 285).
link(cloud12, edge17, 64, 285).
link(edge17, edge38, 17, 100).
link(edge38, edge17, 17, 100).
link(edge20, edge17, 14, 158).
link(edge17, edge20, 14, 158).
link(cloud7, edge17, 51, 277).
link(edge17, cloud7, 51, 277).
link(cloud8, edge17, 58, 225).
link(edge17, cloud8, 58, 225).
link(edge32, edge17, 31, 165).
link(edge17, edge32, 31, 165).
link(edge34, edge17, 11, 188).
link(edge17, edge34, 11, 188).
link(edge35, edge17, 37, 191).
link(edge17, edge35, 37, 191).
link(edge17, edge18, 32, 141).
link(edge18, edge17, 32, 141).
link(edge17, cloud6, 69, 275).
link(cloud6, edge17, 69, 275).
link(edge17, edge30, 23, 191).
link(edge30, edge17, 23, 191).
link(edge17, cloud10, 67, 291).
link(cloud10, edge17, 67, 291).
link(edge18, edge20, 31, 133).
link(edge20, edge18, 31, 133).
link(edge18, edge22, 11, 166).
link(edge22, edge18, 11, 166).
link(edge18, edge25, 34, 159).
link(edge25, edge18, 34, 159).
link(edge18, edge26, 31, 142).
link(edge26, edge18, 31, 142).
link(edge18, edge28, 23, 128).
link(edge28, edge18, 23, 128).
link(edge18, cloud7, 70, 292).
link(cloud7, edge18, 70, 292).
link(edge18, edge30, 38, 184).
link(edge30, edge18, 38, 184).
link(edge18, edge32, 21, 109).
link(edge32, edge18, 21, 109).
link(edge18, edge34, 21, 138).
link(edge34, edge18, 21, 138).
link(edge18, edge35, 33, 129).
link(edge35, edge18, 33, 129).
link(edge18, edge36, 29, 126).
link(edge36, edge18, 29, 126).
link(edge18, edge37, 20, 110).
link(edge37, edge18, 20, 110).
link(edge18, cloud12, 75, 246).
link(cloud12, edge18, 75, 246).
link(edge19, edge18, 21, 156).
link(edge18, edge19, 21, 156).
link(cloud5, edge18, 61, 266).
link(edge18, cloud5, 61, 266).
link(edge21, edge18, 19, 103).
link(edge18, edge21, 19, 103).
link(edge24, edge18, 21, 195).
link(edge18, edge24, 21, 195).
link(edge27, edge18, 25, 180).
link(edge18, edge27, 25, 180).
link(cloud8, edge18, 68, 281).
link(edge18, cloud8, 68, 281).
link(edge29, edge18, 21, 166).
link(edge18, edge29, 21, 166).
link(edge31, edge18, 13, 160).
link(edge18, edge31, 13, 160).
link(cloud9, edge18, 67, 238).
link(edge18, cloud9, 67, 238).
link(edge33, edge18, 33, 189).
link(edge18, edge33, 33, 189).
link(edge38, edge18, 33, 132).
link(edge18, edge38, 33, 132).
link(edge18, cloud6, 71, 291).
link(cloud6, edge18, 71, 291).
link(edge18, edge23, 27, 137).
link(edge23, edge18, 27, 137).
link(edge18, cloud10, 75, 209).
link(cloud10, edge18, 75, 209).
link(edge18, cloud11, 73, 276).
link(cloud11, edge18, 73, 276).
link(edge19, edge20, 24, 183).
link(edge20, edge19, 24, 183).
link(edge19, cloud5, 71, 251).
link(cloud5, edge19, 71, 251).
link(edge19, edge21, 29, 181).
link(edge21, edge19, 29, 181).
link(edge19, edge24, 35, 196).
link(edge24, edge19, 35, 196).
link(edge19, edge26, 31, 167).
link(edge26, edge19, 31, 167).
link(edge19, cloud7, 78, 262).
link(cloud7, edge19, 78, 262).
link(edge19, edge29, 33, 111).
link(edge29, edge19, 33, 111).
link(edge19, edge32, 19, 163).
link(edge32, edge19, 19, 163).
link(edge19, edge34, 21, 100).
link(edge34, edge19, 21, 100).
link(edge19, cloud10, 66, 274).
link(cloud10, edge19, 66, 274).
link(edge19, edge36, 29, 127).
link(edge36, edge19, 29, 127).
link(edge19, cloud11, 76, 276).
link(cloud11, edge19, 76, 276).
link(edge19, edge38, 12, 103).
link(edge38, edge19, 12, 103).
link(cloud6, edge19, 61, 238).
link(edge19, cloud6, 61, 238).
link(edge23, edge19, 36, 194).
link(edge19, edge23, 36, 194).
link(edge27, edge19, 36, 163).
link(edge19, edge27, 36, 163).
link(edge28, edge19, 34, 117).
link(edge19, edge28, 34, 117).
link(edge30, edge19, 24, 188).
link(edge19, edge30, 24, 188).
link(edge19, edge22, 29, 182).
link(edge22, edge19, 29, 182).
link(edge19, edge25, 26, 141).
link(edge25, edge19, 26, 141).
link(edge19, cloud8, 73, 216).
link(cloud8, edge19, 73, 216).
link(edge19, edge31, 34, 105).
link(edge31, edge19, 34, 105).
link(edge19, cloud9, 70, 216).
link(cloud9, edge19, 70, 216).
link(edge19, edge33, 24, 192).
link(edge33, edge19, 24, 192).
link(edge19, edge35, 38, 125).
link(edge35, edge19, 38, 125).
link(edge19, edge37, 37, 155).
link(edge37, edge19, 37, 155).
link(edge19, cloud12, 67, 296).
link(cloud12, edge19, 67, 296).
link(edge20, cloud6, 59, 213).
link(cloud6, edge20, 59, 213).
link(edge20, edge23, 25, 127).
link(edge23, edge20, 25, 127).
link(edge20, edge24, 23, 173).
link(edge24, edge20, 23, 173).
link(edge20, edge25, 13, 155).
link(edge25, edge20, 13, 155).
link(edge20, edge28, 15, 131).
link(edge28, edge20, 15, 131).
link(edge20, cloud7, 54, 232).
link(cloud7, edge20, 54, 232).
link(edge20, cloud8, 61, 231).
link(cloud8, edge20, 61, 231).
link(edge20, edge31, 20, 180).
link(edge31, edge20, 20, 180).
link(edge20, cloud9, 64, 204).
link(cloud9, edge20, 64, 204).
link(edge20, edge32, 27, 116).
link(edge32, edge20, 27, 116).
link(edge20, cloud10, 60, 273).
link(cloud10, edge20, 60, 273).
link(edge20, edge35, 28, 109).
link(edge35, edge20, 28, 109).
link(edge21, edge20, 20, 187).
link(edge20, edge21, 20, 187).
link(edge22, edge20, 23, 188).
link(edge20, edge22, 23, 188).
link(edge27, edge20, 29, 147).
link(edge20, edge27, 29, 147).
link(edge34, edge20, 25, 134).
link(edge20, edge34, 25, 134).
link(cloud11, edge20, 67, 230).
link(edge20, cloud11, 67, 230).
link(cloud12, edge20, 53, 201).
link(edge20, cloud12, 53, 201).
link(edge20, cloud5, 63, 281).
link(cloud5, edge20, 63, 281).
link(edge20, edge26, 28, 110).
link(edge26, edge20, 28, 110).
link(edge20, edge29, 40, 191).
link(edge29, edge20, 40, 191).
link(edge20, edge30, 37, 166).
link(edge30, edge20, 37, 166).
link(edge20, edge33, 25, 142).
link(edge33, edge20, 25, 142).
link(edge20, edge36, 30, 118).
link(edge36, edge20, 30, 118).
link(edge20, edge37, 26, 173).
link(edge37, edge20, 26, 173).
link(edge20, edge38, 31, 178).
link(edge38, edge20, 31, 178).
link(cloud5, edge21, 71, 289).
link(edge21, cloud5, 71, 289).
link(cloud5, edge22, 57, 227).
link(edge22, cloud5, 57, 227).
link(cloud5, edge23, 73, 266).
link(edge23, cloud5, 73, 266).
link(cloud5, edge24, 78, 279).
link(edge24, cloud5, 78, 279).
link(cloud5, edge25, 76, 239).
link(edge25, cloud5, 76, 239).
link(cloud5, edge27, 74, 225).
link(edge27, cloud5, 74, 225).
link(cloud5, edge28, 70, 251).
link(edge28, cloud5, 70, 251).
link(cloud5, edge30, 70, 205).
link(edge30, cloud5, 70, 205).
link(cloud5, edge33, 66, 270).
link(edge33, cloud5, 66, 270).
link(cloud5, edge34, 61, 272).
link(edge34, cloud5, 61, 272).
link(cloud5, cloud10, 17, 901).
link(cloud10, cloud5, 17, 901).
link(cloud5, edge35, 61, 266).
link(edge35, cloud5, 61, 266).
link(cloud5, edge37, 56, 295).
link(edge37, cloud5, 56, 295).
link(cloud5, cloud12, 14, 482).
link(cloud12, cloud5, 14, 482).
link(cloud6, cloud5, 10, 395).
link(cloud5, cloud6, 10, 395).
link(cloud8, cloud5, 9, 501).
link(cloud5, cloud8, 9, 501).
link(edge31, cloud5, 65, 241).
link(cloud5, edge31, 65, 241).
link(cloud9, cloud5, 13, 813).
link(cloud5, cloud9, 13, 813).
link(edge32, cloud5, 67, 222).
link(cloud5, edge32, 67, 222).
link(cloud11, cloud5, 15, 890).
link(cloud5, cloud11, 15, 890).
link(edge38, cloud5, 81, 259).
link(cloud5, edge38, 81, 259).
link(cloud5, edge26, 76, 288).
link(edge26, cloud5, 76, 288).
link(cloud5, cloud7, 16, 827).
link(cloud7, cloud5, 16, 827).
link(cloud5, edge29, 64, 262).
link(edge29, cloud5, 64, 262).
link(cloud5, edge36, 75, 231).
link(edge36, cloud5, 75, 231).
link(edge21, cloud6, 75, 226).
link(cloud6, edge21, 75, 226).
link(edge21, edge26, 28, 122).
link(edge26, edge21, 28, 122).
link(edge21, cloud8, 66, 279).
link(cloud8, edge21, 66, 279).
link(edge21, edge29, 31, 141).
link(edge29, edge21, 31, 141).
link(edge21, edge30, 38, 128).
link(edge30, edge21, 38, 128).
link(edge21, edge31, 22, 188).
link(edge31, edge21, 22, 188).
link(edge21, edge33, 28, 191).
link(edge33, edge21, 28, 191).
link(edge21, edge36, 24, 188).
link(edge36, edge21, 24, 188).
link(edge21, edge37, 15, 191).
link(edge37, edge21, 15, 191).
link(edge25, edge21, 21, 114).
link(edge21, edge25, 21, 114).
link(cloud9, edge21, 63, 239).
link(edge21, cloud9, 63, 239).
link(edge34, edge21, 30, 102).
link(edge21, edge34, 30, 102).
link(cloud10, edge21, 70, 290).
link(edge21, cloud10, 70, 290).
link(cloud11, edge21, 69, 240).
link(edge21, cloud11, 69, 240).
link(edge38, edge21, 26, 109).
link(edge21, edge38, 26, 109).
link(edge21, edge22, 29, 118).
link(edge22, edge21, 29, 118).
link(edge21, edge23, 41, 113).
link(edge23, edge21, 41, 113).
link(edge21, edge24, 26, 170).
link(edge24, edge21, 26, 170).
link(edge21, edge27, 24, 141).
link(edge27, edge21, 24, 141).
link(edge21, edge28, 35, 100).
link(edge28, edge21, 35, 100).
link(edge21, cloud7, 72, 203).
link(cloud7, edge21, 72, 203).
link(edge21, edge32, 33, 172).
link(edge32, edge21, 33, 172).
link(edge21, edge35, 25, 154).
link(edge35, edge21, 25, 154).
link(edge21, cloud12, 69, 288).
link(cloud12, edge21, 69, 288).
link(edge22, cloud6, 67, 253).
link(cloud6, edge22, 67, 253).
link(edge22, edge23, 16, 130).
link(edge23, edge22, 16, 130).
link(edge22, edge24, 26, 115).
link(edge24, edge22, 26, 115).
link(edge22, edge26, 20, 110).
link(edge26, edge22, 20, 110).
link(edge22, edge27, 26, 152).
link(edge27, edge22, 26, 152).
link(edge22, edge28, 19, 162).
link(edge28, edge22, 19, 162).
link(edge22, cloud7, 73, 282).
link(cloud7, edge22, 73, 282).
link(edge22, cloud8, 66, 287).
link(cloud8, edge22, 66, 287).
link(edge22, edge29, 32, 178).
link(edge29, edge22, 32, 178).
link(edge22, edge30, 27, 156).
link(edge30, edge22, 27, 156).
link(edge22, edge31, 22, 127).
link(edge31, edge22, 22, 127).
link(edge22, edge35, 24, 195).
link(edge35, edge22, 24, 195).
link(edge22, cloud11, 72, 291).
link(cloud11, edge22, 72, 291).
link(edge22, cloud12, 68, 263).
link(cloud12, edge22, 68, 263).
link(edge22, edge38, 24, 102).
link(edge38, edge22, 24, 102).
link(cloud9, edge22, 70, 214).
link(edge22, cloud9, 70, 214).
link(edge32, edge22, 10, 152).
link(edge22, edge32, 10, 152).
link(edge34, edge22, 24, 117).
link(edge22, edge34, 24, 117).
link(edge36, edge22, 18, 102).
link(edge22, edge36, 18, 102).
link(edge22, edge25, 33, 136).
link(edge25, edge22, 33, 136).
link(edge22, edge33, 25, 113).
link(edge33, edge22, 25, 113).
link(edge22, cloud10, 64, 232).
link(cloud10, edge22, 64, 232).
link(edge22, edge37, 28, 173).
link(edge37, edge22, 28, 173).
link(cloud6, edge23, 71, 218).
link(edge23, cloud6, 71, 218).
link(cloud6, edge25, 72, 215).
link(edge25, cloud6, 72, 215).
link(cloud6, edge26, 80, 253).
link(edge26, cloud6, 80, 253).
link(cloud6, edge30, 61, 267).
link(edge30, cloud6, 61, 267).
link(cloud6, edge31, 74, 201).
link(edge31, cloud6, 74, 201).
link(cloud6, cloud9, 19, 755).
link(cloud9, cloud6, 19, 755).
link(cloud6, edge32, 63, 252).
link(edge32, cloud6, 63, 252).
link(cloud6, cloud10, 7, 675).
link(cloud10, cloud6, 7, 675).
link(cloud6, edge35, 70, 272).
link(edge35, cloud6, 70, 272).
link(cloud6, edge37, 62, 213).
link(edge37, cloud6, 62, 213).
link(cloud6, cloud11, 21, 688).
link(cloud11, cloud6, 21, 688).
link(cloud6, cloud12, 6, 620).
link(cloud12, cloud6, 6, 620).
link(edge29, cloud6, 66, 234).
link(cloud6, edge29, 66, 234).
link(edge34, cloud6, 63, 269).
link(cloud6, edge34, 63, 269).
link(cloud6, edge24, 70, 247).
link(edge24, cloud6, 70, 247).
link(cloud6, edge27, 68, 243).
link(edge27, cloud6, 68, 243).
link(cloud6, edge28, 61, 213).
link(edge28, cloud6, 61, 213).
link(cloud6, cloud7, 23, 924).
link(cloud7, cloud6, 23, 924).
link(cloud6, cloud8, 19, 890).
link(cloud8, cloud6, 19, 890).
link(cloud6, edge33, 68, 231).
link(edge33, cloud6, 68, 231).
link(cloud6, edge36, 73, 295).
link(edge36, cloud6, 73, 295).
link(cloud6, edge38, 73, 220).
link(edge38, cloud6, 73, 220).
link(edge23, edge24, 20, 127).
link(edge24, edge23, 20, 127).
link(edge23, edge26, 25, 107).
link(edge26, edge23, 25, 107).
link(edge23, edge27, 17, 191).
link(edge27, edge23, 17, 191).
link(edge23, cloud7, 63, 237).
link(cloud7, edge23, 63, 237).
link(edge23, cloud9, 69, 277).
link(cloud9, edge23, 69, 277).
link(edge23, edge32, 25, 146).
link(edge32, edge23, 25, 146).
link(edge23, edge34, 24, 180).
link(edge34, edge23, 24, 180).
link(edge23, cloud10, 64, 297).
link(cloud10, edge23, 64, 297).
link(edge23, edge37, 26, 199).
link(edge37, edge23, 26, 199).
link(edge23, cloud12, 67, 254).
link(cloud12, edge23, 67, 254).
link(edge25, edge23, 22, 197).
link(edge23, edge25, 22, 197).
link(edge28, edge23, 10, 184).
link(edge23, edge28, 10, 184).
link(edge30, edge23, 37, 127).
link(edge23, edge30, 37, 127).
link(edge31, edge23, 23, 112).
link(edge23, edge31, 23, 112).
link(edge33, edge23, 20, 118).
link(edge23, edge33, 20, 118).
link(edge23, cloud8, 65, 266).
link(cloud8, edge23, 65, 266).
link(edge23, edge29, 28, 130).
link(edge29, edge23, 28, 130).
link(edge23, edge35, 28, 121).
link(edge35, edge23, 28, 121).
link(edge23, edge36, 25, 161).
link(edge36, edge23, 25, 161).
link(edge23, cloud11, 67, 273).
link(cloud11, edge23, 67, 273).
link(edge23, edge38, 39, 148).
link(edge38, edge23, 39, 148).
link(edge24, edge25, 23, 185).
link(edge25, edge24, 23, 185).
link(edge24, edge28, 23, 181).
link(edge28, edge24, 23, 181).
link(edge24, cloud7, 62, 220).
link(cloud7, edge24, 62, 220).
link(edge24, edge31, 22, 161).
link(edge31, edge24, 22, 161).
link(edge24, edge32, 27, 102).
link(edge32, edge24, 27, 102).
link(edge24, edge34, 23, 122).
link(edge34, edge24, 23, 122).
link(edge24, cloud10, 66, 274).
link(cloud10, edge24, 66, 274).
link(edge24, edge37, 36, 110).
link(edge37, edge24, 36, 110).
link(edge24, cloud12, 68, 298).
link(cloud12, edge24, 68, 298).
link(edge30, edge24, 24, 196).
link(edge24, edge30, 24, 196).
link(edge33, edge24, 27, 199).
link(edge24, edge33, 27, 199).
link(edge36, edge24, 28, 115).
link(edge24, edge36, 28, 115).
link(edge24, edge26, 37, 191).
link(edge26, edge24, 37, 191).
link(edge24, edge27, 24, 132).
link(edge27, edge24, 24, 132).
link(edge24, cloud8, 69, 202).
link(cloud8, edge24, 69, 202).
link(edge24, edge29, 38, 192).
link(edge29, edge24, 38, 192).
link(edge24, cloud9, 76, 276).
link(cloud9, edge24, 76, 276).
link(edge24, edge35, 27, 142).
link(edge35, edge24, 27, 142).
link(edge24, cloud11, 75, 259).
link(cloud11, edge24, 75, 259).
link(edge24, edge38, 36, 101).
link(edge38, edge24, 36, 101).
link(edge25, edge27, 28, 184).
link(edge27, edge25, 28, 184).
link(edge25, edge28, 14, 182).
link(edge28, edge25, 14, 182).
link(edge25, edge30, 26, 185).
link(edge30, edge25, 26, 185).
link(edge25, edge32, 27, 136).
link(edge32, edge25, 27, 136).
link(edge25, edge33, 24, 148).
link(edge33, edge25, 24, 148).
link(edge25, edge34, 34, 116).
link(edge34, edge25, 34, 116).
link(edge25, edge37, 25, 164).
link(edge37, edge25, 25, 164).
link(edge25, cloud12, 66, 253).
link(cloud12, edge25, 66, 253).
link(edge25, edge38, 23, 172).
link(edge38, edge25, 23, 172).
link(edge26, edge25, 15, 133).
link(edge25, edge26, 15, 133).
link(cloud8, edge25, 70, 224).
link(edge25, cloud8, 70, 224).
link(cloud10, edge25, 68, 207).
link(edge25, cloud10, 68, 207).
link(edge35, edge25, 23, 180).
link(edge25, edge35, 23, 180).
link(cloud11, edge25, 76, 298).
link(edge25, cloud11, 76, 298).
link(edge25, cloud7, 67, 273).
link(cloud7, edge25, 67, 273).
link(edge25, edge29, 35, 140).
link(edge29, edge25, 35, 140).
link(edge25, edge31, 33, 190).
link(edge31, edge25, 33, 190).
link(edge25, cloud9, 72, 259).
link(cloud9, edge25, 72, 259).
link(edge25, edge36, 29, 122).
link(edge36, edge25, 29, 122).
link(edge26, cloud7, 77, 230).
link(cloud7, edge26, 77, 230).
link(edge26, cloud8, 70, 272).
link(cloud8, edge26, 70, 272).
link(edge26, edge29, 25, 167).
link(edge29, edge26, 25, 167).
link(edge26, edge30, 35, 110).
link(edge30, edge26, 35, 110).
link(edge26, edge32, 17, 161).
link(edge32, edge26, 17, 161).
link(edge26, edge33, 33, 183).
link(edge33, edge26, 33, 183).
link(edge26, edge34, 37, 102).
link(edge34, edge26, 37, 102).
link(edge26, cloud11, 64, 242).
link(cloud11, edge26, 64, 242).
link(edge26, cloud12, 76, 253).
link(cloud12, edge26, 76, 253).
link(edge27, edge26, 30, 166).
link(edge26, edge27, 30, 166).
link(edge37, edge26, 20, 155).
link(edge26, edge37, 20, 155).
link(edge26, edge28, 29, 165).
link(edge28, edge26, 29, 165).
link(edge26, edge31, 33, 123).
link(edge31, edge26, 33, 123).
link(edge26, cloud9, 70, 225).
link(cloud9, edge26, 70, 225).
link(edge26, cloud10, 73, 229).
link(cloud10, edge26, 73, 229).
link(edge26, edge35, 25, 157).
link(edge35, edge26, 25, 157).
link(edge26, edge36, 27, 196).
link(edge36, edge26, 27, 196).
link(edge26, edge38, 31, 180).
link(edge38, edge26, 31, 180).
link(edge27, edge28, 14, 176).
link(edge28, edge27, 14, 176).
link(edge27, cloud7, 58, 295).
link(cloud7, edge27, 58, 295).
link(edge27, cloud8, 65, 273).
link(cloud8, edge27, 65, 273).
link(edge27, edge30, 39, 163).
link(edge30, edge27, 39, 163).
link(edge27, edge31, 24, 149).
link(edge31, edge27, 24, 149).
link(edge27, edge33, 20, 143).
link(edge33, edge27, 20, 143).
link(edge27, edge35, 26, 149).
link(edge35, edge27, 26, 149).
link(edge27, cloud11, 71, 280).
link(cloud11, edge27, 71, 280).
link(edge29, edge27, 14, 143).
link(edge27, edge29, 14, 143).
link(cloud9, edge27, 74, 266).
link(edge27, cloud9, 74, 266).
link(edge34, edge27, 30, 198).
link(edge27, edge34, 30, 198).
link(cloud10, edge27, 61, 249).
link(edge27, cloud10, 61, 249).
link(edge37, edge27, 26, 116).
link(edge27, edge37, 26, 116).
link(cloud12, edge27, 67, 258).
link(edge27, cloud12, 67, 258).
link(edge27, edge32, 29, 191).
link(edge32, edge27, 29, 191).
link(edge27, edge36, 26, 108).
link(edge36, edge27, 26, 108).
link(edge27, edge38, 43, 108).
link(edge38, edge27, 43, 108).
link(edge28, cloud7, 54, 222).
link(cloud7, edge28, 54, 222).
link(edge28, cloud8, 61, 267).
link(cloud8, edge28, 61, 267).
link(edge28, edge30, 28, 140).
link(edge30, edge28, 28, 140).
link(edge28, edge31, 25, 113).
link(edge31, edge28, 25, 113).
link(edge28, cloud9, 63, 264).
link(cloud9, edge28, 63, 264).
link(edge28, edge32, 15, 116).
link(edge32, edge28, 15, 116).
link(edge28, edge33, 10, 129).
link(edge33, edge28, 10, 129).
link(edge28, edge34, 21, 171).
link(edge34, edge28, 21, 171).
link(edge28, cloud10, 54, 233).
link(cloud10, edge28, 54, 233).
link(edge28, edge36, 15, 107).
link(edge36, edge28, 15, 107).
link(edge28, cloud11, 67, 237).
link(cloud11, edge28, 67, 237).
link(edge28, edge29, 27, 126).
link(edge29, edge28, 27, 126).
link(edge28, edge35, 36, 189).
link(edge35, edge28, 36, 189).
link(edge28, edge37, 23, 108).
link(edge37, edge28, 23, 108).
link(edge28, cloud12, 67, 274).
link(cloud12, edge28, 67, 274).
link(edge28, edge38, 29, 115).
link(edge38, edge28, 29, 115).
link(cloud7, edge29, 52, 256).
link(edge29, cloud7, 52, 256).
link(cloud7, edge30, 72, 277).
link(edge30, cloud7, 72, 277).
link(cloud7, edge31, 59, 238).
link(edge31, cloud7, 59, 238).
link(cloud7, edge33, 55, 298).
link(edge33, cloud7, 55, 298).
link(cloud7, edge35, 58, 254).
link(edge35, cloud7, 58, 254).
link(cloud7, edge36, 69, 227).
link(edge36, cloud7, 69, 227).
link(cloud7, edge37, 63, 277).
link(edge37, cloud7, 63, 277).
link(cloud7, cloud12, 17, 696).
link(cloud12, cloud7, 17, 696).
link(cloud8, cloud7, 7, 600).
link(cloud7, cloud8, 7, 600).
link(cloud9, cloud7, 16, 403).
link(cloud7, cloud9, 16, 403).
link(edge34, cloud7, 59, 212).
link(cloud7, edge34, 59, 212).
link(cloud7, edge32, 69, 272).
link(edge32, cloud7, 69, 272).
link(cloud7, cloud10, 18, 578).
link(cloud10, cloud7, 18, 578).
link(cloud7, cloud11, 13, 600).
link(cloud11, cloud7, 13, 600).
link(cloud7, edge38, 68, 256).
link(edge38, cloud7, 68, 256).
link(cloud8, edge29, 55, 216).
link(edge29, cloud8, 55, 216).
link(cloud8, edge30, 73, 268).
link(edge30, cloud8, 73, 268).
link(cloud8, edge31, 59, 238).
link(edge31, cloud8, 59, 238).
link(cloud8, edge33, 57, 209).
link(edge33, cloud8, 57, 209).
link(cloud8, edge34, 52, 275).
link(edge34, cloud8, 52, 275).
link(cloud8, cloud10, 19, 991).
link(cloud10, cloud8, 19, 991).
link(cloud8, edge35, 62, 278).
link(edge35, cloud8, 62, 278).
link(cloud8, edge36, 74, 230).
link(edge36, cloud8, 74, 230).
link(cloud8, cloud11, 6, 972).
link(cloud11, cloud8, 6, 972).
link(cloud8, cloud12, 14, 531).
link(cloud12, cloud8, 14, 531).
link(cloud9, cloud8, 12, 529).
link(cloud8, cloud9, 12, 529).
link(edge32, cloud8, 64, 238).
link(cloud8, edge32, 64, 238).
link(edge38, cloud8, 75, 240).
link(cloud8, edge38, 75, 240).
link(cloud8, edge37, 65, 218).
link(edge37, cloud8, 65, 218).
link(edge29, edge32, 26, 149).
link(edge32, edge29, 26, 149).
link(edge29, edge33, 17, 150).
link(edge33, edge29, 17, 150).
link(edge29, edge34, 23, 111).
link(edge34, edge29, 23, 111).
link(edge29, cloud10, 59, 266).
link(cloud10, edge29, 59, 266).
link(edge29, edge35, 12, 183).
link(edge35, edge29, 12, 183).
link(edge29, edge36, 36, 119).
link(edge36, edge29, 36, 119).
link(edge31, edge29, 34, 101).
link(edge29, edge31, 34, 101).
link(cloud9, edge29, 67, 289).
link(edge29, cloud9, 67, 289).
link(edge37, edge29, 16, 192).
link(edge29, edge37, 16, 192).
link(cloud12, edge29, 69, 297).
link(edge29, cloud12, 69, 297).
link(edge29, edge30, 26, 152).
link(edge30, edge29, 26, 152).
link(edge29, cloud11, 61, 220).
link(cloud11, edge29, 61, 220).
link(edge29, edge38, 38, 114).
link(edge38, edge29, 38, 114).
link(edge30, edge31, 30, 197).
link(edge31, edge30, 30, 197).
link(edge30, edge34, 34, 152).
link(edge34, edge30, 34, 152).
link(edge30, cloud10, 54, 237).
link(cloud10, edge30, 54, 237).
link(edge30, edge35, 14, 141).
link(edge35, edge30, 14, 141).
link(edge30, edge36, 23, 155).
link(edge36, edge30, 23, 155).
link(edge30, edge37, 31, 184).
link(edge37, edge30, 31, 184).
link(edge30, cloud11, 68, 253).
link(cloud11, edge30, 68, 253).
link(edge30, cloud12, 65, 292).
link(cloud12, edge30, 65, 292).
link(edge30, edge38, 12, 134).
link(edge38, edge30, 12, 134).
link(edge32, edge30, 26, 110).
link(edge30, edge32, 26, 110).
link(edge30, cloud9, 74, 233).
link(cloud9, edge30, 74, 233).
link(edge30, edge33, 38, 166).
link(edge33, edge30, 38, 166).
link(edge31, edge32, 32, 186).
link(edge32, edge31, 32, 186).
link(edge31, edge36, 26, 198).
link(edge36, edge31, 26, 198).
link(edge31, edge37, 31, 153).
link(edge37, edge31, 31, 153).
link(edge31, cloud12, 73, 271).
link(cloud12, edge31, 73, 271).
link(edge31, edge38, 42, 167).
link(edge38, edge31, 42, 167).
link(cloud9, edge31, 61, 277).
link(edge31, cloud9, 61, 277).
link(edge33, edge31, 35, 119).
link(edge31, edge33, 35, 119).
link(cloud10, edge31, 68, 284).
link(edge31, cloud10, 68, 284).
link(edge31, edge34, 28, 181).
link(edge34, edge31, 28, 181).
link(edge31, edge35, 31, 108).
link(edge35, edge31, 31, 108).
link(edge31, cloud11, 65, 247).
link(cloud11, edge31, 65, 247).
link(cloud9, edge33, 61, 243).
link(edge33, cloud9, 61, 243).
link(cloud9, edge35, 64, 256).
link(edge35, cloud9, 64, 256).
link(cloud9, edge37, 69, 220).
link(edge37, cloud9, 69, 220).
link(cloud9, cloud11, 6, 626).
link(cloud11, cloud9, 6, 626).
link(cloud9, cloud12, 14, 759).
link(cloud12, cloud9, 14, 759).
link(cloud9, edge32, 66, 229).
link(edge32, cloud9, 66, 229).
link(cloud9, edge34, 64, 266).
link(edge34, cloud9, 64, 266).
link(cloud9, cloud10, 21, 592).
link(cloud10, cloud9, 21, 592).
link(cloud9, edge36, 76, 206).
link(edge36, cloud9, 76, 206).
link(cloud9, edge38, 80, 256).
link(edge38, cloud9, 80, 256).
link(edge32, cloud10, 56, 211).
link(cloud10, edge32, 56, 211).
link(edge32, edge35, 25, 124).
link(edge35, edge32, 25, 124).
link(edge32, edge36, 10, 146).
link(edge36, edge32, 10, 146).
link(edge32, cloud11, 70, 266).
link(cloud11, edge32, 70, 266).
link(edge33, edge32, 20, 173).
link(edge32, edge33, 20, 173).
link(edge34, edge32, 20, 100).
link(edge32, edge34, 20, 100).
link(edge37, edge32, 18, 149).
link(edge32, edge37, 18, 149).
link(edge38, edge32, 14, 197).
link(edge32, edge38, 14, 197).
link(edge32, cloud12, 69, 297).
link(cloud12, edge32, 69, 297).
link(edge33, edge34, 13, 136).
link(edge34, edge33, 13, 136).
link(edge33, cloud10, 63, 254).
link(cloud10, edge33, 63, 254).
link(edge33, edge35, 29, 122).
link(edge35, edge33, 29, 122).
link(edge33, edge37, 13, 159).
link(edge37, edge33, 13, 159).
link(edge33, cloud11, 63, 215).
link(cloud11, edge33, 63, 215).
link(edge33, cloud12, 62, 241).
link(cloud12, edge33, 62, 241).
link(edge33, edge36, 25, 114).
link(edge36, edge33, 25, 114).
link(edge33, edge38, 31, 152).
link(edge38, edge33, 31, 152).
link(edge34, edge35, 35, 157).
link(edge35, edge34, 35, 157).
link(edge34, edge36, 30, 141).
link(edge36, edge34, 30, 141).
link(edge34, cloud11, 58, 299).
link(cloud11, edge34, 58, 299).
link(cloud12, edge34, 57, 218).
link(edge34, cloud12, 57, 218).
link(edge34, cloud10, 70, 288).
link(cloud10, edge34, 70, 288).
link(edge34, edge37, 26, 184).
link(edge37, edge34, 26, 184).
link(edge34, edge38, 28, 167).
link(edge38, edge34, 28, 167).
link(cloud10, edge35, 68, 244).
link(edge35, cloud10, 68, 244).
link(cloud10, edge37, 55, 230).
link(edge37, cloud10, 55, 230).
link(cloud10, cloud12, 13, 498).
link(cloud12, cloud10, 13, 498).
link(cloud10, edge38, 66, 282).
link(edge38, cloud10, 66, 282).
link(cloud11, cloud10, 17, 372).
link(cloud10, cloud11, 17, 372).
link(cloud10, edge36, 66, 236).
link(edge36, cloud10, 66, 236).
link(edge35, cloud11, 67, 265).
link(cloud11, edge35, 67, 265).
link(edge35, edge36, 27, 173).
link(edge36, edge35, 27, 173).
link(edge35, edge37, 28, 103).
link(edge37, edge35, 28, 103).
link(edge35, cloud12, 64, 258).
link(cloud12, edge35, 64, 258).
link(edge35, edge38, 26, 140).
link(edge38, edge35, 26, 140).
link(edge36, edge37, 28, 161).
link(edge37, edge36, 28, 161).
link(cloud11, edge36, 80, 236).
link(edge36, cloud11, 80, 236).
link(cloud12, edge36, 67, 212).
link(edge36, cloud12, 67, 212).
link(edge36, edge38, 24, 138).
link(edge38, edge36, 24, 138).
link(edge37, cloud11, 71, 228).
link(cloud11, edge37, 71, 228).
link(edge37, edge38, 32, 199).
link(edge38, edge37, 32, 199).
link(edge37, cloud12, 68, 282).
link(cloud12, edge37, 68, 282).
link(cloud12, cloud11, 20, 910).
link(cloud11, cloud12, 20, 910).
link(cloud11, edge38, 80, 234).
link(edge38, cloud11, 80, 234).
link(edge38, cloud12, 70, 238).
link(cloud12, edge38, 70, 238).
link(N, N, 0, 100000).