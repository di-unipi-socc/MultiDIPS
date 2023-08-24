:-['dips.pl'].

:- set_prolog_flag(answer_write_options,[max_depth(0), spacing(next_argument)]).
:- set_prolog_flag(stack_limit, 32 000 000 000).
:- set_prolog_flag(last_call_optimisation, true).

%% OPTIMUM SOLUTION %%
optimumDips(Output) :-
    statistics(cputime, T1),
    findall(intent(StakeHolder, IntentId, NUsers, TId), intent(StakeHolder, IntentId, NUsers, TId), AllIntents),
    findall((Prop, Cap), globalIntent(Prop, smaller, Cap, _), GlobProps),
    optimalPsInfo(AllIntents, GlobProps, Output),
    statistics(cputime, T2),
    Time is T2 - T1,
    write('CPU Time: '), writeln(Time).

optimalPsInfo(AllIntents, GlobProps, BestSol) :-
    findall(PsInfo, validPsInfo(AllIntents, GlobProps, PsInfo), Sols),
    sort(1, @>=, Sols, [BestSol|_]).

validPsInfo(IntentList, GlobProps, PsInfo) :-
    StartingPInfo = info(0, 0, 0, [], [], []),
    validPsInfo(IntentList, GlobProps, StartingPInfo, PsInfo).

validPsInfo([Intent|Is], GlobProps, OldPsInfo, NewPsInfo) :-
    findall(PInfo, dips(Intent, OldPsInfo, PInfo), PInfos),
    empty(Intent, EmptyPInfo),
    AllPInfo = [EmptyPInfo|PInfos],
    member(ChoosenPInfo, AllPInfo),
    checkGlobalProperties(GlobProps, OldPsInfo, ChoosenPInfo),
    mergePlacements(OldPsInfo, ChoosenPInfo, TmpPsInfo),
    validPsInfo(Is, GlobProps, TmpPsInfo, NewPsInfo).
validPsInfo([], _, PsInfo, PsInfo).