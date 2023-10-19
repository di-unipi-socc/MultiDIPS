:- discontiguous intent/4.
:- discontiguous propertyExpectation/5.
:- discontiguous propertyExpectation/8.
:- discontiguous target/2.
:- discontiguous vnf/3.
:- discontiguous vnfXUser/4.


/* INTENT NR. 1 */
/* INTENT MODEL (by user) */

% intent(Stakeholder, IntentID, NUsers, TargetId).
intent(streamAppOp, ssIntent, 2000, streamingService).

% Changing property
% propertyExpectation(IntentID, Property, Bound, From/Before, To/After).
propertyExpectation(ssIntent, compression, cloud, cloudStreamingVF, _).

% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(ssIntent, bandwidth, larger, hard, 20, megabps, edgeStreamingVF, compVF).
propertyExpectation(ssIntent, bandwidth, larger, hard, 60, megabps, compVF, cloudStreamingVF).


/* TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(streamingService, [edgeStreamingVF, cloudStreamingVF]).

% vnf(Id, Affinity, ProcessingTime).
vnf(edgeStreamingVF, edge, 15).
vnf(cloudStreamingVF, cloud, 8).
vnf(compVF, cloud, 2).

% vnfXUser(Id, Version, UsersRange, HWReqs).
vnfXUser(edgeStreamingVF, s, (0,100), (2,1,100)).
vnfXUser(edgeStreamingVF, m, (101,3000), (3,1,200)).
vnfXUser(edgeStreamingVF, l, (4001,inf), (4,2,400)).
vnfXUser(cloudStreamingVF, s, (0, 1000), (24,4,500)).
vnfXUser(cloudStreamingVF, m, (1001, 10000), (48,6,1000)).
vnfXUser(cloudStreamingVF, l, (10001, inf), (96,8,2000)).
vnfXUser(compVF, m, (0, inf), (2,1,100)).



/* INTENT NR. 2 */
/* INTENT MODEL (by user) */

% intent(Stakeholder, IntentID, NUsers, TargetId).
intent(cloudStorageOp, csIntent, 500, cloudStorageService).

% Changing property
% propertyExpectation(IntentID, Property, Bound, From/Before, To/After).
propertyExpectation(csIntent, privacy, edge, cloudStorageVF, _).

% Non-changing property
% propertyExpectation(IntentID, Property, Bound, Level, Value, Unit, From, To).
propertyExpectation(csIntent, bandwidth, larger, hard, 30, megabps, encVF, cloudStorageVF).
propertyExpectation(csIntent, latency, smaller, soft, 100, megabps, encVF, cloudStorageVF).



/* TARGET-DEPENDENT MODEL */

% target(TargetId, Chain).
target(cloudStorageService, [cloudStorageVF]).

% vnf(Id, Affinity, ProcessingTime).
vnf(cloudStorageVF, cloud, 6).
vnf(encVF, edge, 2).

% vnfXUser(Id, Version, UsersRange, HWReqs).
vnfXUser(encVF, s, (0, inf), (2,1,100)).
vnfXUser(cloudStorageVF, s, (0, 400), (0,0,2000)).
vnfXUser(cloudStorageVF, l, (401, inf), (0,0,6000)).
% vnfXUser(authVF, ...).                 already declared