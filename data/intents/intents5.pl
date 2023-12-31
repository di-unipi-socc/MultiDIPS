:- discontiguous intent/4.
:- discontiguous propertyExpectation/5.
:- discontiguous propertyExpectation/8.
:- discontiguous target/2.
:- discontiguous vnf/3.
:- discontiguous vnfXUser/4.

intent(cloudStorageOp1, csIntent1, 500, cloudStorageService).

propertyExpectation(csIntent1, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent1, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent1, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(cloudStorageOp2, csIntent2, 500, cloudStorageService).

propertyExpectation(csIntent2, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent2, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent2, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(smartRoadOp3, srIntent3, 10000, smartRoadService).

propertyExpectation(srIntent3, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent3, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent3, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent3, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent3, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(gameAppOp4, gsIntent4, 3000, gamingService).

propertyExpectation(gsIntent4, privacy, edge, _, _).
propertyExpectation(gsIntent4, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent4, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent4, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent4, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent4, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(homeBankingOp5, hbIntent5, 5000, homeBankingService).

propertyExpectation(hbIntent5, privacy, edge, _, _).
propertyExpectation(hbIntent5, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent5, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent5, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent5, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent5, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent5, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

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
