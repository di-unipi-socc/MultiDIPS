%% INTENT RANKING %%

% First in - first served
rankIntent1(OrderedIntentList, _, OrderedIntentList).

% Shorter Chain first, if Chains lengths are equals, minimum number of property first.
rankIntent2([Intent|Is], UnorderedIntentList, OrderedIntentList) :-
    Intent = intent(_, IntentId, _, TId),
    target(TId, Chain),
    length(Chain, NumChainF),
    findall(CProperty, propertyExpectation(IntentId, CProperty, _,_,_), CPList),
    length(CPList, NumCProperties),
    ChainLength is NumChainF + NumCProperties,
    findall(NCProperty, propertyExpectation(IntentId, NCProperty, _,_,_,_,_,_), NCPList),
    length(NCPList, NumNCProperty),
    rankIntent2(Is, [(ChainLength, NumNCProperty, Intent)|UnorderedIntentList], OrderedIntentList).
rankIntent2([], UnorderedIntentList, OrderedIntentList) :-
    sort(1, @>=,UnorderedIntentList, TmpOrderedIntentList),
    maplist(extractIntent, TmpOrderedIntentList, OrderedIntentList).

% Intent with (estimated) higher resources needed first
rankIntent3([Intent|Is], UnorderedIntentList, OrderedIntentList) :-
    Intent = intent(_, IntentId, NUsers, TId),
    target(TId, Chain),
    findReqHW(Chain, NUsers, ChainHW),
    findall(F, propertiesVNF(IntentId, F), CPropertiesVNF),
    findReqHW(CPropertiesVNF, NUsers, CPropertiesHW),
    sumReqs(ChainHW, CPropertiesHW, (Ram, CPU, Storage)),
    TotHW is Ram + CPU + (Storage/100),
    rankIntent3(Is, [(TotHW, 0, Intent)|UnorderedIntentList], OrderedIntentList).
rankIntent3([], UnorderedIntentList, OrderedIntentList) :-
    sort(1, @>=, UnorderedIntentList, TmpOrderedIntentList),
    maplist(extractIntent, TmpOrderedIntentList, OrderedIntentList).

propertiesVNF(IntentId, F) :- propertyExpectation(IntentId, Property, _, _, _), changingProperty(Property, F).

% Random
rankIntent4(IntentList, _, OrderedIntentList) :- random_permutation(IntentList, OrderedIntentList).


%% NODE RANKING %%

weigth(cost, 32).
weigth(energy, 18).
weigth(emissions, 50).

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
    Rank is NormCost * WeigthC + NormEnergy * WeigthEn + NormEmissions * WeigthEm.

normalizedValues(Values, Min, Max, NormValues) :-
    Values = (Cost, Energy, NodeEmissions),
    Min = (MinCost, MinEnergy, MinEmissions), Max = (MaxCost, MaxEnergy, MaxEmissions),
    normalization(Cost, MinCost, MaxCost, NormCost),
    normalization(Energy, MinEnergy, MaxEnergy, NormEnergy),
    normalization(NodeEmissions, MinEmissions, MaxEmissions, NormEmissions),
    NormValues = (NormCost, NormEnergy, NormEmissions).

normalization(Value, MinValue, MaxValue, NormValue) :-
    NormValue is (Value-MinValue)/(MaxValue-MinValue).