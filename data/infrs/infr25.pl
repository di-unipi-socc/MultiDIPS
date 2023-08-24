:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

globalIntent(footprint, smaller, 7.261, kg).

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

node(edge1, edge, (16, 10, 1515)).
	totHW(edge1, (20, 13, 1843)).
	pue(edge1, 1.12).
	energySourceMix(edge1, [(0.26,coal), (0.74,offshorewind)]).
	ramEnergyProfile(edge1, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge1, L, E) :- E is 0.16 * L.
	storageEnergyProfile(edge1, L, E) :- E is 0.017 * L.
	energyCost(edge1, 0.072).

node(edge2, edge, (15, 7, 648)).
	totHW(edge2, (16, 8, 653)).
	pue(edge2, 1.07).
	energySourceMix(edge2, [(0.12,gas), (0.06,solar), (0.82,offshorewind)]).
	ramEnergyProfile(edge2, L, E) :- E is 0.008 * L.
	cpuEnergyProfile(edge2, L, E) :- E is 0.109 * L.
	storageEnergyProfile(edge2, L, E) :- E is 0.004 * L.
	energyCost(edge2, 0.519).

node(edge3, edge, (19, 11, 1233)).
	totHW(edge3, (26, 15, 1604)).
	pue(edge3, 1.08).
	energySourceMix(edge3, [(0.08,coal), (0.54,solar), (0.38,offshorewind)]).
	ramEnergyProfile(edge3, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge3, L, E) :- E is 0.19 * L.
	storageEnergyProfile(edge3, L, E) :- E is 0.011 * L.
	energyCost(edge3, 0.517).

node(cloud1, cloud, (120, 40, 6498)).
	totHW(cloud1, (134, 45, 7234)).
	pue(cloud1, 1.28).
	energySourceMix(cloud1, [(0.93,gas), (0.07,onshorewind)]).
	ramEnergyProfile(cloud1, L, E) :- E is 0.048 * L.
	cpuEnergyProfile(cloud1, L, E) :- E is 0.512 * L.
	storageEnergyProfile(cloud1, L, E) :- E is 0.055 * L.
	energyCost(cloud1, 0.064).

node(edge4, edge, (11, 8, 1357)).
	totHW(edge4, (16, 12, 1824)).
	pue(edge4, 1.06).
	energySourceMix(edge4, [(0.06,coal), (0.94,offshorewind)]).
	ramEnergyProfile(edge4, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge4, L, E) :- E is 0.147 * L.
	storageEnergyProfile(edge4, L, E) :- E is 0.016 * L.
	energyCost(edge4, 0.116).

node(cloud2, cloud, (125, 38, 6738)).
	totHW(cloud2, (143, 44, 7685)).
	pue(cloud2, 1.3).
	energySourceMix(cloud2, [(0.26,gas), (0.48,offshorewind), (0.27,solar)]).
	ramEnergyProfile(cloud2, L, E) :- E is 0.055 * L.
	cpuEnergyProfile(cloud2, L, E) :- E is 0.47 * L.
	storageEnergyProfile(cloud2, L, E) :- E is 0.039 * L.
	energyCost(cloud2, 0.409).

node(cloud3, cloud, (132, 36, 8329)).
	totHW(cloud3, (157, 43, 9854)).
	pue(cloud3, 1.21).
	energySourceMix(cloud3, [(0.67,solar), (0.12,onshorewind), (0.21,coal)]).
	ramEnergyProfile(cloud3, L, E) :- E is 0.053 * L.
	cpuEnergyProfile(cloud3, L, E) :- E is 0.487 * L.
	storageEnergyProfile(cloud3, L, E) :- E is 0.054 * L.
	energyCost(cloud3, 0.233).

node(edge5, edge, (17, 6, 968)).
	totHW(edge5, (22, 8, 1250)).
	pue(edge5, 1.19).
	energySourceMix(edge5, [(0.65,onshorewind), (0.35,offshorewind)]).
	ramEnergyProfile(edge5, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge5, L, E) :- E is 0.097 * L.
	storageEnergyProfile(edge5, L, E) :- E is 0.009 * L.
	energyCost(edge5, 0.166).

node(edge6, edge, (22, 9, 1104)).
	totHW(edge6, (29, 12, 1429)).
	pue(edge6, 1.16).
	energySourceMix(edge6, [(0.76,solar), (0.17,gas), (0.07,offshorewind)]).
	ramEnergyProfile(edge6, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge6, L, E) :- E is 0.156 * L.
	storageEnergyProfile(edge6, L, E) :- E is 0.009 * L.
	energyCost(edge6, 0.166).

node(edge7, edge, (14, 9, 707)).
	totHW(edge7, (19, 12, 932)).
	pue(edge7, 1.18).
	energySourceMix(edge7, [(0.17,onshorewind), (0.14,coal), (0.7,gas)]).
	ramEnergyProfile(edge7, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge7, L, E) :- E is 0.162 * L.
	storageEnergyProfile(edge7, L, E) :- E is 0.006 * L.
	energyCost(edge7, 0.494).

node(edge8, edge, (26, 6, 1166)).
	totHW(edge8, (30, 8, 1339)).
	pue(edge8, 1.17).
	energySourceMix(edge8, [(0.78,offshorewind), (0.22,coal)]).
	ramEnergyProfile(edge8, L, E) :- E is 0.016 * L.
	cpuEnergyProfile(edge8, L, E) :- E is 0.098 * L.
	storageEnergyProfile(edge8, L, E) :- E is 0.009 * L.
	energyCost(edge8, 0.329).

node(edge9, edge, (24, 11, 706)).
	totHW(edge9, (26, 12, 747)).
	pue(edge9, 1.05).
	energySourceMix(edge9, [(0.5,coal), (0.22,offshorewind), (0.28,solar)]).
	ramEnergyProfile(edge9, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge9, L, E) :- E is 0.152 * L.
	storageEnergyProfile(edge9, L, E) :- E is 0.007 * L.
	energyCost(edge9, 0.29).

node(cloud4, cloud, (227, 32, 10233)).
	totHW(cloud4, (230, 33, 10337)).
	pue(cloud4, 1.41).
	energySourceMix(cloud4, [(0.61,solar), (0.39,coal)]).
	ramEnergyProfile(cloud4, L, E) :- E is 0.086 * L.
	cpuEnergyProfile(cloud4, L, E) :- E is 0.356 * L.
	storageEnergyProfile(cloud4, L, E) :- E is 0.053 * L.
	energyCost(cloud4, 0.072).

node(edge10, edge, (16, 8, 678)).
	totHW(edge10, (22, 12, 915)).
	pue(edge10, 1.13).
	energySourceMix(edge10, [(0.04,offshorewind), (0.96,gas)]).
	ramEnergyProfile(edge10, L, E) :- E is 0.01 * L.
	cpuEnergyProfile(edge10, L, E) :- E is 0.163 * L.
	storageEnergyProfile(edge10, L, E) :- E is 0.009 * L.
	energyCost(edge10, 0.072).

node(edge11, edge, (24, 10, 855)).
	totHW(edge11, (31, 14, 1092)).
	pue(edge11, 1.09).
	energySourceMix(edge11, [(0.66,onshorewind), (0.07,offshorewind), (0.27,solar)]).
	ramEnergyProfile(edge11, L, E) :- E is 0.016 * L.
	cpuEnergyProfile(edge11, L, E) :- E is 0.179 * L.
	storageEnergyProfile(edge11, L, E) :- E is 0.011 * L.
	energyCost(edge11, 0.276).

node(edge12, edge, (18, 8, 379)).
	totHW(edge12, (24, 11, 503)).
	pue(edge12, 1.09).
	energySourceMix(edge12, [(0.12,solar), (0.59,coal), (0.28,offshorewind)]).
	ramEnergyProfile(edge12, L, E) :- E is 0.012 * L.
	cpuEnergyProfile(edge12, L, E) :- E is 0.142 * L.
	storageEnergyProfile(edge12, L, E) :- E is 0.004 * L.
	energyCost(edge12, 0.349).

node(cloud5, cloud, (207, 34, 5242)).
	totHW(cloud5, (230, 38, 5799)).
	pue(cloud5, 1.44).
	energySourceMix(cloud5, [(0.5,onshorewind), (0.29,offshorewind), (0.21,gas)]).
	ramEnergyProfile(cloud5, L, E) :- E is 0.09 * L.
	cpuEnergyProfile(cloud5, L, E) :- E is 0.41 * L.
	storageEnergyProfile(cloud5, L, E) :- E is 0.046 * L.
	energyCost(cloud5, 0.233).

node(edge13, edge, (19, 10, 974)).
	totHW(edge13, (21, 11, 1043)).
	pue(edge13, 1.06).
	energySourceMix(edge13, [(0.53,gas), (0.47,offshorewind)]).
	ramEnergyProfile(edge13, L, E) :- E is 0.011 * L.
	cpuEnergyProfile(edge13, L, E) :- E is 0.148 * L.
	storageEnergyProfile(edge13, L, E) :- E is 0.006 * L.
	energyCost(edge13, 0.097).

node(edge14, edge, (19, 11, 539)).
	totHW(edge14, (23, 13, 628)).
	pue(edge14, 1.08).
	energySourceMix(edge14, [(0.87,coal), (0.13,offshorewind)]).
	ramEnergyProfile(edge14, L, E) :- E is 0.013 * L.
	cpuEnergyProfile(edge14, L, E) :- E is 0.19 * L.
	storageEnergyProfile(edge14, L, E) :- E is 0.005 * L.
	energyCost(edge14, 0.218).

node(edge15, edge, (15, 11, 1295)).
	totHW(edge15, (16, 12, 1336)).
	pue(edge15, 1.15).
	energySourceMix(edge15, [(0.15,coal), (0.75,gas), (0.11,solar)]).
	ramEnergyProfile(edge15, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge15, L, E) :- E is 0.152 * L.
	storageEnergyProfile(edge15, L, E) :- E is 0.011 * L.
	energyCost(edge15, 0.494).

node(cloud6, cloud, (123, 38, 6403)).
	totHW(cloud6, (137, 43, 7093)).
	pue(cloud6, 1.18).
	energySourceMix(cloud6, [(0.99,gas), (0.01,coal)]).
	ramEnergyProfile(cloud6, L, E) :- E is 0.054 * L.
	cpuEnergyProfile(cloud6, L, E) :- E is 0.402 * L.
	storageEnergyProfile(cloud6, L, E) :- E is 0.056 * L.
	energyCost(cloud6, 0.417).

node(edge16, edge, (14, 9, 424)).
	totHW(edge16, (18, 12, 511)).
	pue(edge16, 1.06).
	energySourceMix(edge16, [(0.24,offshorewind), (0.17,gas), (0.58,solar)]).
	ramEnergyProfile(edge16, L, E) :- E is 0.009 * L.
	cpuEnergyProfile(edge16, L, E) :- E is 0.156 * L.
	storageEnergyProfile(edge16, L, E) :- E is 0.005 * L.
	energyCost(edge16, 0.494).

node(edge17, edge, (23, 9, 1179)).
	totHW(edge17, (30, 12, 1497)).
	pue(edge17, 1.18).
	energySourceMix(edge17, [(0.48,coal), (0.19,offshorewind), (0.32,onshorewind)]).
	ramEnergyProfile(edge17, L, E) :- E is 0.016 * L.
	cpuEnergyProfile(edge17, L, E) :- E is 0.175 * L.
	storageEnergyProfile(edge17, L, E) :- E is 0.011 * L.
	energyCost(edge17, 0.064).

node(edge18, edge, (20, 8, 425)).
	totHW(edge18, (26, 11, 543)).
	pue(edge18, 1.12).
	energySourceMix(edge18, [(0.7,solar), (0.3,coal)]).
	ramEnergyProfile(edge18, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge18, L, E) :- E is 0.163 * L.
	storageEnergyProfile(edge18, L, E) :- E is 0.005 * L.
	energyCost(edge18, 0.072).

node(edge19, edge, (20, 8, 1353)).
	totHW(edge19, (25, 10, 1655)).
	pue(edge19, 1.18).
	energySourceMix(edge19, [(0.27,solar), (0.73,coal)]).
	ramEnergyProfile(edge19, L, E) :- E is 0.014 * L.
	cpuEnergyProfile(edge19, L, E) :- E is 0.14 * L.
	storageEnergyProfile(edge19, L, E) :- E is 0.014 * L.
	energyCost(edge19, 0.064).

link(edge1, edge2, 29, 156).
link(edge2, edge1, 29, 156).
link(edge1, cloud1, 72, 297).
link(cloud1, edge1, 72, 297).
link(edge1, cloud2, 65, 297).
link(cloud2, edge1, 65, 297).
link(edge1, cloud3, 78, 249).
link(cloud3, edge1, 78, 249).
link(edge1, edge7, 35, 185).
link(edge7, edge1, 35, 185).
link(edge1, edge10, 32, 190).
link(edge10, edge1, 32, 190).
link(edge1, edge11, 12, 125).
link(edge11, edge1, 12, 125).
link(edge1, edge13, 18, 147).
link(edge13, edge1, 18, 147).
link(edge1, edge14, 16, 151).
link(edge14, edge1, 16, 151).
link(edge1, edge15, 31, 197).
link(edge15, edge1, 31, 197).
link(edge1, cloud6, 75, 241).
link(cloud6, edge1, 75, 241).
link(edge1, edge16, 22, 135).
link(edge16, edge1, 22, 135).
link(edge1, edge17, 34, 171).
link(edge17, edge1, 34, 171).
link(edge1, edge19, 32, 147).
link(edge19, edge1, 32, 147).
link(edge3, edge1, 24, 129).
link(edge1, edge3, 24, 129).
link(edge6, edge1, 25, 170).
link(edge1, edge6, 25, 170).
link(edge8, edge1, 14, 130).
link(edge1, edge8, 14, 130).
link(edge9, edge1, 24, 168).
link(edge1, edge9, 24, 168).
link(cloud4, edge1, 72, 271).
link(edge1, cloud4, 72, 271).
link(edge18, edge1, 11, 155).
link(edge1, edge18, 11, 155).
link(edge1, edge4, 22, 142).
link(edge4, edge1, 22, 142).
link(edge1, edge5, 31, 172).
link(edge5, edge1, 31, 172).
link(edge1, edge12, 33, 121).
link(edge12, edge1, 33, 121).
link(edge1, cloud5, 70, 220).
link(cloud5, edge1, 70, 220).
link(edge2, edge3, 10, 115).
link(edge3, edge2, 10, 115).
link(edge2, cloud1, 73, 205).
link(cloud1, edge2, 73, 205).
link(edge2, edge7, 41, 196).
link(edge7, edge2, 41, 196).
link(edge2, edge8, 34, 166).
link(edge8, edge2, 34, 166).
link(edge2, edge9, 15, 163).
link(edge9, edge2, 15, 163).
link(edge2, edge11, 17, 173).
link(edge11, edge2, 17, 173).
link(edge2, edge13, 27, 102).
link(edge13, edge2, 27, 102).
link(edge2, edge17, 15, 161).
link(edge17, edge2, 15, 161).
link(edge2, edge19, 20, 147).
link(edge19, edge2, 20, 147).
link(edge4, edge2, 27, 191).
link(edge2, edge4, 27, 191).
link(cloud3, edge2, 57, 258).
link(edge2, cloud3, 57, 258).
link(cloud4, edge2, 63, 244).
link(edge2, cloud4, 63, 244).
link(edge10, edge2, 26, 174).
link(edge2, edge10, 26, 174).
link(cloud5, edge2, 71, 242).
link(edge2, cloud5, 71, 242).
link(edge16, edge2, 21, 138).
link(edge2, edge16, 21, 138).
link(edge18, edge2, 19, 152).
link(edge2, edge18, 19, 152).
link(edge2, cloud2, 74, 212).
link(cloud2, edge2, 74, 212).
link(edge2, edge5, 41, 170).
link(edge5, edge2, 41, 170).
link(edge2, edge6, 29, 122).
link(edge6, edge2, 29, 122).
link(edge2, edge12, 40, 152).
link(edge12, edge2, 40, 152).
link(edge2, edge14, 34, 149).
link(edge14, edge2, 34, 149).
link(edge2, edge15, 21, 108).
link(edge15, edge2, 21, 108).
link(edge2, cloud6, 70, 294).
link(cloud6, edge2, 70, 294).
link(edge3, cloud1, 66, 234).
link(cloud1, edge3, 66, 234).
link(edge3, cloud3, 67, 232).
link(cloud3, edge3, 67, 232).
link(edge3, edge5, 36, 188).
link(edge5, edge3, 36, 188).
link(edge3, edge6, 21, 193).
link(edge6, edge3, 21, 193).
link(edge3, edge8, 31, 111).
link(edge8, edge3, 31, 111).
link(edge3, edge9, 25, 138).
link(edge9, edge3, 25, 138).
link(edge3, edge11, 12, 114).
link(edge11, edge3, 12, 114).
link(edge3, edge12, 38, 162).
link(edge12, edge3, 38, 162).
link(edge3, edge15, 11, 105).
link(edge15, edge3, 11, 105).
link(edge3, edge16, 31, 192).
link(edge16, edge3, 31, 192).
link(edge3, edge17, 11, 138).
link(edge17, edge3, 11, 138).
link(cloud4, edge3, 67, 261).
link(edge3, cloud4, 67, 261).
link(edge13, edge3, 37, 103).
link(edge3, edge13, 37, 103).
link(cloud6, edge3, 60, 278).
link(edge3, cloud6, 60, 278).
link(edge18, edge3, 29, 138).
link(edge3, edge18, 29, 138).
link(edge19, edge3, 29, 169).
link(edge3, edge19, 29, 169).
link(edge3, edge4, 22, 108).
link(edge4, edge3, 22, 108).
link(edge3, cloud2, 73, 239).
link(cloud2, edge3, 73, 239).
link(edge3, edge7, 43, 116).
link(edge7, edge3, 43, 116).
link(edge3, edge10, 22, 172).
link(edge10, edge3, 22, 172).
link(edge3, cloud5, 76, 209).
link(cloud5, edge3, 76, 209).
link(edge3, edge14, 31, 148).
link(edge14, edge3, 31, 148).
link(cloud1, edge4, 64, 226).
link(edge4, cloud1, 64, 226).
link(cloud1, cloud2, 7, 405).
link(cloud2, cloud1, 7, 405).
link(cloud1, edge7, 75, 217).
link(edge7, cloud1, 75, 217).
link(cloud1, edge8, 67, 236).
link(edge8, cloud1, 67, 236).
link(cloud1, edge9, 75, 287).
link(edge9, cloud1, 75, 287).
link(cloud1, edge10, 72, 250).
link(edge10, cloud1, 72, 250).
link(cloud1, edge12, 62, 215).
link(edge12, cloud1, 62, 215).
link(cloud3, cloud1, 16, 528).
link(cloud1, cloud3, 16, 528).
link(edge6, cloud1, 56, 272).
link(cloud1, edge6, 56, 272).
link(edge11, cloud1, 66, 240).
link(cloud1, edge11, 66, 240).
link(cloud5, cloud1, 12, 603).
link(cloud1, cloud5, 12, 603).
link(edge14, cloud1, 66, 214).
link(cloud1, edge14, 66, 214).
link(cloud6, cloud1, 6, 555).
link(cloud1, cloud6, 6, 555).
link(edge16, cloud1, 75, 246).
link(cloud1, edge16, 75, 246).
link(edge17, cloud1, 70, 256).
link(cloud1, edge17, 70, 256).
link(cloud1, edge5, 60, 203).
link(edge5, cloud1, 60, 203).
link(cloud1, cloud4, 18, 831).
link(cloud4, cloud1, 18, 831).
link(cloud1, edge13, 78, 243).
link(edge13, cloud1, 78, 243).
link(cloud1, edge15, 66, 260).
link(edge15, cloud1, 66, 260).
link(cloud1, edge18, 70, 268).
link(edge18, cloud1, 70, 268).
link(cloud1, edge19, 79, 233).
link(edge19, cloud1, 79, 233).
link(edge4, cloud3, 80, 226).
link(cloud3, edge4, 80, 226).
link(edge4, edge5, 30, 108).
link(edge5, edge4, 30, 108).
link(edge4, edge9, 27, 129).
link(edge9, edge4, 27, 129).
link(edge4, cloud4, 82, 226).
link(cloud4, edge4, 82, 226).
link(edge4, edge10, 16, 189).
link(edge10, edge4, 16, 189).
link(edge4, edge11, 10, 107).
link(edge11, edge4, 10, 107).
link(edge4, edge12, 23, 152).
link(edge12, edge4, 23, 152).
link(edge4, edge13, 31, 146).
link(edge13, edge4, 31, 146).
link(edge4, edge14, 26, 156).
link(edge14, edge4, 26, 156).
link(edge4, edge15, 19, 159).
link(edge15, edge4, 19, 159).
link(edge4, cloud6, 58, 262).
link(cloud6, edge4, 58, 262).
link(edge4, edge17, 25, 130).
link(edge17, edge4, 25, 130).
link(edge4, edge18, 11, 132).
link(edge18, edge4, 11, 132).
link(edge4, edge19, 32, 122).
link(edge19, edge4, 32, 122).
link(cloud2, edge4, 71, 220).
link(edge4, cloud2, 71, 220).
link(cloud5, edge4, 74, 238).
link(edge4, cloud5, 74, 238).
link(edge4, edge6, 25, 190).
link(edge6, edge4, 25, 190).
link(edge4, edge7, 36, 197).
link(edge7, edge4, 36, 197).
link(edge4, edge8, 34, 179).
link(edge8, edge4, 34, 179).
link(edge4, edge16, 37, 117).
link(edge16, edge4, 37, 117).
link(cloud2, edge6, 63, 234).
link(edge6, cloud2, 63, 234).
link(cloud2, edge9, 82, 206).
link(edge9, cloud2, 82, 206).
link(cloud2, edge10, 79, 201).
link(edge10, cloud2, 79, 201).
link(cloud2, edge11, 73, 200).
link(edge11, cloud2, 73, 200).
link(cloud2, cloud5, 5, 800).
link(cloud5, cloud2, 5, 800).
link(cloud2, edge13, 80, 289).
link(edge13, cloud2, 80, 289).
link(cloud2, edge14, 68, 259).
link(edge14, cloud2, 68, 259).
link(cloud2, edge17, 77, 223).
link(edge17, cloud2, 77, 223).
link(cloud2, edge19, 72, 267).
link(edge19, cloud2, 72, 267).
link(edge5, cloud2, 53, 227).
link(cloud2, edge5, 53, 227).
link(cloud4, cloud2, 11, 657).
link(cloud2, cloud4, 11, 657).
link(edge15, cloud2, 73, 224).
link(cloud2, edge15, 73, 224).
link(edge16, cloud2, 81, 248).
link(cloud2, edge16, 81, 248).
link(cloud2, cloud3, 17, 964).
link(cloud3, cloud2, 17, 964).
link(cloud2, edge7, 76, 287).
link(edge7, cloud2, 76, 287).
link(cloud2, edge8, 69, 209).
link(edge8, cloud2, 69, 209).
link(cloud2, edge12, 64, 247).
link(edge12, cloud2, 64, 247).
link(cloud2, cloud6, 13, 472).
link(cloud6, cloud2, 13, 472).
link(cloud2, edge18, 76, 241).
link(edge18, cloud2, 76, 241).
link(cloud3, edge7, 59, 202).
link(edge7, cloud3, 59, 202).
link(cloud3, edge8, 64, 218).
link(edge8, cloud3, 64, 218).
link(cloud3, edge9, 72, 201).
link(edge9, cloud3, 72, 201).
link(cloud3, cloud5, 14, 693).
link(cloud5, cloud3, 14, 693).
link(cloud3, edge13, 76, 239).
link(edge13, cloud3, 76, 239).
link(cloud3, edge14, 76, 209).
link(edge14, cloud3, 76, 209).
link(cloud3, edge16, 64, 260).
link(edge16, cloud3, 64, 260).
link(edge5, cloud3, 70, 256).
link(cloud3, edge5, 70, 256).
link(cloud4, cloud3, 6, 649).
link(cloud3, cloud4, 6, 649).
link(edge12, cloud3, 72, 240).
link(cloud3, edge12, 72, 240).
link(edge19, cloud3, 74, 209).
link(cloud3, edge19, 74, 209).
link(cloud3, edge6, 72, 236).
link(edge6, cloud3, 72, 236).
link(cloud3, edge10, 82, 238).
link(edge10, cloud3, 82, 238).
link(cloud3, edge11, 74, 295).
link(edge11, cloud3, 74, 295).
link(cloud3, edge15, 78, 251).
link(edge15, cloud3, 78, 251).
link(cloud3, cloud6, 22, 481).
link(cloud6, cloud3, 22, 481).
link(cloud3, edge17, 72, 290).
link(edge17, cloud3, 72, 290).
link(cloud3, edge18, 76, 222).
link(edge18, cloud3, 76, 222).
link(edge5, edge7, 24, 115).
link(edge7, edge5, 24, 115).
link(edge5, edge8, 27, 101).
link(edge8, edge5, 27, 101).
link(edge5, cloud4, 64, 204).
link(cloud4, edge5, 64, 204).
link(edge5, edge10, 39, 160).
link(edge10, edge5, 39, 160).
link(edge5, edge11, 24, 172).
link(edge11, edge5, 24, 172).
link(edge5, edge12, 11, 173).
link(edge12, edge5, 11, 173).
link(edge5, edge14, 15, 183).
link(edge14, edge5, 15, 183).
link(edge5, cloud6, 66, 237).
link(cloud6, edge5, 66, 237).
link(edge5, edge16, 28, 173).
link(edge16, edge5, 28, 173).
link(edge5, edge18, 25, 161).
link(edge18, edge5, 25, 161).
link(edge6, edge5, 25, 194).
link(edge5, edge6, 25, 194).
link(edge9, edge5, 36, 147).
link(edge5, edge9, 36, 147).
link(cloud5, edge5, 56, 224).
link(edge5, cloud5, 56, 224).
link(edge15, edge5, 31, 193).
link(edge5, edge15, 31, 193).
link(edge19, edge5, 29, 125).
link(edge5, edge19, 29, 125).
link(edge5, edge13, 27, 127).
link(edge13, edge5, 27, 127).
link(edge5, edge17, 39, 187).
link(edge17, edge5, 39, 187).
link(edge6, edge7, 38, 175).
link(edge7, edge6, 38, 175).
link(edge6, cloud4, 73, 292).
link(cloud4, edge6, 73, 292).
link(edge6, edge11, 29, 108).
link(edge11, edge6, 29, 108).
link(edge6, edge12, 36, 115).
link(edge12, edge6, 36, 115).
link(edge6, edge13, 22, 161).
link(edge13, edge6, 22, 161).
link(edge6, edge14, 10, 156).
link(edge14, edge6, 10, 156).
link(edge6, edge17, 14, 164).
link(edge17, edge6, 14, 164).
link(edge6, edge18, 14, 118).
link(edge18, edge6, 14, 118).
link(edge6, edge19, 24, 182).
link(edge19, edge6, 24, 182).
link(edge9, edge6, 19, 178).
link(edge6, edge9, 19, 178).
link(edge10, edge6, 16, 177).
link(edge6, edge10, 16, 177).
link(cloud5, edge6, 66, 213).
link(edge6, cloud5, 66, 213).
link(edge15, edge6, 10, 143).
link(edge6, edge15, 10, 143).
link(cloud6, edge6, 50, 239).
link(edge6, cloud6, 50, 239).
link(edge16, edge6, 19, 135).
link(edge6, edge16, 19, 135).
link(edge6, edge8, 22, 170).
link(edge8, edge6, 22, 170).
link(edge7, edge8, 32, 108).
link(edge8, edge7, 32, 108).
link(edge7, edge9, 38, 169).
link(edge9, edge7, 38, 169).
link(edge7, edge12, 13, 163).
link(edge12, edge7, 13, 163).
link(edge7, cloud5, 73, 278).
link(cloud5, edge7, 73, 278).
link(edge7, edge14, 29, 182).
link(edge14, edge7, 29, 182).
link(edge7, edge15, 32, 155).
link(edge15, edge7, 32, 155).
link(edge7, edge17, 42, 157).
link(edge17, edge7, 42, 157).
link(edge13, edge7, 17, 157).
link(edge7, edge13, 17, 157).
link(cloud6, edge7, 81, 233).
link(edge7, cloud6, 81, 233).
link(edge18, edge7, 42, 187).
link(edge7, edge18, 42, 187).
link(edge19, edge7, 21, 102).
link(edge7, edge19, 21, 102).
link(edge7, cloud4, 65, 214).
link(cloud4, edge7, 65, 214).
link(edge7, edge10, 32, 198).
link(edge10, edge7, 32, 198).
link(edge7, edge11, 46, 108).
link(edge11, edge7, 46, 108).
link(edge7, edge16, 39, 170).
link(edge16, edge7, 39, 170).
link(edge8, cloud4, 58, 240).
link(cloud4, edge8, 58, 240).
link(edge8, edge10, 18, 124).
link(edge10, edge8, 18, 124).
link(edge8, edge11, 26, 152).
link(edge11, edge8, 26, 152).
link(edge8, edge15, 24, 143).
link(edge15, edge8, 24, 143).
link(edge8, cloud6, 72, 238).
link(cloud6, edge8, 72, 238).
link(edge8, edge16, 13, 162).
link(edge16, edge8, 13, 162).
link(edge8, edge17, 20, 161).
link(edge17, edge8, 20, 161).
link(edge8, edge19, 26, 121).
link(edge19, edge8, 26, 121).
link(edge12, edge8, 19, 184).
link(edge8, edge12, 19, 184).
link(cloud5, edge8, 71, 232).
link(edge8, cloud5, 71, 232).
link(edge14, edge8, 12, 180).
link(edge8, edge14, 12, 180).
link(edge8, edge9, 24, 157).
link(edge9, edge8, 24, 157).
link(edge8, edge13, 24, 108).
link(edge13, edge8, 24, 108).
link(edge8, edge18, 25, 156).
link(edge18, edge8, 25, 156).
link(edge9, edge12, 25, 101).
link(edge12, edge9, 25, 101).
link(edge9, edge14, 29, 182).
link(edge14, edge9, 29, 182).
link(edge9, cloud6, 69, 203).
link(cloud6, edge9, 69, 203).
link(edge9, edge16, 11, 181).
link(edge16, edge9, 11, 181).
link(edge9, edge18, 33, 113).
link(edge18, edge9, 33, 113).
link(cloud4, edge9, 78, 247).
link(edge9, cloud4, 78, 247).
link(edge10, edge9, 11, 116).
link(edge9, edge10, 11, 116).
link(cloud5, edge9, 85, 269).
link(edge9, cloud5, 85, 269).
link(edge13, edge9, 26, 139).
link(edge9, edge13, 26, 139).
link(edge15, edge9, 22, 196).
link(edge9, edge15, 22, 196).
link(edge9, edge11, 32, 176).
link(edge11, edge9, 32, 176).
link(edge9, edge17, 30, 114).
link(edge17, edge9, 30, 114).
link(edge9, edge19, 35, 133).
link(edge19, edge9, 35, 133).
link(cloud4, cloud5, 13, 663).
link(cloud5, cloud4, 13, 663).
link(cloud4, edge18, 82, 243).
link(edge18, cloud4, 82, 243).
link(edge10, cloud4, 76, 242).
link(cloud4, edge10, 76, 242).
link(edge11, cloud4, 79, 229).
link(cloud4, edge11, 79, 229).
link(edge13, cloud4, 82, 278).
link(cloud4, edge13, 82, 278).
link(edge17, cloud4, 78, 278).
link(cloud4, edge17, 78, 278).
link(edge19, cloud4, 80, 229).
link(cloud4, edge19, 80, 229).
link(cloud4, edge12, 75, 269).
link(edge12, cloud4, 75, 269).
link(cloud4, edge14, 70, 276).
link(edge14, cloud4, 70, 276).
link(cloud4, edge15, 78, 233).
link(edge15, cloud4, 78, 233).
link(cloud4, cloud6, 24, 881).
link(cloud6, cloud4, 24, 881).
link(cloud4, edge16, 70, 217).
link(edge16, cloud4, 70, 217).
link(edge10, edge12, 28, 194).
link(edge12, edge10, 28, 194).
link(edge10, cloud5, 82, 262).
link(cloud5, edge10, 82, 262).
link(edge10, edge13, 15, 100).
link(edge13, edge10, 15, 100).
link(edge10, edge14, 26, 140).
link(edge14, edge10, 26, 140).
link(edge10, edge15, 11, 125).
link(edge15, edge10, 11, 125).
link(edge10, edge16, 22, 163).
link(edge16, edge10, 22, 163).
link(edge10, edge17, 22, 146).
link(edge17, edge10, 22, 146).
link(edge10, edge18, 27, 163).
link(edge18, edge10, 27, 163).
link(cloud6, edge10, 66, 222).
link(edge10, cloud6, 66, 222).
link(edge19, edge10, 32, 148).
link(edge10, edge19, 32, 148).
link(edge10, edge11, 26, 162).
link(edge11, edge10, 26, 162).
link(edge11, cloud5, 68, 233).
link(cloud5, edge11, 68, 233).
link(edge11, edge13, 30, 193).
link(edge13, edge11, 30, 193).
link(edge11, edge15, 19, 195).
link(edge15, edge11, 19, 195).
link(edge11, cloud6, 68, 244).
link(cloud6, edge11, 68, 244).
link(edge12, edge11, 33, 158).
link(edge11, edge12, 33, 158).
link(edge11, edge14, 28, 125).
link(edge14, edge11, 28, 125).
link(edge11, edge16, 34, 118).
link(edge16, edge11, 34, 118).
link(edge11, edge17, 23, 175).
link(edge17, edge11, 23, 175).
link(edge11, edge18, 21, 154).
link(edge18, edge11, 21, 154).
link(edge11, edge19, 37, 132).
link(edge19, edge11, 37, 132).
link(edge12, cloud5, 63, 223).
link(cloud5, edge12, 63, 223).
link(edge12, edge15, 39, 105).
link(edge15, edge12, 39, 105).
link(edge12, edge16, 26, 159).
link(edge16, edge12, 26, 159).
link(edge12, edge18, 34, 139).
link(edge18, edge12, 34, 139).
link(edge12, edge19, 27, 159).
link(edge19, edge12, 27, 159).
link(edge13, edge12, 21, 179).
link(edge12, edge13, 21, 179).
link(edge14, edge12, 26, 123).
link(edge12, edge14, 26, 123).
link(cloud6, edge12, 68, 217).
link(edge12, cloud6, 68, 217).
link(edge12, edge17, 39, 171).
link(edge17, edge12, 39, 171).
link(cloud5, edge14, 71, 279).
link(edge14, cloud5, 71, 279).
link(cloud5, edge15, 76, 223).
link(edge15, cloud5, 76, 223).
link(cloud5, cloud6, 16, 402).
link(cloud6, cloud5, 16, 402).
link(cloud5, edge16, 78, 267).
link(edge16, cloud5, 78, 267).
link(cloud5, edge19, 76, 295).
link(edge19, cloud5, 76, 295).
link(edge17, cloud5, 80, 219).
link(cloud5, edge17, 80, 219).
link(edge18, cloud5, 80, 295).
link(cloud5, edge18, 80, 295).
link(cloud5, edge13, 83, 253).
link(edge13, cloud5, 83, 253).
link(edge13, edge14, 12, 118).
link(edge14, edge13, 12, 118).
link(edge13, edge15, 26, 132).
link(edge15, edge13, 26, 132).
link(edge13, cloud6, 72, 284).
link(cloud6, edge13, 72, 284).
link(edge13, edge16, 37, 191).
link(edge16, edge13, 37, 191).
link(edge13, edge17, 36, 197).
link(edge17, edge13, 36, 197).
link(edge18, edge13, 27, 171).
link(edge13, edge18, 27, 171).
link(edge19, edge13, 17, 134).
link(edge13, edge19, 17, 134).
link(edge14, edge18, 15, 142).
link(edge18, edge14, 15, 142).
link(edge17, edge14, 24, 172).
link(edge14, edge17, 24, 172).
link(edge19, edge14, 18, 171).
link(edge14, edge19, 18, 171).
link(edge14, edge15, 20, 162).
link(edge15, edge14, 20, 162).
link(edge14, cloud6, 60, 236).
link(cloud6, edge14, 60, 236).
link(edge14, edge16, 25, 104).
link(edge16, edge14, 25, 104).
link(edge15, edge16, 29, 146).
link(edge16, edge15, 29, 146).
link(edge15, edge17, 11, 125).
link(edge17, edge15, 11, 125).
link(edge15, edge18, 24, 196).
link(edge18, edge15, 24, 196).
link(edge15, edge19, 21, 133).
link(edge19, edge15, 21, 133).
link(cloud6, edge15, 60, 295).
link(edge15, cloud6, 60, 295).
link(cloud6, edge16, 69, 272).
link(edge16, cloud6, 69, 272).
link(edge19, cloud6, 74, 246).
link(cloud6, edge19, 74, 246).
link(cloud6, edge17, 64, 261).
link(edge17, cloud6, 64, 261).
link(cloud6, edge18, 64, 271).
link(edge18, cloud6, 64, 271).
link(edge16, edge17, 33, 102).
link(edge17, edge16, 33, 102).
link(edge18, edge16, 26, 128).
link(edge16, edge18, 26, 128).
link(edge16, edge19, 39, 122).
link(edge19, edge16, 39, 122).
link(edge17, edge18, 28, 135).
link(edge18, edge17, 28, 135).
link(edge17, edge19, 21, 186).
link(edge19, edge17, 21, 186).
link(edge19, edge18, 21, 160).
link(edge18, edge19, 21, 160).
link(N, N, 0, 100000).