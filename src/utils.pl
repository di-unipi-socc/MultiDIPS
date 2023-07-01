minBW([on(X,_,N)|Zs], From, To, BW, AllocatedBW) :- var(From), minBW([on(X,_,N)|Zs], X, To, BW, AllocatedBW).   % _ - VNF/node

minBW(_, From, To, BW, AllocatedBW) :- nonvar(From), node(From, _, _), node(To, _, _), link(From, To, _, TmpBW), usedBW(From, To, AllocatedBW, UBW), BW is TmpBW - UBW. % node - node
minBW([on(X,_,N)|Zs], From, To, BW, AllocatedBW) :- nonvar(From), node(From, _, _), \+ node(To, _, _), link(From, N, _, TmpBW), usedBW(From, N, AllocatedBW, UBW), minBW2([on(X,_,N)|Zs], To, TmpBW-UBW, BW, AllocatedBW). % node - VNF
minBW(P, From, To, BW, AllocatedBW) :- \+ node(From, _, _), minBW(P, From, To, inf, BW, AllocatedBW). % VNF - node / VNF - VNF

minBW([on(X,_,_),Y|Zs], From, To, OldBW, NewBW, AllocatedBW) :- dif(X, From), minBW([Y|Zs], From, To, OldBW, NewBW, AllocatedBW).
minBW([on(From,_,N),on(Y,_,M)|Zs], From, To, _, NewBW, AllocatedBW) :- link(N, M, _, TmpBW), usedBW(N, M, AllocatedBW, UBW), minBW2([on(Y,_,M)|Zs], To, TmpBW-UBW, NewBW, AllocatedBW).
minBW([on(From,_,N)], From, To, OldBW, NewBW, AllocatedBW) :- link(N, To, _, TmpBW), usedBW(N, To, AllocatedBW, UBW), NewBW is min(OldBW, TmpBW-UBW). % To is a node

minBW2([on(X,_,N),on(Y,_,M)|Zs], To, OldBW, NewBW, AllocatedBW) :- dif(X, To), link(N, M, _, TmpBW), usedBW(N, M, AllocatedBW, UBW), BW is min(OldBW, TmpBW-UBW), minBW2([on(Y,_,M)|Zs], To, BW, NewBW, AllocatedBW).
minBW2([on(_,_,N)], To, OldBW, NewBW, AllocatedBW) :- link(N, To, _, TmpBW), usedBW(N, To, AllocatedBW, UBW), NewBW is min(OldBW, TmpBW-UBW). % To is a node
minBW2([on(To,_,_)|_], To, BW, BW, _). % To is a VNF


pathLat([on(X,_,N)|Zs], From, To, Lat) :- var(From), pathLat([on(X,_,N)|Zs], X, To, Lat).

pathLat(_, From, To, Lat) :- nonvar(From), node(From, _, _), node(To, _, _), link(From, To, Lat, _).  % node - node
pathLat([on(F,_,N)|Zs], From, To, Lat) :- nonvar(From), node(From, _, _), \+ node(To, _, _), link(From, N, TmpLat, _), pathLat2([on(F,_,N)|Zs], To, TmpLat, Lat). % node - VNF
pathLat(P, From, To, Lat) :- \+ node(From, _, _), pathLat(P, From, To, 0, Lat). % VNF - node / VNF - VNF

pathLat([on(X,_,_),Y|Zs], From, To, OldLat, NewLat) :- dif(X, From), pathLat([Y|Zs], From, To, OldLat, NewLat).
pathLat([on(From,_,N),on(Y,_,M)|Zs], From, To, _, NewLat) :- link(N, M, Lat, _), node(N, L, _), vnf(From, L, PTime), TmpLat is Lat + PTime, pathLat2([on(Y,_,M)|Zs], To, TmpLat, NewLat).
pathLat([on(From,_,N)], From, To, OldLat, NewLat) :- link(N, To, Lat, _), node(N, L, _), vnf(From, L, PTime), NewLat is OldLat + Lat + PTime. % To is a node

pathLat2([on(X,_,N),on(Y,_,M)|Zs], To, OldLat, NewLat) :- dif(X, To), link(N, M, Lat,_), node(N, L, _), vnf(X, L, PTime), TmpLat is OldLat + Lat + PTime, pathLat2([on(Y,_,M)|Zs], To, TmpLat, NewLat).
pathLat2([on(X,_,N)], To, OldLat, NewLat) :- link(N, To, Lat, _), node(N, L, _), vnf(X, L, PTime), NewLat is OldLat + Lat + PTime. % To is a node (must be at the end of the chain)
pathLat2([on(To,_,N)|_], To, TmpLat, NewLat) :-  node(N, L, _), vnf(To, L, PTime), NewLat is TmpLat + PTime. % To is a VNF


findPath(_, From, To, [(From, To)]) :- node(From, _, _), node(To, _, _). % node - node
findPath([on(X,_,N)|Zs], From, To, Path) :- node(From, _, _), \+ node(To, _, _), findPath2([on(X,_,N)|Zs], To, [(From, N)], Path). % node - VNF
findPath(P, From, To, Path) :- findPath(P, From, To, [], Path). % VNF - node / VNF - VNF

findPath([on(X,_,_),Y|Zs], From, To, TmpPath, Path) :- dif(X, From), findPath([Y|Zs], From, To, TmpPath, Path).
findPath([on(From,_,N),on(Y,_,M)|Zs], From, To, TmpPath, Path) :- findPath2([on(Y,_,M)|Zs], To, [(N,M)|TmpPath], Path).
findPath([on(From,_,N)], From, To, _, [(N,To)]) :- node(To, _, _). % To is a node

findPath2([on(X,_,N),on(Y,_,M)|Zs], To, TmpPath, Path) :- dif(X, To), findPath2([on(Y,_,M)|Zs], To, [(N,M)|TmpPath], Path).
findPath2([on(_,_,N)], To, TmpPath, [(N,To)|TmpPath]) :- node(To , _, _). % To is a node
findPath2([on(To,_,_)|_], To, TmpPath, TmpPath). % To is a VNF


usedBW(From, To, AllocatedBW, UsedBW) :-
    findall(UBW, member((From, To, UBW), AllocatedBW), UBWList),
    sumlist(UBWList, UsedBW).

% First in - first served
rankIntent1(OrderedIntentList, _, OrderedIntentList)..

% Shorter Chain. If Chains lengths are equals, minimum number of property
rankIntent2([intent(StakeHolder, IID, NUsers, TId)|T], UnorderedIntentList, OrderedIntentList) :-       
    target(TId, Chain), length(Chain, TmpChainLength),
    findall(CProperty, propertyExpectation(IID, CProperty, _, _, _), CPList), length(CPList, NumCProperty),
    ChainLength is TmpChainLength + NumCProperty,
    findall(NCProperty, propertyExpectation(IID, NCProperty, _, _, _, _, _, _), NCPList), length(NCPList, NumNCProperty),
    rankIntent2(T, [(ChainLength, NumNCProperty, intent(StakeHolder, IID, NUsers, TId))|UnorderedIntentList], OrderedIntentList).
rankIntent2([], UnorderedIntentList, OrderedIntentList) :- 
    sort(UnorderedIntentList, TmpOrderedIntentList),
    maplist(extractIntent, TmpOrderedIntentList, OrderedIntentList).

% Intent with (estimated) less resources needed first
rankIntent3([intent(StakeHolder, IID, NUsers, TId)|T], UnorderedIntentList, OrderedIntentList) :- 
    target(TId, Chain), findReqHW(Chain, NUsers, 0, ChainHW),
    findall(F, (propertyExpectation(IID, Property, _, _, _), changingProperty(Property, F)), CProperty), findReqHW(CProperty, NUsers, 0, CPropertyHW),
    HW is ChainHW + CPropertyHW,
    rankIntent3(T, [(HW, 0, intent(StakeHolder, IID, NUsers, TId))|UnorderedIntentList], OrderedIntentList).
rankIntent3([], UnorderedIntentList, OrderedIntentList) :-
    sort(UnorderedIntentList, TmpOrderedIntentList),
    maplist(extractIntent, TmpOrderedIntentList, OrderedIntentList).

% Random
rankIntent4(IntentList, _, OrderedIntentList) :- random_permutation(IntentList, OrderedIntentList).

findBW(IntentID, F, _, NewBWValue) :-
    propertyExpectation(IntentID, bandwidth, larger, hard, NewBWValue, megabps, _, F).
findBW(IntentID, F, LastBWValue, LastBWValue) :-
    \+ propertyExpectation(IntentID, bandwidth, larger, hard, _, megabps, _, F).

findReqHW([F|T], NUsers, Acc, HW) :-
    vnfXUser(F, _, (Min, Max), TmpHW),
    between(Min, Max, NUsers),
    NewHW is TmpHW + Acc,
    findReqHW(T, NUsers, NewHW, HW).
findReqHW([], _, HW, HW).

allocatedHW([P|T], N, AllocHW) :-
    allocatedHW(T, N, PsAllocHW),
    findall(HWReqs, (member(on(VNF, V, N), P), vnfXUser(VNF, V, _, HWReqs)), HWs), sumHWs(HWs, PAllocHW),
    AllocHW is PsAllocHW + PAllocHW.
allocatedHW([], _, 0).

sumHWs([(RamReq, CPUReq, StorageReq)|T], PAllocHW) :-
    sumHWs(T, (AllocRam, AllocCPU, AllocStorage)),
    PAllocHW is (RamReq+AllocRam, CPUReq+AllocCPU, StorageReq+AllocStorage).
sumHWs([], (0,0,0)).

sumBW([(_,_,BWValue)|T], TotValue) :-
    sumBW(T, TmpValue),
    TotValue is TmpValue + BWValue.
sumBW([], 0).

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


round(X,D,Y) :- Z is X * 10^D, round(Z, ZA), Y is ZA / 10^D.


extractIntent((_,_, X), X).


test(N, List, Out):-
    dif(N,0),
    multiDips((_, V, _, _, _, _, _)),
    addIf(List,V, NewList),
    NewN is N-1,
    test(NewN, NewList, Out).
test(0, List, Out) :- sort(List, Out).

addIf(List, V, NewList) :-
    \+ member(V, List),
    NewList = [V|List].
addIf(List, V, List) :-
    member(V, List).