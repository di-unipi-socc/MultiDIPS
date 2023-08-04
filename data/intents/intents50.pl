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
propertyExpectation(gsIntent1, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(homeBankingOp2, hbIntent2, 5000, homeBankingService).

propertyExpectation(hbIntent2, privacy, edge, _, _).
propertyExpectation(hbIntent2, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent2, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent2, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent2, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent2, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent2, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(gameAppOp3, gsIntent3, 3000, gamingService).

propertyExpectation(gsIntent3, privacy, edge, _, _).
propertyExpectation(gsIntent3, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent3, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent3, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent3, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent3, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(streamAppOp4, ssIntent4, 2000, streamingService).

propertyExpectation(ssIntent4, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent4, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent4, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent4, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(gameAppOp5, gsIntent5, 3000, gamingService).

propertyExpectation(gsIntent5, privacy, edge, _, _).
propertyExpectation(gsIntent5, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent5, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent5, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent5, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent5, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(cloudStorageOp6, csIntent6, 500, cloudStorageService).

propertyExpectation(csIntent6, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent6, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent6, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(gameAppOp7, gsIntent7, 3000, gamingService).

propertyExpectation(gsIntent7, privacy, edge, _, _).
propertyExpectation(gsIntent7, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent7, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent7, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent7, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent7, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(smartRoadOp8, srIntent8, 10000, smartRoadService).

propertyExpectation(srIntent8, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent8, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent8, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent8, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent8, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(cloudStorageOp9, csIntent9, 500, cloudStorageService).

propertyExpectation(csIntent9, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent9, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent9, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(streamAppOp10, ssIntent10, 2000, streamingService).

propertyExpectation(ssIntent10, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent10, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent10, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent10, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(cloudStorageOp11, csIntent11, 500, cloudStorageService).

propertyExpectation(csIntent11, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent11, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent11, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(cloudStorageOp12, csIntent12, 500, cloudStorageService).

propertyExpectation(csIntent12, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent12, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent12, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(gameAppOp13, gsIntent13, 3000, gamingService).

propertyExpectation(gsIntent13, privacy, edge, _, _).
propertyExpectation(gsIntent13, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent13, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent13, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent13, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent13, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(smartRoadOp14, srIntent14, 10000, smartRoadService).

propertyExpectation(srIntent14, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent14, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent14, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent14, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent14, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(smartRoadOp15, srIntent15, 10000, smartRoadService).

propertyExpectation(srIntent15, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent15, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent15, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent15, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent15, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(homeBankingOp16, hbIntent16, 5000, homeBankingService).

propertyExpectation(hbIntent16, privacy, edge, _, _).
propertyExpectation(hbIntent16, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent16, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent16, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent16, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent16, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent16, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp17, hbIntent17, 5000, homeBankingService).

propertyExpectation(hbIntent17, privacy, edge, _, _).
propertyExpectation(hbIntent17, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent17, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent17, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent17, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent17, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent17, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(streamAppOp18, ssIntent18, 2000, streamingService).

propertyExpectation(ssIntent18, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent18, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent18, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent18, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(streamAppOp19, ssIntent19, 2000, streamingService).

propertyExpectation(ssIntent19, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent19, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent19, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent19, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(cloudStorageOp20, csIntent20, 500, cloudStorageService).

propertyExpectation(csIntent20, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent20, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent20, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(smartRoadOp21, srIntent21, 10000, smartRoadService).

propertyExpectation(srIntent21, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent21, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent21, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent21, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent21, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(gameAppOp22, gsIntent22, 3000, gamingService).

propertyExpectation(gsIntent22, privacy, edge, _, _).
propertyExpectation(gsIntent22, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent22, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent22, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent22, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent22, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(cloudStorageOp23, csIntent23, 500, cloudStorageService).

propertyExpectation(csIntent23, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent23, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent23, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(homeBankingOp24, hbIntent24, 5000, homeBankingService).

propertyExpectation(hbIntent24, privacy, edge, _, _).
propertyExpectation(hbIntent24, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent24, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent24, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent24, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent24, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent24, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(homeBankingOp25, hbIntent25, 5000, homeBankingService).

propertyExpectation(hbIntent25, privacy, edge, _, _).
propertyExpectation(hbIntent25, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent25, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent25, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent25, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent25, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent25, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(gameAppOp26, gsIntent26, 3000, gamingService).

propertyExpectation(gsIntent26, privacy, edge, _, _).
propertyExpectation(gsIntent26, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent26, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent26, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent26, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent26, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(cloudStorageOp27, csIntent27, 500, cloudStorageService).

propertyExpectation(csIntent27, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent27, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent27, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

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
propertyExpectation(gsIntent29, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(gameAppOp30, gsIntent30, 3000, gamingService).

propertyExpectation(gsIntent30, privacy, edge, _, _).
propertyExpectation(gsIntent30, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent30, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent30, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent30, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent30, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(homeBankingOp31, hbIntent31, 5000, homeBankingService).

propertyExpectation(hbIntent31, privacy, edge, _, _).
propertyExpectation(hbIntent31, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent31, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent31, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent31, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent31, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent31, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(cloudStorageOp32, csIntent32, 500, cloudStorageService).

propertyExpectation(csIntent32, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent32, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent32, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(cloudStorageOp33, csIntent33, 500, cloudStorageService).

propertyExpectation(csIntent33, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent33, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent33, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(cloudStorageOp34, csIntent34, 500, cloudStorageService).

propertyExpectation(csIntent34, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent34, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent34, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(gameAppOp35, gsIntent35, 3000, gamingService).

propertyExpectation(gsIntent35, privacy, edge, _, _).
propertyExpectation(gsIntent35, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent35, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent35, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent35, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent35, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(gameAppOp36, gsIntent36, 3000, gamingService).

propertyExpectation(gsIntent36, privacy, edge, _, _).
propertyExpectation(gsIntent36, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent36, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent36, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent36, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent36, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(homeBankingOp37, hbIntent37, 5000, homeBankingService).

propertyExpectation(hbIntent37, privacy, edge, _, _).
propertyExpectation(hbIntent37, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent37, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent37, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent37, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent37, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent37, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(cloudStorageOp38, csIntent38, 500, cloudStorageService).

propertyExpectation(csIntent38, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent38, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent38, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(smartRoadOp39, srIntent39, 10000, smartRoadService).

propertyExpectation(srIntent39, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent39, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent39, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent39, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent39, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(gameAppOp40, gsIntent40, 3000, gamingService).

propertyExpectation(gsIntent40, privacy, edge, _, _).
propertyExpectation(gsIntent40, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent40, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent40, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent40, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent40, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(cloudStorageOp41, csIntent41, 500, cloudStorageService).

propertyExpectation(csIntent41, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent41, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent41, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(smartRoadOp42, srIntent42, 10000, smartRoadService).

propertyExpectation(srIntent42, caching, edge, _, edgeDataCollecting).

propertyExpectation(srIntent42, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent42, bandwidth, larger, hard, 30, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent42, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).
propertyExpectation(srIntent42, latency, smaller, soft, 100, ms, cacheVF, cloudDataAnalysis).

intent(cloudStorageOp43, csIntent43, 500, cloudStorageService).

propertyExpectation(csIntent43, security, edge, cloudStorageVF, _).

propertyExpectation(csIntent43, bandwidth, larger, hard, 30, megabps, start, cloudStorageVF).
propertyExpectation(csIntent43, bandwidth, larger, hard, 10, megabps, cloudStorageVF, end).

intent(gameAppOp44, gsIntent44, 3000, gamingService).

propertyExpectation(gsIntent44, privacy, edge, _, _).
propertyExpectation(gsIntent44, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent44, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent44, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent44, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent44, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(streamAppOp45, ssIntent45, 2000, streamingService).

propertyExpectation(ssIntent45, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent45, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent45, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent45, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(homeBankingOp46, hbIntent46, 5000, homeBankingService).

propertyExpectation(hbIntent46, privacy, edge, _, _).
propertyExpectation(hbIntent46, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent46, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent46, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent46, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent46, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent46, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(gameAppOp47, gsIntent47, 3000, gamingService).

propertyExpectation(gsIntent47, privacy, edge, _, _).
propertyExpectation(gsIntent47, logging, cloud, cloudGamingVF, _).

propertyExpectation(gsIntent47, bandwidth, larger, hard, 40, megabps, start, edgeGamingVF).
propertyExpectation(gsIntent47, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent47, bandwidth, larger, hard, 5, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent47, latency, smaller, hard, 50, ms, encVF, edgeGamingVF).

intent(homeBankingOp48, hbIntent48, 5000, homeBankingService).

propertyExpectation(hbIntent48, privacy, edge, _, _).
propertyExpectation(hbIntent48, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent48, logging, cloud, cloudHomeBankingVF, _).

propertyExpectation(hbIntent48, bandwidth, larger, hard, 10, megabps, start, edgeHomeBankingVF).
propertyExpectation(hbIntent48, bandwidth, larger, hard, 30, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent48, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent48, latency, smaller, hard, 50, ms, authVF, cloudHomeBankingVF).

intent(streamAppOp49, ssIntent49, 2000, streamingService).

propertyExpectation(ssIntent49, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent49, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent49, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent49, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

intent(streamAppOp50, ssIntent50, 2000, streamingService).

propertyExpectation(ssIntent50, compression, cloud, cloudStreamingVF, _).

propertyExpectation(ssIntent50, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent50, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent50, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).

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
