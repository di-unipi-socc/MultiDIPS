/*
0. clean up and extend code with triples 
    - energy model (e.g. based on RAM, CPU)
    - hw usage
    - add IntentId in IntentFulfillment?
1. think about 1-2 smart heuristics?
    - e.g. findall((AttributeNode, Node), ..., Nodes), sortByAttributed(Nodes, SortedNodes),
        ... 
2. motivating scenario: to explain the problem and the considered features, and to "tell our story"
3. extensive simulation (to be run on Unipi GreenCloud DC): that allows simulating and assessing different placement strategies in multiple realistic scenarios and averaging KPIs (e.g. exec times, profit, emissions, energy consumption, etc.)
    a. generate 20 random infrastructure with realistic data for [8, 16, 32, 64, 128, 256, 512] nodes
    b. try to place [10, 50, 100] intents onto all infras, setting a cap of 10 minutes, finding optimal vs heuristics
3'. MILP (14/06)
3''. MILP vs Prolog
3'''. Proposta TDR 
*/

subList(P, From, To, P) :- var(From), var(To).
subList(P, From, To, NewP) :- var(From), nonvar(To), removeAfterTo(P, To, [], NewP).
subList(P, From, To, NewP) :- nonvar(From), var(To), removeBeforeFrom(P, From, NewP).
subList(P, From, To, NewP) :- nonvar(From), nonvar(To), removeBeforeFrom(P, From, TmpP), removeAfterTo(TmpP, To, [], NewP).

removeAfterTo([on(X,D,N)|T], To, OldP, NewP) :-
    dif(X, To),
    append(OldP, [on(X,D,N)], TmpP),
    removeAfterTo(T, To, TmpP, NewP).
removeAfterTo([on(To,D,N)|_], To, OldP, NewP) :-
    append(OldP, on(To,D,N), NewP).

removeBeforeFrom([on(X,_,_)|T], From, NewP) :-
    dif(X, From),
    removeBeforeFrom(T, From, NewP).
removeBeforeFrom([on(From,D,N)|T], From, [on(From,D,N)|T]).
