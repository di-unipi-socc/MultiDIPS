%% INTENT RANKING %%

% Rank mode choice
rankIntent(RankMode, IntentList, OrderedIntentList) :-
    RankMode = 1, longestChain(IntentList, [], OrderedIntentList).
rankIntent(RankMode, IntentList, OrderedIntentList) :-
    RankMode = 2, hungriestChain(IntentList, [], OrderedIntentList).
rankIntent(RankMode, IntentList, OrderedIntentList) :-
    RankMode = 3, randomIntents(IntentList, OrderedIntentList).

% Longest Chain first.
longestChain([Intent|Is], UnorderedIntentList, OrderedIntentList) :-
    Intent = intent(_, IntentId, _, TargetId),
    chainForIntent(IntentId, TargetId, Chain),
    length(Chain, ChainLength),
    longestChain(Is, [(ChainLength, Intent)|UnorderedIntentList], OrderedIntentList).
longestChain([], UnorderedIntentList, OrderedIntentList) :-
    sort(1, @>=,UnorderedIntentList, TmpOrderedIntentList),
    maplist(extractElement, TmpOrderedIntentList, OrderedIntentList).

% Intent with higher resources needed first
hungriestChain([Intent|Is], UnorderedIntentList, OrderedIntentList) :-
    Intent = intent(_, IntentId, NUsers, TargetId),
    chainForIntent(IntentId, TargetId, Chain),
    dimensionedChain(Chain, NUsers, DimChain),
    findReqHW(DimChain, NUsers, (Ram, CPU, Storage)),
    TotHW is Ram + CPU + (Storage/100),
    hungriestChain(Is, [(TotHW, Intent)|UnorderedIntentList], OrderedIntentList).
hungriestChain([], UnorderedIntentList, OrderedIntentList) :-
    sort(1, @>=, UnorderedIntentList, TmpOrderedIntentList),
    maplist(extractElement, TmpOrderedIntentList, OrderedIntentList).

% Random
randomIntents(IntentList, OrderedIntentList) :- random_permutation(IntentList, OrderedIntentList).


%% NODE RANKING %%

% Default rank mode
nodesRankMode(1).

rankNodes(Nodes, Ps, SortedNodes) :-
    nodesRankMode(NodesRankMode),
    \+ NodesRankMode = 5, sortByAttributes(Nodes, Ps, SortedNodes).
rankNodes(Nodes, _, SortedNodes) :-
    nodesRankMode(NodesRankMode),
    NodesRankMode = 5, random_permutation(Nodes, SortedNodes).

% Default weight
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
sortByAttributes([], _, _, _, OldSortedNodes, SortedNodes) :-
    sort(OldSortedNodes, TmpSortedNodes),
    maplist(extractElement, TmpSortedNodes, SortedNodes).

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