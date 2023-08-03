:- discontiguous intent/4.
:- discontiguous propertyExpectation/5.
:- discontiguous propertyExpectation/8.
:- discontiguous target/2.
:- discontiguous vnf/3.
:- discontiguous vnfXUser/4.

intent(smartRoadOp1, srIntent1, 10000, smartRoadService).

propertyExpectation(srIntent1, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent1, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent1, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent1, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent1, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(homeBankingOp2, hbIntent2, 5000, homeBankingService).

propertyExpectation(hbIntent2, privacy, edge, _, _).
propertyExpectation(hbIntent2, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent2, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent2, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent2, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent2, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent2, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(cloudStorageOp3, csIntent3, 500, cloudStorageService).

propertyExpectation(csIntent3, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent3, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent3, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(homeBankingOp4, hbIntent4, 5000, homeBankingService).

propertyExpectation(hbIntent4, privacy, edge, _, _).
propertyExpectation(hbIntent4, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent4, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent4, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent4, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent4, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent4, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp5, hbIntent5, 5000, homeBankingService).

propertyExpectation(hbIntent5, privacy, edge, _, _).
propertyExpectation(hbIntent5, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent5, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent5, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent5, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent5, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent5, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(smartRoadOp6, srIntent6, 10000, smartRoadService).

propertyExpectation(srIntent6, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent6, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent6, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent6, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent6, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(cloudStorageOp7, csIntent7, 500, cloudStorageService).

propertyExpectation(csIntent7, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent7, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent7, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(cloudStorageOp8, csIntent8, 500, cloudStorageService).

propertyExpectation(csIntent8, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent8, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent8, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(streamAppOp9, ssIntent9, 2000, streamingService).

propertyExpectation(ssIntent9, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent9, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent9, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent9, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(homeBankingOp10, hbIntent10, 5000, homeBankingService).

propertyExpectation(hbIntent10, privacy, edge, _, _).
propertyExpectation(hbIntent10, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent10, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent10, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent10, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent10, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent10, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(smartRoadOp11, srIntent11, 10000, smartRoadService).

propertyExpectation(srIntent11, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent11, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent11, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent11, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent11, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(homeBankingOp12, hbIntent12, 5000, homeBankingService).

propertyExpectation(hbIntent12, privacy, edge, _, _).
propertyExpectation(hbIntent12, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent12, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent12, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent12, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent12, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent12, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(cloudStorageOp13, csIntent13, 500, cloudStorageService).

propertyExpectation(csIntent13, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent13, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent13, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(cloudStorageOp14, csIntent14, 500, cloudStorageService).

propertyExpectation(csIntent14, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent14, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent14, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(streamAppOp15, ssIntent15, 2000, streamingService).

propertyExpectation(ssIntent15, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent15, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent15, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent15, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(smartRoadOp16, srIntent16, 10000, smartRoadService).

propertyExpectation(srIntent16, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent16, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent16, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent16, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent16, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(gameAppOp17, gsIntent17, 3000, gamingService).

propertyExpectation(gsIntent17, privacy, edge, _, _).
propertyExpectation(gsIntent17, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent17, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent17, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent17, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent17, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(gameAppOp18, gsIntent18, 3000, gamingService).

propertyExpectation(gsIntent18, privacy, edge, _, _).
propertyExpectation(gsIntent18, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent18, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent18, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent18, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent18, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(gameAppOp19, gsIntent19, 3000, gamingService).

propertyExpectation(gsIntent19, privacy, edge, _, _).
propertyExpectation(gsIntent19, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent19, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent19, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent19, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent19, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(streamAppOp20, ssIntent20, 2000, streamingService).

propertyExpectation(ssIntent20, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent20, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent20, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent20, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(streamAppOp21, ssIntent21, 2000, streamingService).

propertyExpectation(ssIntent21, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent21, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent21, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent21, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(smartRoadOp22, srIntent22, 10000, smartRoadService).

propertyExpectation(srIntent22, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent22, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent22, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent22, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent22, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(cloudStorageOp23, csIntent23, 500, cloudStorageService).

propertyExpectation(csIntent23, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent23, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent23, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(cloudStorageOp24, csIntent24, 500, cloudStorageService).

propertyExpectation(csIntent24, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent24, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent24, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(homeBankingOp25, hbIntent25, 5000, homeBankingService).

propertyExpectation(hbIntent25, privacy, edge, _, _).
propertyExpectation(hbIntent25, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent25, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent25, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent25, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent25, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent25, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

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
