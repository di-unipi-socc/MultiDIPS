:-['dips.pl'].

:- set_prolog_flag(answer_write_options,[max_depth(0), spacing(next_argument)]).
:- set_prolog_flag(stack_limit, 32 000 000 000).
:- set_prolog_flag(last_call_optimisation, true).

%% HEURISTIC SOLUTION %%
multiDips(RankMode, Output) :-
    findall(intent(StakeHolder, IntentId, NUsers, TargetId), intent(StakeHolder, IntentId, NUsers, TargetId), IntentList),
    findall((Property, Cap), globalIntent(Property, smaller, Cap, _), GlobProps),
    rankIntent(RankMode, IntentList, OrderedIntentList),
    StartingPInfo = info(0, 0, 0, [], [], []),
    callDips(OrderedIntentList, GlobProps, StartingPInfo, Output).

/*
callDips([Intent|Is], GlobProps, OldPsInfo, NewPsInfo) :-
    validPlacement(Intent, GlobProps, OldPsInfo, PInfo), 
    mergePlacements(OldPsInfo, PInfo, TmpPsInfo),
    callDips(Is, GlobProps, TmpPsInfo, NewPsInfo).
callDips([], _, NewPsInfo, NewPsInfo).

callDips([Intent|Is], GlobProps, OldPsInfo, NewPsInfo) :-
    \+ validPlacement(Intent, GlobProps, OldPsInfo, _),
    empty(Intent, PInfo), 
    mergePlacements(OldPsInfo, PInfo, TmpPsInfo),
    callDips(Is, GlobProps, TmpPsInfo, NewPsInfo).
*/

callDips([Intent|Is], GlobProps, OldPsInfo, NewPsInfo) :-
    (validPlacement(Intent, GlobProps, OldPsInfo, PInfo) -> true; empty(Intent, PInfo)),
    mergePlacements(OldPsInfo, PInfo, TmpPsInfo),
    callDips(Is, GlobProps, TmpPsInfo, NewPsInfo).
callDips([], _, NewPsInfo, NewPsInfo).

validPlacement(Intent, GlobProps, OldPsInfo, PInfo):-
    dips(Intent, OldPsInfo, PInfo),
    checkGlobalProperties(GlobProps, OldPsInfo, PInfo).