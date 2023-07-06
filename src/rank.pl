%% INTENT  %%

% First in - first served
rankIntent1(OrderedIntentList, _, OrderedIntentList).

% Shorter Chain. If Chains lengths are equals, minimum number of property
rankIntent2([intent(StakeHolder, IID, NUsers, TId)|T], UnorderedIntentList, OrderedIntentList) :-       
    target(TId, Chain), length(Chain, TmpChainLength),
    findall(CProperty, propertyExpectation(IID, CProperty, _, _, _), CPList), length(CPList, NumCProperty),
    ChainLength is TmpChainLength + NumCProperty,
    findall(NCProperty, propertyExpectation(IID, NCProperty, _, _, _, _, _, _), NCPList), length(NCPList, NumNCProperty),
    rankIntent2(T, [(ChainLength, NumNCProperty, intent(StakeHolder, IID, NUsers, TId))|UnorderedIntentList], OrderedIntentList).
rankIntent2([], UnorderedIntentList, OrderedIntentList) :- 
    sort(UnorderedIntentList, TmpOrderedIntentList), maplist(extractIntent, TmpOrderedIntentList, OrderedIntentList).

% Intent with (estimated) higher resources needed first
rankIntent3([intent(StakeHolder, IID, NUsers, TId)|T], UnorderedIntentList, OrderedIntentList) :- 
    target(TId, Chain), findall(F, (member(F,Chain),vnf(F,_,_)), FilteredChain),
    findReqHW(FilteredChain, NUsers, ChainHW),
    findall(F, (propertyExpectation(IID, Property, _,_,_), changingProperty(Property, F)), CProperty), findReqHW(CProperty, NUsers, CPropertyHW),
    sumReqs(ChainHW, CPropertyHW, (Ram, CPU, Storage)),
    HW is Ram+CPU+Storage,
    rankIntent3(T, [(HW, 0, intent(StakeHolder, IID, NUsers, TId))|UnorderedIntentList], OrderedIntentList).
rankIntent3([], UnorderedIntentList, OrderedIntentList) :-
    sort(1, @>=, UnorderedIntentList, TmpOrderedIntentList), maplist(extractIntent, TmpOrderedIntentList, OrderedIntentList).

% Random
rankIntent4(IntentList, _, OrderedIntentList) :- random_permutation(IntentList, OrderedIntentList).


%% NODE  %%

sortByAttributes([N|T], OldSortedNodes, SortedNodes) :- 
    energyCost(N, Cost),
    energySourceMix(N, Sources),
    greenScore(Sources, GreenScore),
    ramEnergyProfile(N, 1, E1), cpuEnergyProfile(N, 1, E2), storageEnergyProfile(N, 1, E3), Energy is E1+E2+E3,
    pue(N, Pue),
    Weight is Cost/0.5*100 + Energy/1*100 + Pue/2*100 + GreenScore,
    sortByAttributes(T, [(Weight, N)|OldSortedNodes], SortedNodes).
sortByAttributes([], OldSortedNodes, SortedNodes) :- sort(OldSortedNodes, SortedNodes).

greenScore([(Prob, Src)|Srcs], GreenScore) :-
    greenScore(Srcs, TmpGreenScore),
    emissions(Src, Emissions),
    GreenScore is TmpGreenScore + Prob * Emissions * 60.
greenScore([], 0).
