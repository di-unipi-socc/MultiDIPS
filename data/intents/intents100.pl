:- discontiguous intent/4.
:- discontiguous propertyExpectation/5.
:- discontiguous propertyExpectation/8.
:- discontiguous target/2.
:- discontiguous vnf/3.
:- discontiguous vnfXUser/4.

intent(homeBankingOp1, hbIntent1, 5000, homeBankingService).

propertyExpectation(hbIntent1, privacy, edge, _, _).
propertyExpectation(hbIntent1, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent1, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent1, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent1, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent1, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent1, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(gameAppOp2, gsIntent2, 3000, gamingService).

propertyExpectation(gsIntent2, privacy, edge, _, _).
propertyExpectation(gsIntent2, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent2, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent2, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent2, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent2, latency, smaller, hard, 50, ms, start, edgeGamingVF).

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

intent(cloudStorageOp5, csIntent5, 500, cloudStorageService).

propertyExpectation(csIntent5, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent5, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent5, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(gameAppOp6, gsIntent6, 3000, gamingService).

propertyExpectation(gsIntent6, privacy, edge, _, _).
propertyExpectation(gsIntent6, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent6, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent6, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent6, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent6, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(smartRoadOp7, srIntent7, 10000, smartRoadService).

propertyExpectation(srIntent7, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent7, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent7, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent7, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent7, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(streamAppOp8, ssIntent8, 2000, streamingService).

propertyExpectation(ssIntent8, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent8, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent8, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent8, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(cloudStorageOp9, csIntent9, 500, cloudStorageService).

propertyExpectation(csIntent9, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent9, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent9, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(gameAppOp10, gsIntent10, 3000, gamingService).

propertyExpectation(gsIntent10, privacy, edge, _, _).
propertyExpectation(gsIntent10, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent10, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent10, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent10, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent10, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(homeBankingOp11, hbIntent11, 5000, homeBankingService).

propertyExpectation(hbIntent11, privacy, edge, _, _).
propertyExpectation(hbIntent11, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent11, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent11, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent11, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent11, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent11, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(streamAppOp12, ssIntent12, 2000, streamingService).

propertyExpectation(ssIntent12, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent12, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent12, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent12, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(cloudStorageOp13, csIntent13, 500, cloudStorageService).

propertyExpectation(csIntent13, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent13, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent13, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(homeBankingOp14, hbIntent14, 5000, homeBankingService).

propertyExpectation(hbIntent14, privacy, edge, _, _).
propertyExpectation(hbIntent14, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent14, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent14, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent14, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent14, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent14, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp15, hbIntent15, 5000, homeBankingService).

propertyExpectation(hbIntent15, privacy, edge, _, _).
propertyExpectation(hbIntent15, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent15, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent15, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent15, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent15, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent15, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(cloudStorageOp16, csIntent16, 500, cloudStorageService).

propertyExpectation(csIntent16, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent16, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent16, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(streamAppOp17, ssIntent17, 2000, streamingService).

propertyExpectation(ssIntent17, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent17, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent17, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent17, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(smartRoadOp18, srIntent18, 10000, smartRoadService).

propertyExpectation(srIntent18, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent18, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent18, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent18, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent18, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(streamAppOp19, ssIntent19, 2000, streamingService).

propertyExpectation(ssIntent19, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent19, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent19, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent19, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(streamAppOp20, ssIntent20, 2000, streamingService).

propertyExpectation(ssIntent20, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent20, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent20, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent20, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(homeBankingOp21, hbIntent21, 5000, homeBankingService).

propertyExpectation(hbIntent21, privacy, edge, _, _).
propertyExpectation(hbIntent21, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent21, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent21, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent21, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent21, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent21, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp22, hbIntent22, 5000, homeBankingService).

propertyExpectation(hbIntent22, privacy, edge, _, _).
propertyExpectation(hbIntent22, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent22, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent22, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent22, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent22, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent22, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(cloudStorageOp23, csIntent23, 500, cloudStorageService).

propertyExpectation(csIntent23, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent23, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent23, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(streamAppOp24, ssIntent24, 2000, streamingService).

propertyExpectation(ssIntent24, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent24, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent24, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent24, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(smartRoadOp25, srIntent25, 10000, smartRoadService).

propertyExpectation(srIntent25, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent25, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent25, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent25, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent25, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(homeBankingOp26, hbIntent26, 5000, homeBankingService).

propertyExpectation(hbIntent26, privacy, edge, _, _).
propertyExpectation(hbIntent26, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent26, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent26, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent26, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent26, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent26, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp27, hbIntent27, 5000, homeBankingService).

propertyExpectation(hbIntent27, privacy, edge, _, _).
propertyExpectation(hbIntent27, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent27, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent27, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent27, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent27, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent27, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(streamAppOp28, ssIntent28, 2000, streamingService).

propertyExpectation(ssIntent28, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent28, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent28, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent28, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(gameAppOp29, gsIntent29, 3000, gamingService).

propertyExpectation(gsIntent29, privacy, edge, _, _).
propertyExpectation(gsIntent29, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent29, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent29, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent29, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent29, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(gameAppOp30, gsIntent30, 3000, gamingService).

propertyExpectation(gsIntent30, privacy, edge, _, _).
propertyExpectation(gsIntent30, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent30, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent30, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent30, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent30, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(cloudStorageOp31, csIntent31, 500, cloudStorageService).

propertyExpectation(csIntent31, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent31, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent31, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(streamAppOp32, ssIntent32, 2000, streamingService).

propertyExpectation(ssIntent32, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent32, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent32, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent32, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(homeBankingOp33, hbIntent33, 5000, homeBankingService).

propertyExpectation(hbIntent33, privacy, edge, _, _).
propertyExpectation(hbIntent33, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent33, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent33, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent33, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent33, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent33, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(gameAppOp34, gsIntent34, 3000, gamingService).

propertyExpectation(gsIntent34, privacy, edge, _, _).
propertyExpectation(gsIntent34, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent34, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent34, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent34, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent34, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(streamAppOp35, ssIntent35, 2000, streamingService).

propertyExpectation(ssIntent35, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent35, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent35, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent35, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(homeBankingOp36, hbIntent36, 5000, homeBankingService).

propertyExpectation(hbIntent36, privacy, edge, _, _).
propertyExpectation(hbIntent36, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent36, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent36, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent36, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent36, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent36, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp37, hbIntent37, 5000, homeBankingService).

propertyExpectation(hbIntent37, privacy, edge, _, _).
propertyExpectation(hbIntent37, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent37, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent37, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent37, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent37, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent37, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(smartRoadOp38, srIntent38, 10000, smartRoadService).

propertyExpectation(srIntent38, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent38, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent38, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent38, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent38, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(gameAppOp39, gsIntent39, 3000, gamingService).

propertyExpectation(gsIntent39, privacy, edge, _, _).
propertyExpectation(gsIntent39, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent39, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent39, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent39, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent39, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(streamAppOp40, ssIntent40, 2000, streamingService).

propertyExpectation(ssIntent40, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent40, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent40, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent40, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(smartRoadOp41, srIntent41, 10000, smartRoadService).

propertyExpectation(srIntent41, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent41, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent41, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent41, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent41, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(gameAppOp42, gsIntent42, 3000, gamingService).

propertyExpectation(gsIntent42, privacy, edge, _, _).
propertyExpectation(gsIntent42, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent42, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent42, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent42, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent42, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(smartRoadOp43, srIntent43, 10000, smartRoadService).

propertyExpectation(srIntent43, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent43, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent43, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent43, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent43, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(smartRoadOp44, srIntent44, 10000, smartRoadService).

propertyExpectation(srIntent44, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent44, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent44, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent44, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent44, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(cloudStorageOp45, csIntent45, 500, cloudStorageService).

propertyExpectation(csIntent45, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent45, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent45, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(gameAppOp46, gsIntent46, 3000, gamingService).

propertyExpectation(gsIntent46, privacy, edge, _, _).
propertyExpectation(gsIntent46, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent46, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent46, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent46, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent46, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(streamAppOp47, ssIntent47, 2000, streamingService).

propertyExpectation(ssIntent47, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent47, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent47, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent47, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(homeBankingOp48, hbIntent48, 5000, homeBankingService).

propertyExpectation(hbIntent48, privacy, edge, _, _).
propertyExpectation(hbIntent48, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent48, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent48, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent48, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent48, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent48, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(smartRoadOp49, srIntent49, 10000, smartRoadService).

propertyExpectation(srIntent49, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent49, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent49, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent49, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent49, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(smartRoadOp50, srIntent50, 10000, smartRoadService).

propertyExpectation(srIntent50, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent50, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent50, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent50, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent50, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(streamAppOp51, ssIntent51, 2000, streamingService).

propertyExpectation(ssIntent51, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent51, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent51, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent51, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(streamAppOp52, ssIntent52, 2000, streamingService).

propertyExpectation(ssIntent52, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent52, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent52, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent52, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(smartRoadOp53, srIntent53, 10000, smartRoadService).

propertyExpectation(srIntent53, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent53, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent53, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent53, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent53, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(smartRoadOp54, srIntent54, 10000, smartRoadService).

propertyExpectation(srIntent54, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent54, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent54, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent54, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent54, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(gameAppOp55, gsIntent55, 3000, gamingService).

propertyExpectation(gsIntent55, privacy, edge, _, _).
propertyExpectation(gsIntent55, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent55, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent55, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent55, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent55, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(streamAppOp56, ssIntent56, 2000, streamingService).

propertyExpectation(ssIntent56, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent56, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent56, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent56, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(gameAppOp57, gsIntent57, 3000, gamingService).

propertyExpectation(gsIntent57, privacy, edge, _, _).
propertyExpectation(gsIntent57, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent57, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent57, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent57, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent57, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(cloudStorageOp58, csIntent58, 500, cloudStorageService).

propertyExpectation(csIntent58, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent58, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent58, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(smartRoadOp59, srIntent59, 10000, smartRoadService).

propertyExpectation(srIntent59, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent59, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent59, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent59, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent59, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(streamAppOp60, ssIntent60, 2000, streamingService).

propertyExpectation(ssIntent60, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent60, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent60, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent60, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(homeBankingOp61, hbIntent61, 5000, homeBankingService).

propertyExpectation(hbIntent61, privacy, edge, _, _).
propertyExpectation(hbIntent61, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent61, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent61, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent61, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent61, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent61, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(gameAppOp62, gsIntent62, 3000, gamingService).

propertyExpectation(gsIntent62, privacy, edge, _, _).
propertyExpectation(gsIntent62, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent62, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent62, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent62, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent62, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(smartRoadOp63, srIntent63, 10000, smartRoadService).

propertyExpectation(srIntent63, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent63, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent63, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent63, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent63, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(gameAppOp64, gsIntent64, 3000, gamingService).

propertyExpectation(gsIntent64, privacy, edge, _, _).
propertyExpectation(gsIntent64, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent64, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent64, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent64, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent64, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(smartRoadOp65, srIntent65, 10000, smartRoadService).

propertyExpectation(srIntent65, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent65, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent65, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent65, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent65, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(homeBankingOp66, hbIntent66, 5000, homeBankingService).

propertyExpectation(hbIntent66, privacy, edge, _, _).
propertyExpectation(hbIntent66, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent66, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent66, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent66, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent66, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent66, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp67, hbIntent67, 5000, homeBankingService).

propertyExpectation(hbIntent67, privacy, edge, _, _).
propertyExpectation(hbIntent67, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent67, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent67, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent67, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent67, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent67, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp68, hbIntent68, 5000, homeBankingService).

propertyExpectation(hbIntent68, privacy, edge, _, _).
propertyExpectation(hbIntent68, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent68, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent68, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent68, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent68, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent68, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(smartRoadOp69, srIntent69, 10000, smartRoadService).

propertyExpectation(srIntent69, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent69, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent69, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent69, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent69, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(homeBankingOp70, hbIntent70, 5000, homeBankingService).

propertyExpectation(hbIntent70, privacy, edge, _, _).
propertyExpectation(hbIntent70, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent70, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent70, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent70, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent70, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent70, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp71, hbIntent71, 5000, homeBankingService).

propertyExpectation(hbIntent71, privacy, edge, _, _).
propertyExpectation(hbIntent71, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent71, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent71, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent71, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent71, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent71, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(streamAppOp72, ssIntent72, 2000, streamingService).

propertyExpectation(ssIntent72, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent72, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent72, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent72, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(homeBankingOp73, hbIntent73, 5000, homeBankingService).

propertyExpectation(hbIntent73, privacy, edge, _, _).
propertyExpectation(hbIntent73, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent73, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent73, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent73, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent73, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent73, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(gameAppOp74, gsIntent74, 3000, gamingService).

propertyExpectation(gsIntent74, privacy, edge, _, _).
propertyExpectation(gsIntent74, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent74, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent74, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent74, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent74, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(streamAppOp75, ssIntent75, 2000, streamingService).

propertyExpectation(ssIntent75, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent75, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent75, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent75, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(gameAppOp76, gsIntent76, 3000, gamingService).

propertyExpectation(gsIntent76, privacy, edge, _, _).
propertyExpectation(gsIntent76, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent76, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent76, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent76, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent76, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(streamAppOp77, ssIntent77, 2000, streamingService).

propertyExpectation(ssIntent77, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent77, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent77, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent77, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(streamAppOp78, ssIntent78, 2000, streamingService).

propertyExpectation(ssIntent78, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent78, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent78, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent78, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(homeBankingOp79, hbIntent79, 5000, homeBankingService).

propertyExpectation(hbIntent79, privacy, edge, _, _).
propertyExpectation(hbIntent79, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent79, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent79, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent79, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent79, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent79, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(cloudStorageOp80, csIntent80, 500, cloudStorageService).

propertyExpectation(csIntent80, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent80, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent80, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(homeBankingOp81, hbIntent81, 5000, homeBankingService).

propertyExpectation(hbIntent81, privacy, edge, _, _).
propertyExpectation(hbIntent81, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent81, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent81, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent81, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent81, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent81, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp82, hbIntent82, 5000, homeBankingService).

propertyExpectation(hbIntent82, privacy, edge, _, _).
propertyExpectation(hbIntent82, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent82, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent82, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent82, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent82, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent82, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(smartRoadOp83, srIntent83, 10000, smartRoadService).

propertyExpectation(srIntent83, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent83, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent83, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent83, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent83, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(streamAppOp84, ssIntent84, 2000, streamingService).

propertyExpectation(ssIntent84, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent84, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent84, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent84, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(smartRoadOp85, srIntent85, 10000, smartRoadService).

propertyExpectation(srIntent85, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent85, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent85, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent85, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent85, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(cloudStorageOp86, csIntent86, 500, cloudStorageService).

propertyExpectation(csIntent86, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent86, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent86, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(homeBankingOp87, hbIntent87, 5000, homeBankingService).

propertyExpectation(hbIntent87, privacy, edge, _, _).
propertyExpectation(hbIntent87, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent87, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent87, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent87, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent87, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent87, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(cloudStorageOp88, csIntent88, 500, cloudStorageService).

propertyExpectation(csIntent88, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent88, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent88, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(gameAppOp89, gsIntent89, 3000, gamingService).

propertyExpectation(gsIntent89, privacy, edge, _, _).
propertyExpectation(gsIntent89, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent89, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent89, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent89, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent89, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(homeBankingOp90, hbIntent90, 5000, homeBankingService).

propertyExpectation(hbIntent90, privacy, edge, _, _).
propertyExpectation(hbIntent90, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent90, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent90, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent90, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent90, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent90, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp91, hbIntent91, 5000, homeBankingService).

propertyExpectation(hbIntent91, privacy, edge, _, _).
propertyExpectation(hbIntent91, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent91, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent91, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent91, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent91, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent91, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp92, hbIntent92, 5000, homeBankingService).

propertyExpectation(hbIntent92, privacy, edge, _, _).
propertyExpectation(hbIntent92, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent92, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent92, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent92, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent92, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent92, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(gameAppOp93, gsIntent93, 3000, gamingService).

propertyExpectation(gsIntent93, privacy, edge, _, _).
propertyExpectation(gsIntent93, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent93, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent93, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent93, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent93, latency, smaller, hard, 50, ms, start, edgeGamingVF).

intent(homeBankingOp94, hbIntent94, 5000, homeBankingService).

propertyExpectation(hbIntent94, privacy, edge, _, _).
propertyExpectation(hbIntent94, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent94, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent94, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent94, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent94, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent94, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(cloudStorageOp95, csIntent95, 500, cloudStorageService).

propertyExpectation(csIntent95, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent95, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent95, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(smartRoadOp96, srIntent96, 10000, smartRoadService).

propertyExpectation(srIntent96, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent96, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent96, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent96, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent96, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(streamAppOp97, ssIntent97, 2000, streamingService).

propertyExpectation(ssIntent97, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent97, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent97, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent97, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(smartRoadOp98, srIntent98, 10000, smartRoadService).

propertyExpectation(srIntent98, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent98, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent98, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent98, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent98, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(smartRoadOp99, srIntent99, 10000, smartRoadService).

propertyExpectation(srIntent99, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent99, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent99, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent99, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent99, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(gameAppOp100, gsIntent100, 3000, gamingService).

propertyExpectation(gsIntent100, privacy, edge, _, _).
propertyExpectation(gsIntent100, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent100, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent100, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent100, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent100, latency, smaller, hard, 50, ms, start, edgeGamingVF).

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
