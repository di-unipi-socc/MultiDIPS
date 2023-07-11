:-['../multiDips.pl'].

:-set_prolog_flag(stack_limit, 32 000 000 000).
:-set_prolog_flag(last_call_optimisation, true).

testMultiDips(Profit, Energy, Carbon, Placement, AllocBW, UnsatProps, Infs, Time) :-
    statistics(inferences, Before1),
        statistics(cputime, T1),
            multiDips(Out),
			Out = info(Profit, Energy, Carbon, Placement, AllocBW, UnsatProps), 
        statistics(cputime, T2),
    statistics(inferences, After1), 

	Infs is After1 - Before1 - 5, 
	Time is T2 - T1.