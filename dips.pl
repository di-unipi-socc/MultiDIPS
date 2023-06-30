:-['src/data.pl', 'src/dataInfrProv.pl','src/properties.pl'].

:- set_prolog_flag(answer_write_options,[max_depth(0), spacing(next_argument)]).
:- set_prolog_flag(stack_limit, 32 000 000 000).
:- set_prolog_flag(last_call_optimisation, true).

/*
go(Problem, BestSol, PBest) :-
    solution(Problem, BestSol), profit(BestSol, PBest),
    \+ (solution(Problem, Sol), dif(BestSol, Sol), profit(Sol,P), P > PBest).

IDEE: 
- globali -> anche resource usage medio?
- keep intent id in the placement?
*/

optimumDips(Output) :-
    statistics(runtime,[Start|_]), % CPU time, maybe?
    findall(intent(StakeHolder, IntentID, NUsers, TargetId), intent(StakeHolder, IntentID, NUsers, TargetId), IntentList),
    findall((Property, Cap), globalIntent(Property, smaller, Cap, _), GlobalProperties),
    findall(P, validPlacement(IntentList, GlobalProperties, P), Sols),
    sort(2, @>=, Sols, [(L, PR, C, E, P, ABW, U)|_]),
    reverse(IntentList, ReverseIntentList),
    findUnfulfilledIntent(ReverseIntentList, P),
    round(PR, 3, NewPR),
    round(C, 3, NewC),
    round(E, 3, NewE),
    Output = (L, NewPR, NewC, NewE, P, ABW, U), !,
    statistics(runtime,[Stop|_]),
    Runtime is (Stop - Start)/1000,
    write('Execution time: '), write(Runtime), nl, nl.


validPlacement(IntentList, GlobalProperties, P) :-
    placement(IntentList, GlobalProperties, [], [], (0, 0, 0, 0, [], [], []), P).

placement([intent(StakeHolder, IID, NUsers, _)|Is], GlobalProperties, Permutation, AllocatedBW, (OldL, OldPR, OldC, OldE, OldP, OldABW, OldU), Result) :-
    dips(StakeHolder, IID, NUsers, NewPlacements, Permutation, AllocatedBW), 
    member((L, PR, C, E, P, ABW, U), NewPlacements),
    checkGlobalProperties(OldC, OldE, C, E, GlobalProperties),
    mergePlacements((OldL, OldPR, OldC, OldE, OldP, OldABW, OldU), (L, PR, C, E, P, ABW, U), (NewL, NewPR, NewC, NewE, NewP, NewABW, NewU)),
    placement(Is, GlobalProperties, [P|Permutation], NewABW, (NewL, NewPR, NewC, NewE, NewP, NewABW, NewU), Result).
placement([], _, _, _, Result, Result).


mergePlacements(OldInfo, Info, NewInfo) :-
    OldInfo=(OldL, OldPR, OldC, OldE, OldP, OldABW, OldU), Info=(L, PR, C, E, P, ABW, U),
    NewL is OldL + L, NewPR is OldPR + PR, NewC is OldC + C, NewE is OldE + E,
    NewInfo=(NewL, NewPR, NewC, NewE, [P|OldP], [ABW|OldABW], [U|OldU]).


findUnfulfilledIntent([intent(_, IID, _, _)|Is], [[]|Ps]) :- write('Impossibile rispettare intento: '), write(IID), nl, nl, findUnfulfilledIntent(Is, Ps).
findUnfulfilledIntent([_|Is], [[_|_]|Ps]) :- findUnfulfilledIntent(Is, Ps).
findUnfulfilledIntent([],[]).


multiDips(Output) :-
    findall(intent(StakeHolder, IntentID, NUsers, TargetId), intent(StakeHolder, IntentID, NUsers, TargetId), IntentList),
    rankIntent3(IntentList, [], OrderedIntentList),
    findall((Property, Cap), globalIntent(Property, smaller, Cap, _), GlobalProperties),
    callDips(OrderedIntentList, [], [], (0, 0, 0, 0, [], [], []), GlobalProperties, Output), !.


% First in - first served
rankIntent1(OrderedIntentList, _, OrderedIntentList).
rankIntent1([], _, []).

% Shorter Chain. If Chains lengths are equals, minimum number of property
rankIntent2([intent(StakeHolder, IID, NUsers, TId)|T], UnorderedIntentList, OrderedIntentList) :-       
    target(TId, Chain),
    length(Chain, TmpChainLength),
    findall(CProperty, propertyExpectation(IID, CProperty, _, _, _), CPList),
    length(CPList, NumCProperty),
    ChainLength is TmpChainLength + NumCProperty,
    findall(NCProperty, propertyExpectation(IID, NCProperty, _, _, _, _, _, _), NCPList),
    length(NCPList, NumNCProperty),
    rankIntent2(T, [(ChainLength, NumNCProperty, intent(StakeHolder, IID, NUsers, TId))|UnorderedIntentList], OrderedIntentList).
rankIntent2([], UnorderedIntentList, OrderedIntentList) :- 
    sort(UnorderedIntentList, TmpOrderedIntentList),
    maplist(extractIntent, TmpOrderedIntentList, OrderedIntentList).

% Intent with (estimated) less resources needed first
rankIntent3([intent(StakeHolder, IID, NUsers, TId)|T], UnorderedIntentList, OrderedIntentList) :- 
    target(TId, Chain),
    findReqHW(Chain, NUsers, 0, ChainHW),
    findall(F, (propertyExpectation(IID, Property, _, _, _), changingProperty(Property, F)), CProperty),
    findReqHW(CProperty, NUsers, 0, CPropertyHW),
    HW is ChainHW + CPropertyHW,
    rankIntent3(T, [(HW, 0, intent(StakeHolder, IID, NUsers, TId))|UnorderedIntentList], OrderedIntentList).
rankIntent3([], UnorderedIntentList, OrderedIntentList) :-
    sort(UnorderedIntentList, TmpOrderedIntentList),
    maplist(extractIntent, TmpOrderedIntentList, OrderedIntentList).

% Random
rankIntent4(IntentList, _, OrderedIntentList) :- random_permutation(IntentList, OrderedIntentList).


findReqHW([F|T], NUsers, Acc, HW) :-
    vnfXUser(F, _, (Min, Max), TmpHW),
    between(Min, Max, NUsers),
    NewHW is TmpHW + Acc,
    findReqHW(T, NUsers, NewHW, HW).
findReqHW([], _, HW, HW).


callDips([intent(StakeHolder, IID, NUsers, _)|T], OldPlacements, AllocatedBW, Acc, GlobalProperties, Output) :-
    dips(StakeHolder, IID, NUsers, NewPlacements, OldPlacements, AllocatedBW),       
    rankPlacements(NewPlacements, RankedNewPlacements),
    choosePlacements(RankedNewPlacements, Acc, GlobalProperties, IID, (L, PR, C, E, P, ABW, U)),    
    mergePlacements(Acc, (L, PR, C, E, P, ABW, U), (NewL, NewPR, NewC, NewE, NewP, NewABW, NewU)),
    callDips(T, [P|OldPlacements], NewABW, (NewL, NewPR, NewC, NewE, NewP, NewABW, NewU), GlobalProperties, Output).
callDips([], _, _, (L, PR, C, E, P, ABW, U), _, (L, NewPR, NewC, NewE, P, ABW, U)) :-
    round(PR, 3, NewPR),
    round(C, 3, NewC),
    round(E, 3, NewE).


rankPlacements(P, RankedP) :- sort(2, @>=, P, RankedP).
    

choosePlacements([(L, PR, C, E, P, ABW, U),_|_], (_, _, OldC, OldE, _, _, _), GlobalProperties, _, (L, PR, C, E, P, ABW, U)) :-  
    checkGlobalProperties(OldC, OldE, C, E, GlobalProperties).
choosePlacements([(_, _, C, E, _, _, _)|T], (_, _, OldC, OldE, _, _, _), GlobalProperties, IID, Placement) :-  
    \+ checkGlobalProperties(OldC, OldE, C, E, GlobalProperties),
    choosePlacements(T, (_, _, OldC, _, _, _, _), GlobalProperties, IID, Placement).
choosePlacements([(0,0,0,0,[],[],[])], _, _, IID, (0, 0, 0, 0, [], [], [])) :- write('Impossibile rispettare intento: '), write(IID), nl, nl.


dips(StakeHolder, IntentID, NUsers, Targets, OldPlacements, OldAllocatedBW) :-
    findall(T, delivery(StakeHolder, IntentID, NUsers, OldPlacements, OldAllocatedBW, T), TmpTargets),
    Targets = [(0,0,0,0,[],[],[])|TmpTargets].


delivery(StakeHolder, IntentID, NUsers, OldPlacements, OldAllocatedBW, (L, Profit, Carbon, Energy, Placement, AllocatedBW, Unsatisfied)) :- 
    chainForIntent(StakeHolder, IntentID, Chain),
    dimensionedChain(Chain, NUsers, DimChain),
    findall((P, From, To), propertyExpectation(IntentID, P, _, _, _, _, From, To), NCP),      % Non changing property
    placedChain(IntentID, DimChain, NCP, Placement, OldPlacements, OldAllocatedBW, Unsatisfied, AllocatedBW, Energy, Carbon, Profit),
    length(Unsatisfied, L).


%% ASSEMBLY %%

chainForIntent(StakeHolder, IntentID, Chain) :-
    intent(StakeHolder, IntentID, _, TargetId), 
    target(TargetId, ServiceChain), 
    layeredChain(ServiceChain, LChain),
    findall((P,F), (changingProperty(P,F), propertyExpectation(IntentID, P, _, _, _)), Properties),
    completedChain(IntentID, Properties, LChain, Chain).


layeredChain([F|Fs], [(F,A)|NewFs]) :- 
    vnf(F, A, _), layeredChain(Fs, NewFs).
layeredChain([], []).


completedChain(IntentID, [(P,F)|Ps], Chain, NewChain) :- 
    propertyExpectation(IntentID, P, Bound, From, To), vnf(F, Bound, _),
    chainModifiedByProperty(P, Bound, From, To, (F,Bound), Chain, ModChain),
    completedChain(IntentID, Ps, ModChain, NewChain).
completedChain(_, [], Chain, Chain).


%% PLACEMENT %%

dimensionedChain(Chain, NUsers, DimChain) :- 
    dimensionedChain(Chain, NUsers, [], DimChain).
dimensionedChain([(F,A)|Zs], U, OldC, NewC) :- 
    vnfXUser(F, D, (L, H), _), between(L, H, U),  dimensionedChain(Zs, U, [(F, A, D)|OldC], NewC).
dimensionedChain([], _, Chain, Chain).


placedChain(IntentID, Chain, NCP, NewP, OldPlacements, OldAllocatedBW, UP, AllocatedBW, Energy, Carbon, Profit) :-                   
    placedChain(IntentID, Chain, _, _, [], NewP, OldPlacements, [], 0, 0, 0, AllocatedBW, Energy, Carbon, Profit),
    checkPlacement(IntentID, NCP, NewP, OldAllocatedBW, UP).
placedChain(IntentID, [(F, L, D)|VNFs], LastNode, LastBWValue, TmpP, NewP, OldPlacements, TmpAllocBW, TmpEnergy, TmpCarbon, TmpProfit, AllocatedBW, Energy, Carbon, Profit) :-
    vnfXUser(F, D, _, HWReqs), node(N, L, HWCaps),  
    hwOK(N, HWReqs, HWCaps, OldPlacements, TmpP, HWUsage),
    findBW(IntentID, F, LastBWValue, NewBWValue),

    % placement BW, Footprint, Profit calculation
    calculateAllocatedBW(N, LastNode, LastBWValue, TmpAllocBW, NewABW),
    calculateFootprintHW(N, HWUsage, HWReqs, HWEnergy, HWCarbon),
    calculateFootprintBW(NewBWValue, BWEnergy, BWCarbon),
    calculateProfit(N, HWReqs, BWEnergy, HWEnergy, NProfit),

    NewEnergy is HWEnergy + BWEnergy + TmpEnergy,
    NewCarbon is HWCarbon + BWCarbon + TmpCarbon,
    NewProfit is TmpProfit + NProfit,
    placedChain(IntentID, VNFs, N, NewBWValue, [on(F, D, N)|TmpP], NewP, OldPlacements, NewABW, NewEnergy, NewCarbon, NewProfit, AllocatedBW, Energy, Carbon, Profit).
placedChain(_, [], _, _, P, P, _, AllocatedBW, Energy, Carbon, Profit, AllocatedBW, Energy, Carbon, Profit).


hwOK(N, HWReqs, HWCaps, OldPlacements, Placement, HWUsage) :- % hw resources are cumulative
    allocatedHW(OldPlacements, N, HWOld),
    findall(HW, (member(on(VNF, V, N), Placement), vnfXUser(VNF, V, _, HW)), HWs), sumlist(HWs, HWSum),
    HWUsage is HWSum + HWOld + HWReqs,
    HWUsage =< HWCaps.


calculateAllocatedBW(_, M, _, NewABW, NewABW) :- var(M).
calculateAllocatedBW(N, M, BWValue, TmpAllocBW, [(N, M, BWValue)|TmpAllocBW]) :- dif(N,M), nonvar(M). 
calculateAllocatedBW(N, N, _, T, T) :- nonvar(N). 


calculateFootprintHW(N, HWUsage, HWReqs, HWEnergy, HWCarbon):-
    node(N, _, HW), totHW(N, TotHW),
    pue(N, PUE), energySourceMix(N, Sources),
    OldL is (TotHW - HW + HWUsage - HWReqs) / TotHW, energyProfile(N, OldL, OldE), 
    NewL is (TotHW - HW + HWUsage) / TotHW, energyProfile(N, NewL, NewE),
    HWEnergy is  (NewE - OldE) * PUE,
    emissions(Sources, HWEnergy, 0, HWCarbon).


emissions([(Prob, Src)|Srcs], Energy, OldCarbon, NewCarbon) :-
    emissions(Src, MU), 
    TmpCarbon is OldCarbon + Prob * MU * Energy,
    emissions(Srcs, Energy, TmpCarbon, NewCarbon).
emissions([], _, E, E).


calculateFootprintBW(BWValue, BWEnergy, BWCarbon) :-
    kWhPerMB(V), averageGCI(GCI),
    BWEnergy is BWValue * V,
    BWCarbon is BWEnergy * GCI.


calculateProfit(N, HWReqs, BWEnergy, HWEnergy, Profit) :-
    node(N,L,_), price(L, Price), cost(N, Cost), energyCost(N, ECost),
    Profit is HWReqs * Price - (HWReqs * Cost + (HWEnergy + BWEnergy) * ECost).


checkPlacement(IntentID, NCP, Placement, OldAllocatedBW, UP) :-
    checkPlacement(IntentID, NCP, Placement, OldAllocatedBW, [], UP).
checkPlacement(IntentID, [(P, From, To)|Ps], Placement, OldAllocatedBW, OldUP, NewUP) :- 
    checkProperty(IntentID, P, From, To, Placement, OldAllocatedBW, OldUP, TmpUP), 
    checkPlacement(IntentID, Ps, Placement, OldAllocatedBW, TmpUP, NewUP).
checkPlacement(_, [], _, _, UP, UP).