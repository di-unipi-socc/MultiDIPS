:-['../multiDips_mod.pl'].

:-set_prolog_flag(stack_limit, 32 000 000 000).
:-set_prolog_flag(last_call_optimisation, true).

testMultiDips(IntentsRankMode, NodesRankMode, Weight, Profit, Carbon, Energy, Placement, UnsatProps, Infs, Time) :-
    setNodeRankMode(NodesRankMode, Weight),
    statistics(inferences, Before1),
        statistics(cputime, T1),
            multiDips(IntentsRankMode, Out),
			Out = info(Profit, Carbon, Energy, Placement, _, UnsatProps), !,
        statistics(cputime, T2),
    statistics(inferences, After1), 
	Infs is After1 - Before1 - 5, 
	Time is T2 - T1.


setNodeRankMode(NodesRankMode, _) :-
    NodesRankMode = 5,      % Random
    abolish(nodesRankMode/1), 
    assertz(nodesRankMode(NodesRankMode)).

setNodeRankMode(NodesRankMode, Weight) :-
    \+ NodesRankMode = 5,        % Not random
    Weight = (WeightUnitCost, WeightEmissions, WeightFreeHW),
    abolish(nodesRankMode/1), 
    abolish(weight/2),
    assertz(weight(unitCost, WeightUnitCost)),
    assertz(weight(emission, WeightEmissions)),
    assertz(weight(freeHW, WeightFreeHW)),
    assertz(nodesRankMode(NodesRankMode)).
    