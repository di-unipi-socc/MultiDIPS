:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

globalIntent(footprint, smaller, 2.41, kg).

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

node(edge1, edge, (16, 9, 1714)).
	totHW(edge1, (18, 10, 1890)).
	pue(edge1, 1.1).
	energySourceMix(edge1, [(0.17,offshorewind), (0.83,onshorewind)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.141 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.016 * L.
	energyCost(edge1, 0.499).

node(edge2, edge, (27, 10, 1377)).
	totHW(edge2, (33, 13, 1640)).
	pue(edge2, 1.16).
	energySourceMix(edge2, [(0.01,offshorewind), (0.54,gas), (0.45,solar)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.015 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.183 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.013 * L.
	energyCost(edge2, 0.318).

node(edge3, edge, (19, 8, 1135)).
	totHW(edge3, (24, 11, 1425)).
	pue(edge3, 1.12).
	energySourceMix(edge3, [(0.25,coal), (0.75,gas)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.137 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.014 * L.
	energyCost(edge3, 0.166).

node(edge4, edge, (22, 7, 525)).
	totHW(edge4, (26, 8, 600)).
	pue(edge4, 1.17).
	energySourceMix(edge4, [(0.22,solar), (0.5,coal), (0.28,gas)]).
	ramEnergyProfile(edge4, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge4, L, E) :- E is 0.117 * L.
	storageEnergyProfile(edge4, L, E) :- E is 0.005 * L.
	energyCost(edge4, 0.167).

node(cloud1, cloud, (219, 31, 9004)).
	totHW(cloud1, (274, 39, 11264)).
	pue(cloud1, 1.45).
	energySourceMix(cloud1, [(0.22,gas), (0.02,coal), (0.76,solar)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.089 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.442 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.064 * L.
	energyCost(cloud1, 0.396).

node(edge5, edge, (36, 8, 455)).
	totHW(edge5, (41, 10, 511)).
	pue(edge5, 1.12).
	energySourceMix(edge5, [(0.45,solar), (0.28,onshorewind), (0.27,coal)]).
	ramEnergyProfile(edge5, L, E) :- E is 0.019 * L.
	cpuEnergyProfile(edge5, L, E) :- E is 0.121 * L.
	storageEnergyProfile(edge5, L, E) :- E is 0.005 * L.
	energyCost(edge5, 0.332).

node(cloud2, cloud, (168, 32, 8096)).
	totHW(cloud2, (193, 37, 9271)).
	pue(cloud2, 1.4).
	energySourceMix(cloud2, [(0.45,gas), (0.28,solar), (0.27,coal)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.071 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.421 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.055 * L.
	energyCost(cloud2, 0.22).

node(edge6, edge, (33, 9, 923)).
	totHW(edge6, (40, 12, 1108)).
	pue(edge6, 1.06).
	energySourceMix(edge6, [(0.65,coal), (0.35,solar)]).
	ramEnergyProfile(edge6, L, E) :- E is 0.021 * L.
	cpuEnergyProfile(edge6, L, E) :- E is 0.158 * L.
	storageEnergyProfile(edge6, L, E) :- E is 0.008 * L.
	energyCost(edge6, 0.166).

node(edge7, edge, (32, 9, 1332)).
	totHW(edge7, (34, 10, 1399)).
	pue(edge7, 1.16).
	energySourceMix(edge7, [(0.0,offshorewind), (1.0,gas)]).
	ramEnergyProfile(edge7, L, E) :- E is 0.017 * L.
	cpuEnergyProfile(edge7, L, E) :- E is 0.143 * L.
	storageEnergyProfile(edge7, L, E) :- E is 0.01 * L.
	energyCost(edge7, 0.21).

node(edge8, edge, (21, 9, 1449)).
	totHW(edge8, (29, 12, 1926)).
	pue(edge8, 1.14).
	energySourceMix(edge8, [(0.91,offshorewind), (0.09,gas)]).
	ramEnergyProfile(edge8, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge8, L, E) :- E is 0.144 * L.
	storageEnergyProfile(edge8, L, E) :- E is 0.018 * L.
	energyCost(edge8, 0.465).

node(edge9, edge, (15, 8, 778)).
	totHW(edge9, (21, 12, 1043)).
	pue(edge9, 1.08).
	energySourceMix(edge9, [(0.79,onshorewind), (0.13,solar), (0.07,gas)]).
	ramEnergyProfile(edge9, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge9, L, E) :- E is 0.17 * L.
	storageEnergyProfile(edge9, L, E) :- E is 0.008 * L.
	energyCost(edge9, 0.472).

node(edge10, edge, (32, 7, 995)).
	totHW(edge10, (40, 9, 1233)).
	pue(edge10, 1.16).
	energySourceMix(edge10, [(0.51,offshorewind), (0.49,coal)]).
	ramEnergyProfile(edge10, L, E) :- E is 0.02 * L.
	cpuEnergyProfile(edge10, L, E) :- E is 0.134 * L.
	storageEnergyProfile(edge10, L, E) :- E is 0.012 * L.
	energyCost(edge10, 0.235).

node(cloud3, cloud, (164, 35, 6241)).
	totHW(cloud3, (215, 47, 8179)).
	pue(cloud3, 1.46).
	energySourceMix(cloud3, [(0.23,solar), (0.14,coal), (0.63,offshorewind)]).
	ramEnergyProfile(cloud3, L, E) :- E is 0.065 * L.
	cpuEnergyProfile(cloud3, L, E) :- E is 0.538 * L.
	storageEnergyProfile(cloud3, L, E) :- E is 0.043 * L.
	energyCost(cloud3, 0.406).

node(edge11, edge, (31, 11, 859)).
	totHW(edge11, (36, 13, 968)).
	pue(edge11, 1.15).
	energySourceMix(edge11, [(0.28,solar), (0.72,coal)]).
	ramEnergyProfile(edge11, L, E) :- E is 0.017 * L.
	cpuEnergyProfile(edge11, L, E) :- E is 0.174 * L.
	storageEnergyProfile(edge11, L, E) :- E is 0.007 * L.
	energyCost(edge11, 0.142).

node(edge12, edge, (17, 8, 1006)).
	totHW(edge12, (22, 11, 1244)).
	pue(edge12, 1.07).
	energySourceMix(edge12, [(0.83,gas), (0.14,solar), (0.03,coal)]).
	ramEnergyProfile(edge12, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge12, L, E) :- E is 0.147 * L.
	storageEnergyProfile(edge12, L, E) :- E is 0.009 * L.
	energyCost(edge12, 0.235).

node(edge13, edge, (32, 10, 460)).
	totHW(edge13, (36, 12, 511)).
	pue(edge13, 1.11).
	energySourceMix(edge13, [(0.02,onshorewind), (0.98,offshorewind)]).
	ramEnergyProfile(edge13, L, E) :- E is 0.018 * L.
	cpuEnergyProfile(edge13, L, E) :- E is 0.164 * L.
	storageEnergyProfile(edge13, L, E) :- E is 0.004 * L.
	energyCost(edge13, 0.496).

node(edge14, edge, (29, 8, 1129)).
	totHW(edge14, (32, 9, 1244)).
	pue(edge14, 1.14).
	energySourceMix(edge14, [(0.35,coal), (0.29,gas), (0.37,onshorewind)]).
	ramEnergyProfile(edge14, L, E) :- E is 0.017 * L.
	cpuEnergyProfile(edge14, L, E) :- E is 0.117 * L.
	storageEnergyProfile(edge14, L, E) :- E is 0.008 * L.
	energyCost(edge14, 0.227).

node(edge15, edge, (31, 10, 790)).
	totHW(edge15, (33, 11, 836)).
	pue(edge15, 1.18).
	energySourceMix(edge15, [(0.69,onshorewind), (0.13,offshorewind), (0.19,solar)]).
	ramEnergyProfile(edge15, L, E) :- E is 0.018 * L.
	cpuEnergyProfile(edge15, L, E) :- E is 0.142 * L.
	storageEnergyProfile(edge15, L, E) :- E is 0.006 * L.
	energyCost(edge15, 0.495).

node(edge16, edge, (13, 6, 764)).
	totHW(edge16, (18, 9, 1003)).
	pue(edge16, 1.06).
	energySourceMix(edge16, [(0.11,offshorewind), (0.02,coal), (0.88,onshorewind)]).
	ramEnergyProfile(edge16, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge16, L, E) :- E is 0.112 * L.
	storageEnergyProfile(edge16, L, E) :- E is 0.006 * L.
	energyCost(edge16, 0.486).

node(edge17, edge, (27, 9, 1018)).
	totHW(edge17, (37, 12, 1349)).
	pue(edge17, 1.06).
	energySourceMix(edge17, [(0.74,onshorewind), (0.26,coal)]).
	ramEnergyProfile(edge17, L, E) :- E is 0.017 * L.
	cpuEnergyProfile(edge17, L, E) :- E is 0.171 * L.
	storageEnergyProfile(edge17, L, E) :- E is 0.011 * L.
	energyCost(edge17, 0.346).

node(cloud4, cloud, (215, 30, 7031)).
	totHW(cloud4, (290, 41, 7287)).
	pue(cloud4, 1.21).
	energySourceMix(cloud4, [(0.3,offshorewind), (0.46,coal), (0.25,gas)]).
	ramEnergyProfile(cloud4, L, E) :- E is 0.11 * L.
	cpuEnergyProfile(cloud4, L, E) :- E is 0.386 * L.
	storageEnergyProfile(cloud4, L, E) :- E is 0.037 * L.
	energyCost(cloud4, 0.191).

node(edge18, edge, (23, 12, 635)).
	totHW(edge18, (25, 13, 665)).
	pue(edge18, 1.14).
	energySourceMix(edge18, [(0.24,coal), (0.49,solar), (0.27,offshorewind)]).
	ramEnergyProfile(edge18, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge18, L, E) :- E is 0.179 * L.
	storageEnergyProfile(edge18, L, E) :- E is 0.005 * L.
	energyCost(edge18, 0.346).

node(cloud5, cloud, (330, 36, 6208)).
	totHW(cloud5, (406, 45, 7622)).
	pue(cloud5, 1.45).
	energySourceMix(cloud5, [(0.52,onshorewind), (0.18,gas), (0.3,offshorewind)]).
	ramEnergyProfile(cloud5, L, E) :- E is 0.161 * L.
	cpuEnergyProfile(cloud5, L, E) :- E is 0.453 * L.
	storageEnergyProfile(cloud5, L, E) :- E is 0.06 * L.
	energyCost(cloud5, 0.436).

node(edge19, edge, (27, 6, 935)).
	totHW(edge19, (35, 8, 1183)).
	pue(edge19, 1.07).
	energySourceMix(edge19, [(0.26,onshorewind), (0.58,solar), (0.16,coal)]).
	ramEnergyProfile(edge19, L, E) :- E is 0.017 * L.
	cpuEnergyProfile(edge19, L, E) :- E is 0.102 * L.
	storageEnergyProfile(edge19, L, E) :- E is 0.011 * L.
	energyCost(edge19, 0.389).

node(cloud6, cloud, (217, 28, 8436)).
	totHW(cloud6, (275, 36, 10673)).
	pue(cloud6, 1.23).
	energySourceMix(cloud6, [(0.67,offshorewind), (0.33,solar)]).
	ramEnergyProfile(cloud6, L, E) :- E is 0.096 * L.
	cpuEnergyProfile(cloud6, L, E) :- E is 0.377 * L.
	storageEnergyProfile(cloud6, L, E) :- E is 0.083 * L.
	energyCost(cloud6, 0.489).

link(edge1, cloud1, 49, 212).
link(cloud1, edge1, 49, 212).
link(edge1, edge5, 41, 194).
link(edge5, edge1, 41, 194).
link(edge1, cloud2, 59, 295).
link(cloud2, edge1, 59, 295).
link(edge1, edge7, 46, 178).
link(edge7, edge1, 46, 178).
link(edge1, edge9, 41, 156).
link(edge9, edge1, 41, 156).
link(edge1, edge10, 29, 136).
link(edge10, edge1, 29, 136).
link(edge1, cloud3, 35, 264).
link(cloud3, edge1, 35, 264).
link(edge1, edge15, 15, 141).
link(edge15, edge1, 15, 141).
link(edge1, edge16, 45, 186).
link(edge16, edge1, 45, 186).
link(edge1, edge18, 28, 151).
link(edge18, edge1, 28, 151).
link(edge1, cloud5, 31, 210).
link(cloud5, edge1, 31, 210).
link(edge1, edge19, 23, 195).
link(edge19, edge1, 23, 195).
link(edge2, edge1, 29, 138).
link(edge1, edge2, 29, 138).
link(edge3, edge1, 48, 174).
link(edge1, edge3, 48, 174).
link(edge4, edge1, 26, 128).
link(edge1, edge4, 26, 128).
link(edge6, edge1, 48, 155).
link(edge1, edge6, 48, 155).
link(edge17, edge1, 45, 154).
link(edge1, edge17, 45, 154).
link(edge1, edge8, 39, 146).
link(edge8, edge1, 39, 146).
link(edge1, edge11, 48, 158).
link(edge11, edge1, 48, 158).
link(edge1, edge12, 55, 198).
link(edge12, edge1, 55, 198).
link(edge1, edge13, 37, 187).
link(edge13, edge1, 37, 187).
link(edge1, edge14, 46, 182).
link(edge14, edge1, 46, 182).
link(edge1, cloud4, 68, 276).
link(cloud4, edge1, 68, 276).
link(edge1, cloud6, 39, 268).
link(cloud6, edge1, 39, 268).
link(edge2, edge4, 31, 185).
link(edge4, edge2, 31, 185).
link(edge2, edge5, 21, 127).
link(edge5, edge2, 21, 127).
link(edge2, edge8, 46, 115).
link(edge8, edge2, 46, 115).
link(edge2, edge9, 47, 102).
link(edge9, edge2, 47, 102).
link(edge2, edge10, 29, 156).
link(edge10, edge2, 29, 156).
link(edge2, cloud3, 44, 280).
link(cloud3, edge2, 44, 280).
link(edge2, edge11, 19, 114).
link(edge11, edge2, 19, 114).
link(edge2, edge14, 39, 199).
link(edge14, edge2, 39, 199).
link(edge2, edge15, 30, 127).
link(edge15, edge2, 30, 127).
link(edge2, edge16, 16, 167).
link(edge16, edge2, 16, 167).
link(edge2, cloud5, 73, 221).
link(cloud5, edge2, 73, 221).
link(edge3, edge2, 18, 192).
link(edge2, edge3, 18, 192).
link(cloud2, edge2, 26, 289).
link(edge2, cloud2, 26, 289).
link(edge7, edge2, 44, 137).
link(edge2, edge7, 44, 137).
link(cloud4, edge2, 74, 260).
link(edge2, cloud4, 74, 260).
link(edge19, edge2, 20, 151).
link(edge2, edge19, 20, 151).
link(edge2, cloud1, 43, 253).
link(cloud1, edge2, 43, 253).
link(edge2, edge6, 41, 126).
link(edge6, edge2, 41, 126).
link(edge2, edge12, 43, 123).
link(edge12, edge2, 43, 123).
link(edge2, edge13, 49, 164).
link(edge13, edge2, 49, 164).
link(edge2, edge17, 58, 139).
link(edge17, edge2, 58, 139).
link(edge2, edge18, 35, 199).
link(edge18, edge2, 35, 199).
link(edge2, cloud6, 50, 288).
link(cloud6, edge2, 50, 288).
link(edge3, edge6, 23, 195).
link(edge6, edge3, 23, 195).
link(edge3, edge9, 15, 150).
link(edge9, edge3, 15, 150).
link(edge3, edge16, 22, 122).
link(edge16, edge3, 22, 122).
link(edge3, cloud5, 46, 224).
link(cloud5, edge3, 46, 224).
link(edge3, edge19, 26, 140).
link(edge19, edge3, 26, 140).
link(edge3, cloud6, 73, 292).
link(cloud6, edge3, 73, 292).
link(edge4, edge3, 44, 171).
link(edge3, edge4, 44, 171).
link(edge10, edge3, 45, 182).
link(edge3, edge10, 45, 182).
link(cloud3, edge3, 48, 208).
link(edge3, cloud3, 48, 208).
link(edge12, edge3, 25, 148).
link(edge3, edge12, 25, 148).
link(edge13, edge3, 33, 118).
link(edge3, edge13, 33, 118).
link(edge14, edge3, 44, 138).
link(edge3, edge14, 44, 138).
link(edge17, edge3, 47, 107).
link(edge3, edge17, 47, 107).
link(edge18, edge3, 17, 194).
link(edge3, edge18, 17, 194).
link(edge3, cloud1, 55, 208).
link(cloud1, edge3, 55, 208).
link(edge3, edge5, 39, 187).
link(edge5, edge3, 39, 187).
link(edge3, cloud2, 44, 201).
link(cloud2, edge3, 44, 201).
link(edge3, edge7, 47, 107).
link(edge7, edge3, 47, 107).
link(edge3, edge8, 41, 120).
link(edge8, edge3, 41, 120).
link(edge3, edge11, 37, 107).
link(edge11, edge3, 37, 107).
link(edge3, edge15, 30, 150).
link(edge15, edge3, 30, 150).
link(edge3, cloud4, 63, 230).
link(cloud4, edge3, 63, 230).
link(edge4, edge9, 15, 125).
link(edge9, edge4, 15, 125).
link(edge4, cloud3, 58, 290).
link(cloud3, edge4, 58, 290).
link(edge4, edge13, 18, 134).
link(edge13, edge4, 18, 134).
link(edge4, edge14, 34, 169).
link(edge14, edge4, 34, 169).
link(edge4, cloud4, 44, 284).
link(cloud4, edge4, 44, 284).
link(edge4, cloud5, 63, 236).
link(cloud5, edge4, 63, 236).
link(edge4, edge19, 31, 155).
link(edge19, edge4, 31, 155).
link(edge4, cloud6, 28, 215).
link(cloud6, edge4, 28, 215).
link(cloud1, edge4, 31, 259).
link(edge4, cloud1, 31, 259).
link(edge6, edge4, 27, 170).
link(edge4, edge6, 27, 170).
link(edge11, edge4, 25, 160).
link(edge4, edge11, 25, 160).
link(edge4, edge5, 52, 156).
link(edge5, edge4, 52, 156).
link(edge4, cloud2, 48, 203).
link(cloud2, edge4, 48, 203).
link(edge4, edge7, 52, 102).
link(edge7, edge4, 52, 102).
link(edge4, edge8, 49, 109).
link(edge8, edge4, 49, 109).
link(edge4, edge10, 40, 101).
link(edge10, edge4, 40, 101).
link(edge4, edge12, 41, 148).
link(edge12, edge4, 41, 148).
link(edge4, edge15, 30, 188).
link(edge15, edge4, 30, 188).
link(edge4, edge16, 47, 195).
link(edge16, edge4, 47, 195).
link(edge4, edge17, 35, 107).
link(edge17, edge4, 35, 107).
link(edge4, edge18, 47, 116).
link(edge18, edge4, 47, 116).
link(cloud1, edge5, 53, 207).
link(edge5, cloud1, 53, 207).
link(cloud1, cloud2, 17, 448).
link(cloud2, cloud1, 17, 448).
link(cloud1, edge6, 79, 297).
link(edge6, cloud1, 79, 297).
link(cloud1, cloud3, 12, 830).
link(cloud3, cloud1, 12, 830).
link(cloud1, edge13, 71, 273).
link(edge13, cloud1, 71, 273).
link(cloud1, edge14, 39, 231).
link(edge14, cloud1, 39, 231).
link(cloud1, edge18, 61, 237).
link(edge18, cloud1, 61, 237).
link(edge7, cloud1, 47, 254).
link(cloud1, edge7, 47, 254).
link(edge9, cloud1, 78, 286).
link(cloud1, edge9, 78, 286).
link(edge11, cloud1, 60, 281).
link(cloud1, edge11, 60, 281).
link(edge16, cloud1, 78, 249).
link(cloud1, edge16, 78, 249).
link(edge17, cloud1, 70, 252).
link(cloud1, edge17, 70, 252).
link(cloud5, cloud1, 9, 886).
link(cloud1, cloud5, 9, 886).
link(cloud6, cloud1, 7, 886).
link(cloud1, cloud6, 7, 886).
link(cloud1, edge8, 59, 283).
link(edge8, cloud1, 59, 283).
link(cloud1, edge10, 54, 288).
link(edge10, cloud1, 54, 288).
link(cloud1, edge12, 43, 231).
link(edge12, cloud1, 43, 231).
link(cloud1, edge15, 55, 214).
link(edge15, cloud1, 55, 214).
link(cloud1, cloud4, 75, 886).
link(cloud4, cloud1, 75, 886).
link(cloud1, edge19, 48, 292).
link(edge19, cloud1, 48, 292).
link(edge5, edge12, 41, 115).
link(edge12, edge5, 41, 115).
link(edge5, edge15, 27, 142).
link(edge15, edge5, 27, 142).
link(edge7, edge5, 38, 141).
link(edge5, edge7, 38, 141).
link(edge8, edge5, 26, 193).
link(edge5, edge8, 26, 193).
link(edge9, edge5, 46, 134).
link(edge5, edge9, 46, 134).
link(edge10, edge5, 46, 179).
link(edge5, edge10, 46, 179).
link(edge11, edge5, 34, 199).
link(edge5, edge11, 34, 199).
link(cloud4, edge5, 27, 204).
link(edge5, cloud4, 27, 204).
link(cloud5, edge5, 76, 206).
link(edge5, cloud5, 76, 206).
link(edge5, cloud2, 47, 203).
link(cloud2, edge5, 47, 203).
link(edge5, edge6, 54, 186).
link(edge6, edge5, 54, 186).
link(edge5, cloud3, 60, 208).
link(cloud3, edge5, 60, 208).
link(edge5, edge13, 49, 153).
link(edge13, edge5, 49, 153).
link(edge5, edge14, 58, 117).
link(edge14, edge5, 58, 117).
link(edge5, edge16, 37, 119).
link(edge16, edge5, 37, 119).
link(edge5, edge17, 54, 147).
link(edge17, edge5, 54, 147).
link(edge5, edge18, 54, 127).
link(edge18, edge5, 54, 127).
link(edge5, edge19, 41, 142).
link(edge19, edge5, 41, 142).
link(edge5, cloud6, 60, 226).
link(cloud6, edge5, 60, 226).
link(cloud2, edge10, 37, 263).
link(edge10, cloud2, 37, 263).
link(cloud2, edge12, 27, 252).
link(edge12, cloud2, 27, 252).
link(cloud2, edge13, 66, 278).
link(edge13, cloud2, 66, 278).
link(cloud2, edge14, 38, 232).
link(edge14, cloud2, 38, 232).
link(cloud2, edge16, 68, 221).
link(edge16, cloud2, 68, 221).
link(cloud2, cloud5, 16, 510).
link(cloud5, cloud2, 16, 510).
link(edge6, cloud2, 70, 263).
link(cloud2, edge6, 70, 263).
link(edge8, cloud2, 72, 228).
link(cloud2, edge8, 72, 228).
link(cloud3, cloud2, 13, 403).
link(cloud2, cloud3, 13, 403).
link(edge17, cloud2, 63, 296).
link(cloud2, edge17, 63, 296).
link(edge18, cloud2, 57, 242).
link(cloud2, edge18, 57, 242).
link(cloud2, edge7, 54, 277).
link(edge7, cloud2, 54, 277).
link(cloud2, edge9, 54, 268).
link(edge9, cloud2, 54, 268).
link(cloud2, edge11, 45, 226).
link(edge11, cloud2, 45, 226).
link(cloud2, edge15, 56, 292).
link(edge15, cloud2, 56, 292).
link(cloud2, cloud4, 71, 756).
link(cloud4, cloud2, 71, 756).
link(cloud2, edge19, 46, 211).
link(edge19, cloud2, 46, 211).
link(cloud2, cloud6, 24, 692).
link(cloud6, cloud2, 24, 692).
link(edge6, edge7, 41, 146).
link(edge7, edge6, 41, 146).
link(edge6, edge8, 28, 133).
link(edge8, edge6, 28, 133).
link(edge6, edge9, 39, 194).
link(edge9, edge6, 39, 194).
link(edge6, edge11, 33, 185).
link(edge11, edge6, 33, 185).
link(edge6, edge12, 30, 114).
link(edge12, edge6, 30, 114).
link(edge6, edge15, 49, 159).
link(edge15, edge6, 49, 159).
link(edge6, edge19, 27, 144).
link(edge19, edge6, 27, 144).
link(cloud3, edge6, 35, 286).
link(edge6, cloud3, 35, 286).
link(edge14, edge6, 40, 148).
link(edge6, edge14, 40, 148).
link(cloud4, edge6, 68, 282).
link(edge6, cloud4, 68, 282).
link(edge18, edge6, 34, 196).
link(edge6, edge18, 34, 196).
link(edge6, edge10, 56, 132).
link(edge10, edge6, 56, 132).
link(edge6, edge13, 45, 164).
link(edge13, edge6, 45, 164).
link(edge6, edge16, 45, 156).
link(edge16, edge6, 45, 156).
link(edge6, edge17, 56, 110).
link(edge17, edge6, 56, 110).
link(edge6, cloud5, 50, 218).
link(cloud5, edge6, 50, 218).
link(edge6, cloud6, 54, 231).
link(cloud6, edge6, 54, 231).
link(edge7, edge8, 37, 140).
link(edge8, edge7, 37, 140).
link(edge7, edge14, 48, 146).
link(edge14, edge7, 48, 146).
link(edge7, cloud5, 62, 210).
link(cloud5, edge7, 62, 210).
link(edge7, cloud6, 63, 236).
link(cloud6, edge7, 63, 236).
link(edge9, edge7, 44, 122).
link(edge7, edge9, 44, 122).
link(edge12, edge7, 27, 197).
link(edge7, edge12, 27, 197).
link(edge19, edge7, 21, 132).
link(edge7, edge19, 21, 132).
link(edge7, edge10, 68, 190).
link(edge10, edge7, 68, 190).
link(edge7, cloud3, 58, 222).
link(cloud3, edge7, 58, 222).
link(edge7, edge11, 60, 130).
link(edge11, edge7, 60, 130).
link(edge7, edge13, 50, 198).
link(edge13, edge7, 50, 198).
link(edge7, edge15, 47, 171).
link(edge15, edge7, 47, 171).
link(edge7, edge16, 57, 104).
link(edge16, edge7, 57, 104).
link(edge7, edge17, 54, 181).
link(edge17, edge7, 54, 181).
link(edge7, cloud4, 65, 245).
link(cloud4, edge7, 65, 245).
link(edge7, edge18, 55, 141).
link(edge18, edge7, 55, 141).
link(edge8, edge9, 34, 196).
link(edge9, edge8, 34, 196).
link(edge8, edge10, 31, 111).
link(edge10, edge8, 31, 111).
link(edge8, edge12, 16, 105).
link(edge12, edge8, 16, 105).
link(edge8, edge15, 24, 106).
link(edge15, edge8, 24, 106).
link(edge8, edge17, 28, 168).
link(edge17, edge8, 28, 168).
link(edge8, cloud4, 52, 275).
link(cloud4, edge8, 52, 275).
link(edge8, edge19, 27, 120).
link(edge19, edge8, 27, 120).
link(edge16, edge8, 37, 118).
link(edge8, edge16, 37, 118).
link(edge18, edge8, 28, 146).
link(edge8, edge18, 28, 146).
link(edge8, cloud3, 47, 270).
link(cloud3, edge8, 47, 270).
link(edge8, edge11, 60, 198).
link(edge11, edge8, 60, 198).
link(edge8, edge13, 39, 167).
link(edge13, edge8, 39, 167).
link(edge8, edge14, 50, 167).
link(edge14, edge8, 50, 167).
link(edge8, cloud5, 59, 294).
link(cloud5, edge8, 59, 294).
link(edge8, cloud6, 66, 224).
link(cloud6, edge8, 66, 224).
link(edge9, cloud3, 66, 299).
link(cloud3, edge9, 66, 299).
link(edge9, edge14, 16, 111).
link(edge14, edge9, 16, 111).
link(edge9, edge15, 15, 189).
link(edge15, edge9, 15, 189).
link(edge9, edge16, 46, 188).
link(edge16, edge9, 46, 188).
link(edge9, cloud4, 60, 285).
link(cloud4, edge9, 60, 285).
link(edge9, edge18, 44, 172).
link(edge18, edge9, 44, 172).
link(edge9, cloud5, 71, 243).
link(cloud5, edge9, 71, 243).
link(edge9, edge10, 44, 189).
link(edge10, edge9, 44, 189).
link(edge9, edge11, 40, 137).
link(edge11, edge9, 40, 137).
link(edge9, edge12, 40, 178).
link(edge12, edge9, 40, 178).
link(edge9, edge13, 33, 107).
link(edge13, edge9, 33, 107).
link(edge9, edge17, 48, 192).
link(edge17, edge9, 48, 192).
link(edge9, edge19, 41, 130).
link(edge19, edge9, 41, 130).
link(edge9, cloud6, 43, 207).
link(cloud6, edge9, 43, 207).
link(edge10, edge14, 28, 185).
link(edge14, edge10, 28, 185).
link(edge10, edge15, 49, 176).
link(edge15, edge10, 49, 176).
link(edge10, edge18, 22, 153).
link(edge18, edge10, 22, 153).
link(cloud3, edge10, 60, 264).
link(edge10, cloud3, 60, 264).
link(edge11, edge10, 49, 174).
link(edge10, edge11, 49, 174).
link(edge13, edge10, 22, 130).
link(edge10, edge13, 22, 130).
link(edge17, edge10, 29, 175).
link(edge10, edge17, 29, 175).
link(cloud6, edge10, 58, 232).
link(edge10, cloud6, 58, 232).
link(edge10, edge12, 45, 121).
link(edge12, edge10, 45, 121).
link(edge10, edge16, 45, 103).
link(edge16, edge10, 45, 103).
link(edge10, cloud4, 71, 256).
link(cloud4, edge10, 71, 256).
link(edge10, cloud5, 53, 217).
link(cloud5, edge10, 53, 217).
link(edge10, edge19, 49, 129).
link(edge19, edge10, 49, 129).
link(cloud3, edge11, 52, 211).
link(edge11, cloud3, 52, 211).
link(cloud3, edge12, 31, 288).
link(edge12, cloud3, 31, 288).
link(cloud3, edge14, 61, 263).
link(edge14, cloud3, 61, 263).
link(cloud3, edge15, 69, 228).
link(edge15, cloud3, 69, 228).
link(cloud3, edge17, 33, 295).
link(edge17, cloud3, 33, 295).
link(edge18, cloud3, 65, 207).
link(cloud3, edge18, 65, 207).
link(cloud5, cloud3, 15, 973).
link(cloud3, cloud5, 15, 973).
link(cloud3, edge13, 50, 250).
link(edge13, cloud3, 50, 250).
link(cloud3, edge16, 55, 203).
link(edge16, cloud3, 55, 203).
link(cloud3, cloud4, 75, 700).
link(cloud4, cloud3, 75, 700).
link(cloud3, edge19, 58, 278).
link(edge19, cloud3, 58, 278).
link(cloud3, cloud6, 19, 636).
link(cloud6, cloud3, 19, 636).
link(edge11, cloud4, 26, 263).
link(cloud4, edge11, 26, 263).
link(edge11, edge19, 49, 171).
link(edge19, edge11, 49, 171).
link(edge16, edge11, 30, 130).
link(edge11, edge16, 30, 130).
link(cloud6, edge11, 75, 202).
link(edge11, cloud6, 75, 202).
link(edge11, edge12, 62, 134).
link(edge12, edge11, 62, 134).
link(edge11, edge13, 43, 194).
link(edge13, edge11, 43, 194).
link(edge11, edge14, 53, 100).
link(edge14, edge11, 53, 100).
link(edge11, edge15, 49, 110).
link(edge15, edge11, 49, 110).
link(edge11, edge17, 60, 123).
link(edge17, edge11, 60, 123).
link(edge11, edge18, 54, 154).
link(edge18, edge11, 54, 154).
link(edge11, cloud5, 61, 230).
link(cloud5, edge11, 61, 230).
link(edge12, edge13, 23, 116).
link(edge13, edge12, 23, 116).
link(edge12, edge14, 41, 159).
link(edge14, edge12, 41, 159).
link(edge12, cloud4, 75, 255).
link(cloud4, edge12, 75, 255).
link(edge12, edge18, 28, 126).
link(edge18, edge12, 28, 126).
link(edge12, cloud5, 57, 224).
link(cloud5, edge12, 57, 224).
link(edge12, edge19, 46, 154).
link(edge19, edge12, 46, 154).
link(edge17, edge12, 27, 113).
link(edge12, edge17, 27, 113).
link(cloud6, edge12, 56, 250).
link(edge12, cloud6, 56, 250).
link(edge12, edge15, 40, 123).
link(edge15, edge12, 40, 123).
link(edge12, edge16, 47, 175).
link(edge16, edge12, 47, 175).
link(edge15, edge13, 22, 173).
link(edge13, edge15, 22, 173).
link(edge17, edge13, 17, 185).
link(edge13, edge17, 17, 185).
link(cloud5, edge13, 64, 294).
link(edge13, cloud5, 64, 294).
link(edge13, edge14, 49, 187).
link(edge14, edge13, 49, 187).
link(edge13, edge16, 55, 112).
link(edge16, edge13, 55, 112).
link(edge13, cloud4, 59, 286).
link(cloud4, edge13, 59, 286).
link(edge13, edge18, 41, 186).
link(edge18, edge13, 41, 186).
link(edge13, edge19, 48, 165).
link(edge19, edge13, 48, 165).
link(edge13, cloud6, 46, 223).
link(cloud6, edge13, 46, 223).
link(edge14, edge15, 45, 152).
link(edge15, edge14, 45, 152).
link(edge14, edge16, 23, 177).
link(edge16, edge14, 23, 177).
link(edge14, edge17, 32, 183).
link(edge17, edge14, 32, 183).
link(edge14, cloud5, 55, 220).
link(cloud5, edge14, 55, 220).
link(edge14, cloud6, 40, 280).
link(cloud6, edge14, 40, 280).
link(cloud4, edge14, 48, 296).
link(edge14, cloud4, 48, 296).
link(edge14, edge18, 48, 114).
link(edge18, edge14, 48, 114).
link(edge14, edge19, 57, 178).
link(edge19, edge14, 57, 178).
link(edge15, edge16, 45, 138).
link(edge16, edge15, 45, 138).
link(edge15, edge17, 39, 106).
link(edge17, edge15, 39, 106).
link(cloud4, edge15, 78, 225).
link(edge15, cloud4, 78, 225).
link(edge19, edge15, 26, 146).
link(edge15, edge19, 26, 146).
link(edge15, edge18, 43, 147).
link(edge18, edge15, 43, 147).
link(edge15, cloud5, 46, 224).
link(cloud5, edge15, 46, 224).
link(edge15, cloud6, 54, 227).
link(cloud6, edge15, 54, 227).
link(edge16, cloud4, 65, 205).
link(cloud4, edge16, 65, 205).
link(edge16, edge19, 40, 125).
link(edge19, edge16, 40, 125).
link(edge16, edge17, 55, 128).
link(edge17, edge16, 55, 128).
link(edge16, edge18, 39, 197).
link(edge18, edge16, 39, 197).
link(edge16, cloud5, 58, 287).
link(cloud5, edge16, 58, 287).
link(edge16, cloud6, 63, 225).
link(cloud6, edge16, 63, 225).
link(edge17, edge18, 24, 102).
link(edge18, edge17, 24, 102).
link(cloud4, edge17, 42, 239).
link(edge17, cloud4, 42, 239).
link(edge17, cloud5, 48, 250).
link(cloud5, edge17, 48, 250).
link(edge17, edge19, 55, 107).
link(edge19, edge17, 55, 107).
link(edge17, cloud6, 52, 248).
link(cloud6, edge17, 52, 248).
link(cloud4, edge19, 46, 284).
link(edge19, cloud4, 46, 284).
link(edge18, cloud4, 52, 296).
link(cloud4, edge18, 52, 296).
link(cloud4, cloud5, 80, 804).
link(cloud5, cloud4, 80, 804).
link(cloud4, cloud6, 72, 417).
link(cloud6, cloud4, 72, 417).
link(edge18, edge19, 34, 168).
link(edge19, edge18, 34, 168).
link(edge18, cloud6, 74, 231).
link(cloud6, edge18, 74, 231).
link(edge18, cloud5, 59, 262).
link(cloud5, edge18, 59, 262).
link(edge19, cloud5, 49, 239).
link(cloud5, edge19, 49, 239).
link(cloud6, cloud5, 8, 808).
link(cloud5, cloud6, 8, 808).
link(cloud6, edge19, 41, 276).
link(edge19, cloud6, 41, 276).
link(N, N, 0, 100000).