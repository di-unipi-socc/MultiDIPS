%% INTENT RANKING %%

% Rank mode choice
rankIntent(RankMode, IntentList, OrderedIntentList) :-
    RankMode = 1, rankIntent1(IntentList, OrderedIntentList).
rankIntent(RankMode, IntentList, OrderedIntentList) :-
    RankMode = 2, rankIntent2(IntentList, [], OrderedIntentList).
rankIntent(RankMode, IntentList, OrderedIntentList) :-
    RankMode = 3, rankIntent3(IntentList, [], OrderedIntentList).
rankIntent(RankMode, IntentList, OrderedIntentList) :-
    RankMode = 4, rankIntent4(IntentList, OrderedIntentList).

% First in - first served
rankIntent1(OrderedIntentList, OrderedIntentList).

% Longer Chain first. If Chains lengths are equals maximum number of property first.
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
rankIntent4(IntentList, OrderedIntentList) :- random_permutation(IntentList, OrderedIntentList).


%% NODE RANKING %%

% Weighted ranking
weight(unitCost, 100).
weight(emission, 0).
weight(freeHW, 0).

sortByAttributes(Nodes, Ps, SortedNodes) :- 
    nodeMinMax(Nodes, Ps, Min, Max),
    sortByAttributes(Nodes, Ps, Min, Max, [], SortedNodes).
sortByAttributes([N|T], Ps, Min, Max, OldSortedNodes, SortedNodes) :- 
    energyCost(N, Cost),
    nodeUnitEnergy(N, Energy),
    UnitCost is Cost * Energy,
    energySourceMix(N, Sources),
    nodeEmissions(Sources, NodeEmissions),
    freeHWScore(N, Ps, FreeHWScore),
    rank((UnitCost, NodeEmissions, FreeHWScore), Min, Max, Rank),
    sortByAttributes(T, Ps, Min, Max, [(Rank, N)|OldSortedNodes], SortedNodes).
sortByAttributes([], _, _, _, OldSortedNodes, SortedNodes) :- sort(OldSortedNodes, SortedNodes).

nodeEmissions([(Prob, Src)|Srcs], NodeEmissions) :-
    nodeEmissions(Srcs, TmpNodeEmissions),
    emissions(Src, Emissions),
    NodeEmissions is TmpNodeEmissions + Prob * Emissions.
nodeEmissions([], 0).

rank(Values, Min, Max, Rank) :-
    normalizedValues(Values, Min, Max, (NormUnitCost, NormEmissions, NormFreeHWScore)),
    weight(unitCost, WeightUnitCost), weight(emission, WeightEmissions), weight(freeHW, WeightFreeHW),
    Rank is NormUnitCost * WeightUnitCost + NormEmissions * WeightEmissions + NormFreeHWScore * WeightFreeHW.

normalizedValues(Values, Min, Max, NormValues) :-
    Values = (UnitCost, NodeEmissions, FreeHW),
    Min = (MinUnitCost, MinEmissions, MinFreeHW), Max = (MaxUnitCost, MaxEmissions, MaxFreeHW),
    normalization(UnitCost, MinUnitCost, MaxUnitCost, NormUnitCost),
    normalization(NodeEmissions, MinEmissions, MaxEmissions, NormEmissions),
    normalization(FreeHW, MinFreeHW, MaxFreeHW, NormFreeHW),
    NormValues = (NormUnitCost, NormEmissions, NormFreeHW).

normalization(Value, MinValue, MaxValue, NormValue) :-
    NormValue is (Value-MinValue)/(MaxValue-MinValue).