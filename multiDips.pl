:-['dips.pl'].

:- set_prolog_flag(answer_write_options,[max_depth(0), spacing(next_argument)]).
:- set_prolog_flag(stack_limit, 32 000 000 000).
:- set_prolog_flag(last_call_optimisation, true).

%% HEURISTIC SOLUTION %%
multiDips(RankMode, Solution) :-
    findall(intent(StakeHolder, IntentId, NUsers, TargetId), intent(StakeHolder, IntentId, NUsers, TargetId), IntentsList),
    rankIntents(RankMode, IntentsList, OrderedIntentsList),
    StartingPInfo = info(0, 0, 0, [], [], []),
    callDips(OrderedIntentsList, StartingPInfo, Solution).

callDips([Intent|Is], OldPsInfo, NewPsInfo) :-
    (dips(Intent, OldPsInfo, PInfo) -> true; empty(Intent, PInfo)),
    mergePlacements(OldPsInfo, PInfo, TmpPsInfo),
    callDips(Is, TmpPsInfo, NewPsInfo).
callDips([], NewPsInfo, NewPsInfo).