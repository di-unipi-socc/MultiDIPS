:-['../multiDips.pl'].

:-set_prolog_flag(stack_limit, 32 000 000 000).
:-set_prolog_flag(last_call_optimisation, true).

testMultiDips(RankMode, HeuristicWeight, Profit, Carbon, Energy, Placement, AllocBW, UnsatProps, Infs, Time) :-
    setNodeHeuristicWeight(HeuristicWeight),
    statistics(inferences, Before1),
        statistics(cputime, T1),
            multiDips(RankMode, Out),
			Out = info(Profit, Carbon, Energy, Placement, AllocBW, UnsatProps), 
        statistics(cputime, T2),
    statistics(inferences, After1), 
	Infs is After1 - Before1 - 5, 
	Time is T2 - T1.

setNodeHeuristicWeight(Weight) :-
    Weight = (WeightUnitCost, WeightEmissions, WeightFreeHW),
    abolish(weight/2),
    assertz(weight(unitCost, WeightUnitCost)),
    assertz(weight(emission, WeightEmissions)),
    assertz(weight(freeHW, WeightFreeHW)).
    