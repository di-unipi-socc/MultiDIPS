/*
0. clean up and extend code with triples 
    - energy model (e.g. based on RAM, CPU)
    - hw usage
1. motivating scenario: to explain the problem and the considered features, and to "tell our story"
2. extensive simulation (to be run on Unipi GreenCloud DC): that allows simulating and assessing different placement strategies in multiple realistic scenarios and averaging KPIs (e.g. exec times, profit, emissions, energy consumption, etc.)
    a. generate 20 random infrastructure with realistic data
    b. try to place [1, 5, 10] intents onto each of the random infrastructures with:
        - heuristic strategies
        - optimal strategy
    c. try to place onto [32, 54, 128, 256, 512, 1024] onto each of the random infrastructures with heuristics only
3. MILP vs Prolog
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
