pathLat(_, X, X, 0).    % Self latency is 0
pathLat([on(X,_,N)|Zs], start, To, Lat) :- pathLat([on(X,_,N)|Zs], X, To, Lat).    % _ - VNF/node

pathLat(_, From, To, Lat) :- node(From, _, _), node(To, _, _), link(From, To, Lat, _).    % node - node
pathLat([on(F,_,N)|Zs], From, To, Lat) :- node(From, _, _), \+ node(To, _, _), link(From, N, TmpLat, _), pathLat2([on(F,_,N)|Zs], To, TmpLat, Lat). % node - VNF
pathLat(P, From, To, Lat) :- \+ node(From, _, _), pathLat(P, From, To, 0, Lat).    % VNF - node / VNF - VNF

pathLat([on(X,_,_),Y|Zs], From, To, OldLat, NewLat) :- dif(X, From), pathLat([Y|Zs], From, To, OldLat, NewLat).
pathLat([on(From,_,N),on(Y,_,M)|Zs], From, To, _, NewLat) :- link(N, M, Lat, _), node(N, L, _), vnf(From, L, PTime), TmpLat is Lat + PTime, pathLat2([on(Y,_,M)|Zs], To, TmpLat, NewLat).
pathLat([on(From,_,N)], From, To, OldLat, NewLat) :- link(N, To, Lat, _), node(N, L, _), vnf(From, L, PTime), NewLat is OldLat + Lat + PTime. % To is a node

pathLat2([on(X,_,N),on(Y,_,M)|Zs], To, OldLat, NewLat) :- dif(X, To), link(N, M, Lat,_), node(N, L, _), vnf(X, L, PTime), TmpLat is OldLat + Lat + PTime, pathLat2([on(Y,_,M)|Zs], To, TmpLat, NewLat).
pathLat2([on(X,_,N)], To, OldLat, NewLat) :- link(N, To, Lat, _), node(N, L, _), vnf(X, L, PTime), NewLat is OldLat + Lat + PTime.  % To is a node (must be at the end of the chain)
pathLat2([on(To,_,N)|_], To, TmpLat, NewLat) :- node(N, L, _), vnf(To, L, PTime), NewLat is TmpLat + PTime.  % To is a VNF

addedAtEdge([X,Y|Zs], G, [X|NewZs]) :- X = (_, cloud), addedAtEdge([Y|Zs], G, NewZs).
addedAtEdge([X,Y|Zs], G, [G,X|NewZs]) :- X = (_, edge), addedAtEdge2([Y|Zs], G, NewZs).
addedAtEdge([X], _, [X]) :- X = (_, cloud).
addedAtEdge([X], G, [G,X,G]) :- X = (_, edge).
addedAtEdge([], _, []).

addedAtEdge2([X,Y|Zs], G, [X|NewZs]) :- X = (_, edge), addedAtEdge2([Y|Zs], G, NewZs).
addedAtEdge2([X,Y|Zs], G, [G,X|NewZs]) :- X = (_, cloud), addedAtEdge([Y|Zs], G, NewZs).
addedAtEdge2([X], G, [G,X]) :- X = (_, cloud).
addedAtEdge2([X], _, [X]) :- X = (_, edge).
addedAtEdge2([], _, []).

addedFromTo([X,Y|Zs], From, To, G, [X|NewZs]) :- dif(X, From), addedFromTo([Y|Zs], From, To, G, NewZs).
addedFromTo([From|Zs], From, To, G, [G, From|NewZs]) :- addedFromTo2(Zs, To, G, NewZs).
addedFromTo2([To|Zs], To, G, [To, G|Zs]).
addedFromTo2([X|Zs], To, G, [X|NewZs]) :- dif(X,To), addedFromTo2(Zs, To, G, NewZs).

addedBefore([Before|Zs], Before, G, [G, Before|Zs]) :- addedBefore(Zs, Before, G, Zs).
addedBefore([X|Zs], Before, G, [X|NewZs]) :- dif(X, Before), addedBefore(Zs, Before, G, NewZs).
addedBefore([], _, _, []).

addedAfter([After|Zs], After, G, [After, G|Zs]) :- addedAfter(Zs, After, G, Zs).
addedAfter([X|Zs], After, G, [X|NewZs]) :- dif(X, After), addedAfter(Zs, After, G, NewZs).
addedAfter([], _, _, []).

empty(Intent, PInfo) :- Intent = intent(_, IntentId, _, _), PInfo = info(0,0,0,(IntentId,[]),[],[]).

mergePlacements(OldPsInfo, PInfo, NewPsInfo) :-
    OldPsInfo = info(OldPR, OldC, OldE, OldPs, OldAllocBW, OldU), PInfo = info(PR, C, E, P, AllocBW, U),
    NewPR is OldPR + PR, NewC is OldC + C, NewE is OldE + E,
    append(AllocBW, OldAllocBW, NewAllocBW),
    NewPsInfo = info(NewPR, NewC, NewE, [P|OldPs], NewAllocBW, [U|OldU]).

placementPath([on(_,_,N), on(_,_,M)|T], Path) :-
    placementPath([on(_,_,M)|T], TmpPath),
    Path = [(N,M)|TmpPath].
placementPath([on(_,_,_)],[]).

nodeToNodeBW(_, _, [], NewAllocBW, NewAllocBW).
nodeToNodeBW(IntentId, N, P, [], [(N, M, BWValue)]) :- 
    P = [on(F, _, M)|_],
    findReqBW(IntentId, F, start, BWValue). 
nodeToNodeBW(IntentId, N, P, OldAllocBW, [(N, M, BWValue)|OldAllocBW]) :-
    P = [on(F, _, M)|_], 
    OldAllocBW = [(_,_,OldBWValue)|_],
    findReqBW(IntentId, F, OldBWValue, BWValue). 

findReqBW(IntentId, F, start, NewBWValue) :- propertyExpectation(IntentId, bandwidth, _,_, NewBWValue, _, S, end), dif(F,S).
findReqBW(IntentId, F, _, NewBWValue) :- propertyExpectation(IntentId, bandwidth, _,_, NewBWValue, _,_, F).
findReqBW(IntentId, F, LastBWValue, LastBWValue) :- dif(LastBWValue, start), \+ propertyExpectation(IntentId, bandwidth, _,_,_,_,_, F).

filterAllocBW([(N,M,Value)|T], FilteredAllocBW) :-
    filterAllocBW(T, TmpFilteredAllocBW),
    dif(N, M),
    FilteredAllocBW = [(N, M, Value)|TmpFilteredAllocBW].
filterAllocBW([(N,N,_)|T], FilteredAllocBW) :-
    filterAllocBW(T, FilteredAllocBW).
filterAllocBW([],[]).

findReqHW([(F, _, D)|Fs], NUsers, HWReqs) :-
    findReqHW(Fs, NUsers, FsReqs),
    vnfXUser(F, D, _, FReqs),
    sumReqs(FReqs, FsReqs, HWReqs).
findReqHW([], _, (0,0,0)).

allocatedHW([(_, P)|T], N, TotAllocHW) :-
    allocatedHW(T, N, TmpAllocHW),
    findall(HWReqs, (member(on(VNF, V, N), P), vnfXUser(VNF, V, _, HWReqs)), HWs),
    sumHWs(HWs, AllocHW),
    sumReqs(TmpAllocHW, AllocHW, TotAllocHW).
allocatedHW([], _, (0, 0, 0)).

sumHWs([(RamReq, CPUReq, StorageReq)|T], PAllocHW) :-
    sumHWs(T, (TmpRam, TmpCPU, TmpStorage)),
    Ram is RamReq + TmpRam, CPU is CPUReq + TmpCPU, Storage is StorageReq + TmpStorage,
    PAllocHW = (Ram, CPU, Storage).
sumHWs([], (0,0,0)).

sumBW([(_,_,BWValue)|T], TotValue) :-
    sumBW(T, TmpValue),
    TotValue is TmpValue + BWValue.
sumBW([], 0).

sumReqs((Ram1,CPU1,Storage1), (Ram2, CPU2, Storage2), (Ram1+Ram2, CPU1+CPU2, Storage1+Storage2)).

nodeMinMax(Nodes, Ps, Min, Max) :-
    findall(Cost * Energy, (member(N, Nodes), nodeUnitEnergy(N, Energy), energyCost(N,Cost)), AllUnitCost),
    findall(Emissions, emissions(_,Emissions), AllEmissions),
    findall(FreeHWScore, (member(N, Nodes), freeHWScore(N, Ps, FreeHWScore)), AllFreeHWScore),
    min_list(AllUnitCost, MinUnitCost), 
    min_list(AllEmissions, MinEmissions),
    min_list(AllFreeHWScore, MinFreeHWScore),
    max_list(AllUnitCost, MaxUnitCost), 
    max_list(AllEmissions, MaxEmissions),
    max_list(AllFreeHWScore, MaxFreeHWScore),
    Min = (MinUnitCost, MinEmissions, MinFreeHWScore),
    Max = (MaxUnitCost, MaxEmissions, MaxFreeHWScore).

nodeUnitEnergy(N, Energy) :-
    totHW(N,(Ram, Cpu, Storage)),
    pue(N, Pue),
    ramEnergyProfile(N, 1, E1), cpuEnergyProfile(N, 1, E2), storageEnergyProfile(N, 1, E3),
    Energy is (E1/Ram + E2/Cpu + E3/Storage) * Pue.

freeHWScore(N, Ps, FreeHWScore) :-
    allocatedHW(Ps, N, (AllocRam, AllocCPU, AllocStor)),
    node(N,_,(Ram, CPU, Stor)),
    singleFreeHW(AllocRam, Ram, RamFreeHW),
    singleFreeHW(AllocCPU, CPU, CPUFreeHW),
    singleFreeHW(AllocStor, Stor, StorFreeHW),
    FreeHWScore is 1/(1+(RamFreeHW + CPUFreeHW + StorFreeHW/100)).

nodeEmissions([(Prob, Src)|Srcs], NodeEmissions) :-
    nodeEmissions(Srcs, TmpNodeEmissions),
    emissions(Src, Emissions),
    NodeEmissions is TmpNodeEmissions + Prob * Emissions.
nodeEmissions([], 0).
    
singleFreeHW(AllocHW, HW, FreeHW) :-
    FreeHW is HW - AllocHW.

extractElement((_,N), N).