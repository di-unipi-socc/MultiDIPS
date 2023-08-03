:- discontiguous intent/4.
:- discontiguous propertyExpectation/5.
:- discontiguous propertyExpectation/8.
:- discontiguous target/2.
:- discontiguous vnf/3.
:- discontiguous vnfXUser/4.

intent(gameAppOp1, gsIntent1, 3000, gamingService).

propertyExpectation(gsIntent1, privacy, edge, _, _).
propertyExpectation(gsIntent1, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent1, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent1, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent1, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent1, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(cloudStorageOp2, csIntent2, 500, cloudStorageService).

propertyExpectation(csIntent2, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent2, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent2, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(homeBankingOp3, hbIntent3, 5000, homeBankingService).

propertyExpectation(hbIntent3, privacy, edge, _, _).
propertyExpectation(hbIntent3, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent3, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent3, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent3, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent3, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent3, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(smartRoadOp4, srIntent4, 10000, smartRoadService).

propertyExpectation(srIntent4, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent4, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent4, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent4, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent4, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(gameAppOp5, gsIntent5, 3000, gamingService).

propertyExpectation(gsIntent5, privacy, edge, _, _).
propertyExpectation(gsIntent5, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent5, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent5, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent5, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent5, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(cloudStorageOp6, csIntent6, 500, cloudStorageService).

propertyExpectation(csIntent6, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent6, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent6, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(homeBankingOp7, hbIntent7, 5000, homeBankingService).

propertyExpectation(hbIntent7, privacy, edge, _, _).
propertyExpectation(hbIntent7, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent7, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent7, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent7, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent7, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent7, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(smartRoadOp8, srIntent8, 10000, smartRoadService).

propertyExpectation(srIntent8, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent8, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent8, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent8, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent8, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(streamAppOp9, ssIntent9, 2000, streamingService).

propertyExpectation(ssIntent9, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent9, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent9, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent9, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(gameAppOp10, gsIntent10, 3000, gamingService).

propertyExpectation(gsIntent10, privacy, edge, _, _).
propertyExpectation(gsIntent10, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent10, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent10, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent10, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent10, latency, smaller, hard, 50, ms, start, edgeGamingVF).

target(gamingService, [edgeGamingVF, cloudGamingVF]).
target(streamingService, [edgeStreamingVF, cloudStreamingVF]).
target(homeBankingService, [edgeHomeBankingVF, cloudDPI, cloudHomeBankingVF]).
target(cloudStorageService, [cloudStorageVF]).
target(smartRoadService, [edgeDataCollecting, cloudDataAnalysis]).

vnf(edgeGamingVF, edge, 15).
vnf(cloudGamingVF, cloud, 8).
vnf(encVF, edge, 4).
vnf(logVF, cloud, 1).
vnf(edgeStreamingVF, edge, 15).
vnf(cloudStreamingVF, cloud, 8).
vnf(compVF, cloud, 2).
vnf(edgeHomeBankingVF, edge, 8).
vnf(cloudDPI, cloud, 25).
vnf(cloudHomeBankingVF, cloud, 8).
vnf(authVF, cloud, 2).
vnf(authVF, edge, 2).
vnf(cloudStorageVF, cloud, 8).
vnf(edgeDataCollecting, edge, 5).
vnf(cloudDataAnalysis, cloud, 15).
vnf(cacheVF, edge, 2).

vnfXUser(edgeGamingVF, s, (0,100), (2,1,100)).
vnfXUser(edgeGamingVF, m, (101,1000), (4,2,200)).
vnfXUser(edgeGamingVF, l, (1001,inf), (8,3,400)).

vnfXUser(cloudGamingVF, s, (0, 1000), (32,6,500)).
vnfXUser(cloudGamingVF, m, (1001, 10000), (64,8,800)).
vnfXUser(cloudGamingVF, l, (10001, inf), (128,14,1200)).

vnfXUser(encVF, s, (0, inf), (2,1,100)).

vnfXUser(logVF, s, (0, inf), (1,1,100)).

vnfXUser(edgeStreamingVF, s, (0,100), (2,1,100)).
vnfXUser(edgeStreamingVF, m, (101,3000), (3,1,200)).
vnfXUser(edgeStreamingVF, l, (4001,inf), (4,2,400)).

vnfXUser(cloudStreamingVF, s, (0, 1000), (24,4,500)).
vnfXUser(cloudStreamingVF, m, (1001, 10000), (48,6,1000)).
vnfXUser(cloudStreamingVF, l, (10001, inf), (96,8,2000)).

vnfXUser(compVF, m, (0, inf), (2,1,100)).

vnfXUser(edgeHomeBankingVF, s, (0,5000), (6,4,300)).
vnfXUser(edgeHomeBankingVF, m, (5001,inf), (12,4,400)).

vnfXUser(cloudHomeBankingVF, s, (0, 4000), (16,4,200)).
vnfXUser(cloudHomeBankingVF, m, (4001, 12000), (32,6,400)).
vnfXUser(cloudHomeBankingVF, l, (12001, inf), (64,8,800)).

vnfXUser(cloudDPI, m, (0, inf), (16,4,100)).

vnfXUser(authVF, s, (0, inf), (2,1,100)).

vnfXUser(cloudStorageVF, s, (0, 400), (0,0,2000)).
vnfXUser(cloudStorageVF, l, (401, inf), (0,0,6000)).

vnfXUser(edgeDataCollecting, s, (0, 2000), (4,1,100)).
vnfXUser(edgeDataCollecting, m, (2001, 6000), (6,2,200)).
vnfXUser(edgeDataCollecting, l, (6001, inf), (10,3,300)).

vnfXUser(cloudDataAnalysis, s, (0, 5000), (24,6,700)).
vnfXUser(cloudDataAnalysis, m, (5001, 15000), (48,8,1400)).
vnfXUser(cloudDataAnalysis, l, (15001, inf), (72,10,2100)).

vnfXUser(cacheVF, s, (0, 5000), (2,1,400)).
vnfXUser(cacheVF, m, (5001, inf), (4,1,800)).
