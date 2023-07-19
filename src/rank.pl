:-['utils.pl'].

weigth(cost, 32).
weigth(energy, 18).
weigth(emissions, 50).

%% INTENT RANKING %%

% First in - first served
rankIntent1(OrderedIntentList, _, OrderedIntentList).

% Shorter Chain first, if Chains lengths are equals, minimum number of property first.
rankIntent2([Intent|Is], UnorderedIntentList, OrderedIntentList) :-
    Intent = intent(_, IId, _, TId),
    target(TId, Chain),
    length(Chain, NumChainF),
    findall(CProperty, propertyExpectation(IId, CProperty, _,_,_), CPList),
    length(CPList, NumCProperties),
    ChainLength is NumChainF + NumCProperties,
    findall(NCProperty, propertyExpectation(IId, NCProperty, _,_,_,_,_,_), NCPList),
    length(NCPList, NumNCProperty),
    rankIntent2(Is, [(ChainLength, NumNCProperty, Intent)|UnorderedIntentList], OrderedIntentList).

rankIntent2([], UnorderedIntentList, OrderedIntentList) :-
    sort(UnorderedIntentList, TmpOrderedIntentList),
    maplist(extractIntent, TmpOrderedIntentList, OrderedIntentList).

% Intent with (estimated) higher resources needed first
rankIntent3([Intent|Is], UnorderedIntentList, OrderedIntentList) :-
    Level = _,
    Intent = intent(_, IId, NUsers, TId),
    target(TId, Chain),
    filteredChain(Chain, Level, FilteredChain),
    findReqHW(FilteredChain, NUsers, ChainHW),
    findall(F, filteredPropertiesF(IId, Level, F), CProperties),
    findReqHW(CProperties, NUsers, CPropertiesHW),
    sumReqs(ChainHW, CPropertiesHW, (Ram, CPU, Storage)),
    HW is Ram + CPU + (Storage/100),
    rankIntent3(Is, [(HW, 0, Intent)|UnorderedIntentList], OrderedIntentList).

rankIntent3([], UnorderedIntentList, OrderedIntentList) :-
    sort(1, @>=, UnorderedIntentList, TmpOrderedIntentList),
    maplist(extractIntent, TmpOrderedIntentList, OrderedIntentList).

filteredChain(Chain, Level, FilteredChain) :- findall(F, (member(F, Chain),vnf(F, Level,_)), FilteredChain).

filteredPropertiesF(IId, Level, F) :- propertyExpectation(IId, Property, Level, _,_), changingProperty(Property, F).

% Random
rankIntent4(IntentList, _, OrderedIntentList) :- random_permutation(IntentList, OrderedIntentList).


%% NODE RANKING %%
sortByAttributes(Nodes, SortedNodes) :- 
    nodeMinMax(Nodes, Min, Max),
    sortByAttributes(Nodes, Min, Max, [], SortedNodes).

sortByAttributes([N|T], Min, Max, OldSortedNodes, SortedNodes) :- 
    energyCost(N, Cost),
    nodeUnitEnergy(N, Energy),
    energySourceMix(N, Sources),
    nodeEmissions(Sources, NodeEmissions),
    rank((Cost, Energy, NodeEmissions), Min, Max, Rank),
    sortByAttributes(T, Min, Max, [(Rank, N)|OldSortedNodes], SortedNodes).
sortByAttributes([], _, _, OldSortedNodes, SortedNodes) :- sort(OldSortedNodes, SortedNodes).

nodeEmissions([(Prob, Src)|Srcs], NodeEmissions) :-
    nodeEmissions(Srcs, TmpNodeEmissions),
    emissions(Src, Emissions),
    NodeEmissions is TmpNodeEmissions + Prob * Emissions.
nodeEmissions([], 0).

rank(Values, Min, Max, Rank) :-
    normalizedValues(Values, Min, Max, (NormCost, NormEnergy, NormEmissions)),
    weigth(cost, WeigthC), weigth(energy, WeigthEn), weigth(emissions, WeigthEm),
    Rank is NormCost*WeigthC + NormEnergy*WeigthEn + NormEmissions*WeigthEm.

normalizedValues(Values, Min, Max, NValues) :-
    Values = (Cost, Energy, NodeEmissions),
    Min = (MinCost, MinEnergy, MinEmissions), Max = (MaxCost, MaxEnergy, MaxEmissions),
    normalization(Cost, MinCost, MaxCost, NormCost),
    normalization(Energy, MinEnergy, MaxEnergy, NormEnergy),
    normalization(NodeEmissions, MinEmissions, MaxEmissions, NormEmissions),
    NValues = (NormCost, NormEnergy, NormEmissions).

normalization(Value, MinValue, MaxValue, NormValue) :-
    NormValue is (Value-MinValue)/(MaxValue-MinValue).



% https://en.wikipedia.org/wiki/Feature_scaling#Rescaling_(min-max_normalization)