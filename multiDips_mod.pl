:-['dips_mod.pl'].

:- set_prolog_flag(answer_write_options,[max_depth(0), spacing(next_argument)]).
:- set_prolog_flag(stack_limit, 32 000 000 000).
:- set_prolog_flag(last_call_optimisation, true).

%% HEURISTIC SOLUTION %%
multiDips(RankMode, Output) :-
    findall(intent(StakeHolder, IntentId, NUsers, TargetId), intent(StakeHolder, IntentId, NUsers, TargetId), IntentList),
    rankIntent(RankMode, IntentList, OrderedIntentList),
    StartingPInfo = info(0, 0, 0, [], [], []),
    callDips(OrderedIntentList, StartingPInfo, Output).

callDips([Intent|Is], OldPsInfo, NewPsInfo) :-
    (validPlacement(Intent, OldPsInfo, PInfo) -> true; empty(Intent, PInfo)),
    mergePlacements(OldPsInfo, PInfo, TmpPsInfo),
    callDips(Is, TmpPsInfo, NewPsInfo).
callDips([], NewPsInfo, NewPsInfo).

validPlacement(Intent, OldPsInfo, PInfo):-
    dips(Intent, OldPsInfo, PInfo).