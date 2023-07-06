pathLat(_, X, X, 0).    % Self latency is 0
pathLat([on(X,_,N)|Zs], start, To, Lat) :- pathLat([on(X,_,N)|Zs], X, To, Lat).    % _ - VNF/node

pathLat(_, From, To, Lat) :- node(From, _, _), node(To, _, _), link(From, To, Lat, _).    % node - node
pathLat([on(F,_,N)|Zs], From, To, Lat) :- node(From, _, _), \+ node(To, _, _), link(From, N, TmpLat, _), pathLat2([on(F,_,N)|Zs], To, TmpLat, Lat). % node - VNF
pathLat(P, From, To, Lat) :- \+ node(From, _, _), pathLat(P, From, To, 0, Lat).    % VNF - node / VNF - VNF

pathLat([on(X,_,_),Y|Zs], From, To, OldLat, NewLat) :- dif(X, From), pathLat([Y|Zs], From, To, OldLat, NewLat).
pathLat([on(From,_,N),on(Y,_,M)|Zs], From, To, _, NewLat) :- link(N, M, Lat, _), node(N, L, _), vnf(From, L, PTime), TmpLat is Lat + PTime, pathLat2([on(Y,_,M)|Zs], To, TmpLat, NewLat).
pathLat([on(From,_,N)], From, To, OldLat, NewLat) :- link(N, To, Lat, _), node(N, L, _), vnf(From, L, PTime), NewLat is OldLat + Lat + PTime. % To is a node

pathLat2([on(X,_,N),on(Y,_,M)|Zs], To, OldLat, NewLat) :- dif(X, To), link(N, M, Lat,_), node(N, L, _), vnf(X, L, PTime), TmpLat is OldLat + Lat + PTime, pathLat2([on(Y,_,M)|Zs], To, TmpLat, NewLat).
pathLat2([on(X,_,N)], To, OldLat, NewLat) :- link(N, To, Lat, _), node(N, L, _), vnf(X, L, PTime), NewLat is OldLat + Lat + PTime. % To is a node (must be at the end of the chain)
pathLat2([on(To,_,N)|_], To, TmpLat, NewLat) :-  node(N, L, _), vnf(To, L, PTime), NewLat is TmpLat + PTime. % To is a VNF

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

placementPath([on(_,_,N), on(_,_,M)|T], Path) :-
    placementPath([on(_,_,M)|T], TmpPath),
    Path = [(N,M)|TmpPath].
placementPath([on(_,_,_)],[]).

findBW(IntentId, F, start, NewBWValue) :- propertyExpectation(IntentId, bandwidth, _, _, NewBWValue, _, S, end), dif(F,S).
findBW(IntentId, F, _, NewBWValue) :- propertyExpectation(IntentId, bandwidth, _, _, NewBWValue, _, _, F).
findBW(IntentId, F, LastBWValue, LastBWValue) :- dif(LastBWValue, start), \+ propertyExpectation(IntentId, bandwidth, _, _, _, _, _, F).

findReqHW([F|Fs], NUsers, HWReqs) :-
    findReqHW(Fs, NUsers, FsReqs),
    vnfXUser(F, _, (Min, Max), FReqs),
    between(Min, Max, NUsers),
    sumReqs(FReqs, FsReqs, HWReqs).
findReqHW([], _, (0,0,0)).

allocatedHW([(_,P)|T], N, TotAllocHW) :-
    allocatedHW(T, N, TmpAllocHW),
    findall(HWReqs, (member(on(VNF, V, N), P), vnfXUser(VNF, V, _, HWReqs)), HWs), sumHWs(HWs, AllocHW),
    sumReqs(TmpAllocHW, AllocHW, TotAllocHW).
allocatedHW([], _, (0,0,0)).

sumHWs([(RamReq, CPUReq, StorageReq)|T], PAllocHW) :-
    sumHWs(T, (AllocRam, AllocCPU, AllocStorage)),
    Ram is RamReq+AllocRam, CPU is CPUReq+AllocCPU, Storage is StorageReq+AllocStorage,
    PAllocHW = (Ram, CPU, Storage).
sumHWs([], (0,0,0)).

sumBW([(_,_,BWValue)|T], TotValue) :-
    sumBW(T, TmpValue),
    TotValue is TmpValue + BWValue.
sumBW([], 0).

sumReqs((Ram1,CPU1,Storage1), (Ram2, CPU2, Storage2), (Ram1+Ram2, CPU1+CPU2, Storage1+Storage2)).

extractIntent((_,_, X), X).

test(N, List, Out):-
    dif(N,0),
    multiDips(info(PR, C, E, _, _, _)),
    addIf(List, (PR, C, E), NewList),
    NewN is N-1,
    test(NewN, NewList, Out).
test(0, List, Out) :- sort(List, Out).

addIf(List, V, NewList) :-
    \+ member(V, List),
    NewList = [V|List].
addIf(List, V, List) :-
    member(V, List).