:-['utils.pl'].

% CHANGING PROPERTIES
%% specific cases defined before general ones

chainModifiedByProperty(logging, edge, _, _, F, [F|C], [F|C]).
chainModifiedByProperty(logging, edge, _, _, F, C, [F|C]) :- dif(C, [F|_]).
chainModifiedByProperty(P, Bound, From, To, F, Chain, NewChain) :- dif((P, Bound), (logging, edge)), var(From), var(To), addedAtEdge(Chain, F, NewChain).     % a questo punto Chain è un insieme di coppie (Funzione, Layer)
chainModifiedByProperty(_, _, From, To, F, Chain, NewChain) :- nonvar(From), var(To), vnf(From, FromAff, _), addedBefore(Chain, (From, FromAff), F, NewChain).   % FromAff è il layer
chainModifiedByProperty(_, _, From, To, F, Chain, NewChain) :- var(From), nonvar(To), vnf(To, ToAff, _), addedAfter(Chain, (To, ToAff), F, NewChain).
chainModifiedByProperty(_, _, From, To, F, Chain, NewChain) :- nonvar(From), nonvar(To), vnf(From, FromAff, _), vnf(To, ToAff, _), addedFromTo(Chain, (From, FromAff), (To, ToAff), F, NewChain).


% NON-CHANGING SOFT PROPERTIES

checkProperty(IntentID, latency, From, To, Placement, OldUP, OldUP) :-
    propertyExpectation(IntentID, latency, smaller, _, Value, _, From, To), pathLat(Placement, From, To, Lat), 
    Lat =< Value.
checkProperty(IntentID, latency, From, To, Placement, OldUP, [(latency, desired(Value), actual(Lat))|OldUP]) :-
    propertyExpectation(IntentID, latency, smaller, soft, Value, _, From, To), pathLat(Placement, From, To, Lat), 
    Lat > Value.

% NON-CHANGING HARD PROPERTIES

checkBW(P, AllocBW, OldAllocBW) :-
    placementPath(P, Path),
    append(AllocBW, OldAllocBW, TotAllocBW),
    checkLinks(Path, TotAllocBW).

checkLinks([(N, M)|T], AllocBW) :-
    findall(UsedBW, member((N, M, UsedBW), AllocBW), UsedBWs), sumlist(UsedBWs, TotUsedBW),
    link(N, M, _, BW), TotUsedBW =< BW,
    checkLinks(T, AllocBW).
checkLinks([], _).

checkLat(IntentId, P) :-
    P = [on(From,_,_), on(To,_,_)|_],
    propertyExpectation(IntentId, latency, smaller, hard, Value, _, From, To),
    pathLat(P, From, To, Lat), Lat =< Value.
checkLat(IntentId, P) :-
    P = [on(From,_,_), on(To,_,_)|_],
    \+ propertyExpectation(IntentId, latency, smaller, hard, _, _, From, To).
checkLat(_, [on(_,_,_)]).


% GLOBAL PROPERTIES

checkGlobalProperties([(footprint, Cap)|T], PsInfo, PInfo) :-
    checkGlobalProperties(T, PsInfo, PInfo),
    PsInfo = info(_, OldC, _, _, _, _), PInfo = info(_, C, _, _, _, _), 
    OldC + C =< Cap.
checkGlobalProperties([(energy, Cap)|T], PsInfo, PInfo) :-
    checkGlobalProperties(T, PsInfo, PInfo),
    PsInfo = info(_, _, OldE, _, _, _), PInfo = info(_, _, E, _, _, _),
    OldE + E =< Cap.
checkGlobalProperties([], _, _).