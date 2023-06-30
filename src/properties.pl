:-['utils.pl'].

% CHANGING PROPERTIES
%% specific cases defined before general ones

chainModifiedByProperty(logging, edge, _, _, F, [F|C], [F|C]).
chainModifiedByProperty(logging, edge, _, _, F, C, [F|C]) :- dif(C, [F|_]).
chainModifiedByProperty(P, Bound, From, To, F, Chain, NewChain) :- dif((P, Bound), (logging, edge)), var(From), var(To), addedAtEdge(Chain, F, NewChain).     % a questo punto Chain è un insieme di coppie (Funzione, Layer)
chainModifiedByProperty(_, _, From, To, F, Chain, NewChain) :- nonvar(From), var(To), vnf(From, FromAff, _), addedBefore(Chain, (From, FromAff), F, NewChain).   % FromAff è il layer
chainModifiedByProperty(_, _, From, To, F, Chain, NewChain) :- var(From), nonvar(To), vnf(To, ToAff, _), addedAfter(Chain, (To, ToAff), F, NewChain).
chainModifiedByProperty(_, _, From, To, F, Chain, NewChain) :- nonvar(From), nonvar(To), vnf(From, FromAff, _), vnf(To, ToAff, _), addedFromTo(Chain, (From, FromAff), (To, ToAff), F, NewChain).


% NON-CHANGING PROPERTIES

checkProperty(IntentID, latency, From, To, Placement, _, OldUP, OldUP) :-
    propertyExpectation(IntentID, latency, smaller, _, Value, _, From, To), pathLat(Placement, From, To, Lat), 
    Lat =< Value.
checkProperty(IntentID, latency, From, To, Placement, _, OldUP, [(latency, desired(Value), actual(Lat))|OldUP]) :-
    propertyExpectation(IntentID, latency, smaller, soft, Value, _, From, To), pathLat(Placement, From, To, Lat), 
    Lat > Value.
checkProperty(IntentID, bandwidth, From, To, Placement, OldAllocatedBW, OldUP, OldUP) :-
    propertyExpectation(IntentID, bandwidth, larger, _, Value, _, From, To), minBW(Placement, From, To, BW, OldAllocatedBW),
    BW >= Value.


% GLOBAL PROPERTIES

checkGlobalProperties(OldC, OldE, C, E, [(footprint, Cap)|T]) :-
    OldC + C =< Cap,
    checkGlobalProperties(OldC, OldE, C, E, T).
checkGlobalProperties(OldC, OldE, C, E, [(energy, Cap)|T]) :-
    OldE + E =< Cap,
    checkGlobalProperties(OldC, OldE, C, E, T).
checkGlobalProperties(_, _, _, _, []).