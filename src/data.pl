:- discontiguous intent/4.
:- discontiguous propertyExpectation/5.
:- discontiguous propertyExpectation/8.
:- discontiguous target/2.
:- discontiguous vnf/3.
:- discontiguous vnfXUser/4.



/* INTENT NR. 1 */
/* INTENT MODEL (by user) */

% intent(Stakeholder, IntentID, NUsers, TargetId).
intent(gameAppOp, gsIntent, 3000, gamingService).


% Changing property
% propertyExpectation(IntentID, Property, Bound, From/Before, To/After).
propertyExpectation(gsIntent, privacy, edge, _, _).
propertyExpectation(gsIntent, logging, cloud, cloudGamingVF, _).


% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(gsIntent, bandwidth, larger, hard, 20, megabps, _, edgeGamingVF).               % one BW propertyExpectation for each chain services couple
propertyExpectation(gsIntent, bandwidth, larger, hard, 80, megabps, edgeGamingVF, cloudGamingVF).
propertyExpectation(gsIntent, latency, smaller, hard, 55, ms, gateway, edgeGamingVF).


/* PROVIDER/TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(gamingService, [edgeGamingVF, cloudGamingVF]).


% vnf(Id, Affinity, ProcessingTime).
vnf(edgeGamingVF, edge, 15).
vnf(cloudGamingVF, cloud, 8).
vnf(encVF, edge, 2).
vnf(logVF, cloud, 1).


% vnfXUser(Id, Version, UsersRange, (ramReqs, vCPUReq, storageReq) ).
vnfXUser(edgeGamingVF, s, (1,100), (2,2,0)).
vnfXUser(edgeGamingVF, m, (101,1000), (4,2,0)).
vnfXUser(edgeGamingVF, l, (1001,inf), (8,4,0)).
vnfXUser(cloudGamingVF, s, (1, 1000), (24,10,0)).
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
propertyExpectation(ssIntent, logging, edge, _, _).


% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(ssIntent, bandwidth, larger, hard, 20, megabps, _, edgeStreamingVF).
propertyExpectation(ssIntent, bandwidth, larger, hard, 60, megabps, edgeStreamingVF, cloudStreamingVF).
propertyExpectation(ssIntent, latency, smaller, soft, 30, ms, gateway, edgeStreamingVF).


/* PROVIDER/TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(streamingService, [edgeStreamingVF, cloudStreamingVF]).


% vnf(Id, Affinity, ProcessingTime).
vnf(edgeStreamingVF, edge, 15).
vnf(cloudStreamingVF, cloud, 8).
vnf(logVF, edge, 1).


% vnfXUser(Id, Version, UsersRange, HWReqs).
vnfXUser(edgeStreamingVF, s, (1,100), (2,1,1)).
vnfXUser(edgeStreamingVF, m, (101,1000), (3,1,1)).
vnfXUser(edgeStreamingVF, l, (1001,inf), (4,2,1)).
vnfXUser(cloudStreamingVF, s, (1, 1000), (8,4,0)).
vnfXUser(cloudStreamingVF, m, (1001, 10000), (12,6,0)).
vnfXUser(cloudStreamingVF, l, (10001, inf), (16,8,0)).
% vnfXUser(logVF, ...).   già presente precedentemente



/* INTENT NR. 3 */
/* INTENT MODEL (by user) */

% intent(Stakeholder, IntentID, NUsers, TargetId).
intent(homeBankingOpp, hbIntent, 5000, homeBankingService).


% Changing property
% propertyExpectation(IntentID, Property, Bound, From/Before, To/After).
propertyExpectation(hbIntent, privacy, edge, _, _).
propertyExpectation(hbIntent, security, cloud, cloudHomeBankingVF, _).
propertyExpectation(hbIntent, logging, cloud, cloudHomeBankingVF, _).


% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(hbIntent, bandwidth, larger, hard, 5, megabps, _, edgeHomeBankingVF).               % una propertyExpectation di BW per ogni coppia di servizi della chain
propertyExpectation(hbIntent, bandwidth, larger, hard, 10, megabps, edgeHomeBankingVF, cloudHomeBankingVF).
propertyExpectation(hbIntent, latency, smaller, soft, 190, ms, edgeHomeBankingVF, cloudHomeBankingVF).


/* PROVIDER/TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(homeBankingService, [edgeHomeBankingVF, cloudDPI, cloudHomeBankingVF]).


% vnf(Id, Affinity, ProcessingTime).
vnf(edgeHomeBankingVF, edge, 8).
vnf(cloudDPI, cloud, 25).
vnf(cloudHomeBankingVF, cloud, 8).
vnf(authVF, cloud, 2).             
% vnf(encVF, edge, 2).             già dichiarata
% vnf(logVF, cloud, 1).             già dichiarata


% vnfXUser(Id, Version, UsersRange, HWReqs).
vnfXUser(edgeHomeBankingVF, s, (1,inf), (4,3,1)).
vnfXUser(cloudHomeBankingVF, s, (1, 4000), (8,4,2)).
vnfXUser(cloudHomeBankingVF, m, (4001, 12000), (12,6,4)).
vnfXUser(cloudHomeBankingVF, l, (12001, inf), (18,8,8)).
vnfXUser(cloudDPI, m, (1, inf), (12,3,0)).
vnfXUser(authVF, s, (0, inf), (1,1,0)).                 
% vnfXUser(encVF, ...).                  già dichiarata
% vnfXUser(logVF, ...).                  già dichiarata



/* INTENT NR. 4 */
/* INTENT MODEL (by user) */

% intent(Stakeholder, IntentID, NUsers, TargetId).
intent(cloudStorageOpp, csIntent, 500, cloudStorageService).


% Changing property
% propertyExpectation(IntentID, Property, Bound, From/Before, To/After).
propertyExpectation(csIntent, security, edge, cloudStorageVF, _).


% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(csIntent, bandwidth, larger, hard, 15, megabps, _, cloudStorageVF).


/* PROVIDER/TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(cloudStorageService, [cloudStorageVF]).


% vnf(Id, Affinity, ProcessingTime).
vnf(cloudStorageVF, cloud, 8).
vnf(authVF, edge, 2).


% vnfXUser(Id, Version, UsersRange, HWReqs).
vnfXUser(cloudStorageVF, s, (1, 250), (0,0,10)).
vnfXUser(cloudStorageVF, l, (251, inf), (0,0,30)).
% vnfXUser(authVF, s, (0, inf), 2).                 già dichiarata
