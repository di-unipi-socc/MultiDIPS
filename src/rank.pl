:-['utils.pl'].

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
sortByAttributes(Nodes, SortedNodes) :- 
    nodeMinMax(Nodes, Min, Max),
    sortByAttributes(Nodes, Min, Max, [], SortedNodes).

sortByAttributes([N|T], Min, Max, OldSortedNodes, SortedNodes) :- 
    Min = (MinCost, MinEnergy, MinPue, MinEmissions),
    Max = (MaxCost, MaxEnergy, MaxPue, MaxEmissions),
    energyCost(N, Cost),
    energySourceMix(N, Sources),
    greenScore(Sources, GreenScore),
    nodeTotEnergy(N, Energy),
    pue(N, Pue),
    normalizzation(Cost, MinCost, MaxCost, NormCost),
    normalizzation(Energy, MinEnergy, MaxEnergy, NormEnergy),
    normalizzation(Pue, MinPue, MaxPue, NormPue), 
    normalizzation(GreenScore, MinEmissions, MaxEmissions, NormGreenScore),
    Weight is NormCost*30 + NormEnergy*10 + NormPue*10 + NormGreenScore*50,
    sortByAttributes(T, Min, Max, [(Weight, N)|OldSortedNodes], SortedNodes).
sortByAttributes([], _, _, OldSortedNodes, SortedNodes) :- sort(OldSortedNodes, SortedNodes).

greenScore([(Prob, Src)|Srcs], GreenScore) :-
    greenScore(Srcs, TmpGreenScore),
    emissions(Src, Emissions),
    GreenScore is TmpGreenScore + Prob * Emissions.
greenScore([], 0).

normalizzation(Value, MinValue, MaxValue, NormValue) :-
    NormValue is (Value-MinValue)/(MaxValue-MinValue).

% https://en.wikipedia.org/wiki/Feature_scaling#Rescaling_(min-max_normalization)