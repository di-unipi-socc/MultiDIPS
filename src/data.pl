:- discontiguous intent/4.
:- discontiguous propertyExpectation/5.
:- discontiguous propertyExpectation/8.
:- discontiguous target/2.
:- discontiguous vnf/3.
:- discontiguous vnfXUser/4.



/* INTENT NR. 1 */
/* INTENT MODEL (by user) */

% intent(Stakeholder, IntentID, NUsers, TargetId).
%intent(gameAppOp, gsIntent, 3000, gamingService).


% Changing property
% propertyExpectation(IntentID, Property, Bound, From/Before, To/After).
propertyExpectation(gsIntent, privacy, edge, _, _).
propertyExpectation(gsIntent, logging, cloud, cloudGamingVF, _).


% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(gsIntent, bandwidth, larger, hard, 20, megabps, start, edgeGamingVF).               % one BW propertyExpectation for each chain services couple
propertyExpectation(gsIntent, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent, bandwidth, larger, hard, 1, megabps, cloudGamingVF, end).
propertyExpectation(gsIntent, latency, smaller, hard, 55, ms, start, edgeGamingVF).


/* PROVIDER/TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(gamingService, [edgeGamingVF, cloudGamingVF]).


% vnf(Id, Affinity, ProcessingTime).
vnf(edgeGamingVF, edge, 15).
vnf(cloudGamingVF, cloud, 8).
vnf(encVF, edge, 2).
vnf(logVF, cloud, 1).


% vnfXUser(Id, Version, UsersRange, (ramReqs, vCPUReq, storageReq) ).
vnfXUser(edgeGamingVF, s, (0,100), (2,2,0)).
vnfXUser(edgeGamingVF, m, (101,1000), (4,2,0)).
vnfXUser(edgeGamingVF, l, (1001,inf), (6,3,0)).
vnfXUser(cloudGamingVF, s, (0, 1000), (24,10,0)).
vnfXUser(cloudGamingVF, m, (1001, 10000), (32,16,0)).
vnfXUser(cloudGamingVF, l, (10001, inf), (49,20,0)).
vnfXUser(encVF, s, (0, inf), (2,2,0)).
vnfXUser(logVF, s, (0, inf), (1,1,0)).



/* INTENT NR. 2 */
/* INTENT MODEL (by user) */

% intent(Stakeholder, IntentID, NUsers, TargetId).
intent(streamAppOp, ssIntent, 2000, streamingService).


% Changing property
% propertyExpectation(IntentID, Property, Bound, From/Before, To/After).
propertyExpectation(ssIntent, compression, cloud, cloudStreamingVF, _).


% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(ssIntent, bandwidth, larger, hard, 20, megabps, start, edgeStreamingVF).
propertyExpectation(ssIntent, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent, bandwidth, larger, hard, 1, megabps, cloudStreamingVF, end).
propertyExpectation(ssIntent, latency, smaller, soft, 30, ms, start, edgeStreamingVF).


/* PROVIDER/TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(streamingService, [edgeStreamingVF, cloudStreamingVF]).


% vnf(Id, Affinity, ProcessingTime).
vnf(edgeStreamingVF, edge, 15).
vnf(cloudStreamingVF, cloud, 8).
vnf(compVF, cloud, 2).


% vnfXUser(Id, Version, UsersRange, HWReqs).
vnfXUser(edgeStreamingVF, s, (0,100), (2,1,1)).
vnfXUser(edgeStreamingVF, m, (101,3000), (3,1,1)).
vnfXUser(edgeStreamingVF, l, (4001,inf), (4,2,1)).
vnfXUser(cloudStreamingVF, s, (0, 1000), (8,4,0)).
vnfXUser(cloudStreamingVF, m, (1001, 10000), (12,6,0)).
vnfXUser(cloudStreamingVF, l, (10001, inf), (16,8,0)).
vnfXUser(compVF, m, (0, inf), (1,2,0)).



/* INTENT NR. 3 */
/* INTENT MODEL (by user) */

% intent(Stakeholder, IntentID, NUsers, TargetId).
intent(homeBankingOp, hbIntent, 5000, homeBankingService).


% Changing property
% propertyExpectation(IntentID, Property, Bound, From/Before, To/After).
propertyExpectation(hbIntent, privacy, edge, _, _).
propertyExpectation(hbIntent, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent, logging, cloud, cloudHomeBankingVF, _).


% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(hbIntent, bandwidth, larger, hard, 5, megabps, start, edgeHomeBankingVF).               % una propertyExpectation di BW per ogni coppia di servizi della chain
propertyExpectation(hbIntent, bandwidth, larger, hard, 10, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent, bandwidth, larger, hard, 1, megabps, cloudHomeBankingVF, end).
propertyExpectation(hbIntent, latency, smaller, soft, 190, ms, edgeHomeBankingVF, cloudHomeBankingVF).


/* PROVIDER/TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(homeBankingService, [edgeHomeBankingVF, cloudDPI, cloudHomeBankingVF]).


% vnf(Id, Affinity, ProcessingTime).
vnf(edgeHomeBankingVF, edge, 8).
vnf(cloudDPI, cloud, 25).
vnf(cloudHomeBankingVF, cloud, 8).
vnf(authVF, cloud, 2).             
% vnf(encVF, ...).             already declared
% vnf(logVF, ...).             already declared


% vnfXUser(Id, Version, UsersRange, HWReqs).
vnfXUser(edgeHomeBankingVF, s, (0,inf), (4,3,1)).
vnfXUser(cloudHomeBankingVF, s, (0, 4000), (8,4,2)).
vnfXUser(cloudHomeBankingVF, m, (4001, 12000), (12,6,4)).
vnfXUser(cloudHomeBankingVF, l, (12001, inf), (18,8,8)).
vnfXUser(cloudDPI, m, (0, inf), (12,3,0)).
vnfXUser(authVF, s, (0, inf), (1,1,0)).                 
% vnfXUser(encVF, ...).                  already declared
% vnfXUser(logVF, ...).                  already declared



/* INTENT NR. 4 */
/* INTENT MODEL (by user) */

% intent(Stakeholder, IntentID, NUsers, TargetId).
%intent(cloudStorageOp, csIntent, 500, cloudStorageService).


% Changing property
% propertyExpectation(IntentID, Property, Bound, From/Before, To/After).
propertyExpectation(csIntent, security, edge, cloudStorageVF, _).


% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(csIntent, bandwidth, larger, hard, 15, megabps, start, cloudStorageVF).
propertyExpectation(csIntent, bandwidth, larger, hard, 15, megabps, cloudStorageVF, end).


/* PROVIDER/TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(cloudStorageService, [cloudStorageVF]).


% vnf(Id, Affinity, ProcessingTime).
vnf(cloudStorageVF, cloud, 8).
vnf(authVF, edge, 2).


% vnfXUser(Id, Version, UsersRange, HWReqs).
vnfXUser(cloudStorageVF, s, (0, 250), (0,0,10)).
vnfXUser(cloudStorageVF, l, (251, inf), (0,0,30)).
% vnfXUser(authVF, ...).                 already declared



/* INTENT NR. 5 */
/* INTENT MODEL (by user) */

% intent(Stakeholder, IntentID, NUsers, TargetId).
%intent(smartRoadOp, srIntent, 10000, smartRoadService).


% Changing property
% propertyExpectation(IntentID, Property, Bound, From/Before, To/After).
propertyExpectation(srIntent, caching, edge, _, edgeDataCollecting).


% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(srIntent, bandwidth, larger, hard, 5, megabps, start, edgeDataCollecting).
propertyExpectation(srIntent, bandwidth, larger, hard, 10, megabps, edgeDataCollecting, cloudDataAnalysis).
propertyExpectation(srIntent, bandwidth, larger, hard, 5, megabps, cloudDataAnalysis, end).


/* PROVIDER/TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(smartRoadService, [edgeDataCollecting, cloudDataAnalysis]).


% vnf(Id, Affinity, ProcessingTime).
vnf(edgeDataCollecting, edge, 5).
vnf(cloudDataAnalysis, cloud, 15).
vnf(cacheVF, edge, 2).


% vnfXUser(Id, Version, UsersRange, HWReqs).
vnfXUser(edgeDataCollecting, s, (0, 2000), (2,2,0)).
vnfXUser(edgeDataCollecting, m, (2001, 6000), (3,3,0)).
vnfXUser(edgeDataCollecting, l, (6001, inf), (4,4,0)).
vnfXUser(cloudDataAnalysis, s, (0, 5000), (8,5,5)).
vnfXUser(cloudDataAnalysis, m, (5001, 15000), (12,7,9)).
vnfXUser(cloudDataAnalysis, l, (15001, inf), (18,0,15)).
vnfXUser(cacheVF, s, (0, 5000), (1,1,2)).  
vnfXUser(cacheVF, m, (5001, inf), (1,1,4)).                
