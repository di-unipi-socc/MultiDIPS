:-['dips.pl'].

:- set_prolog_flag(answer_write_options,[max_depth(0), spacing(next_argument)]).
:- set_prolog_flag(stack_limit, 32 000 000 000).
:- set_prolog_flag(last_call_optimisation, true).

%% OPTIMUM SOLUTION %%
optiDips(BestSol) :-
    statistics(cputime, T1),
    findall(intent(StakeHolder, IntentId, NUsers, TId), intent(StakeHolder, IntentId, NUsers, TId), AllIntents),
    optimalPsInfo(AllIntents, BestSol),
    statistics(cputime, T2),
    Time is T2 - T1,
    write('CPU Time: '), writeln(Time).

optimalPsInfo(AllIntents, BestSol) :-
    findall(PsInfo, validPsInfo(AllIntents, PsInfo), Sols),
    sort(1, @>=, Sols, [BestSol|_]).

validPsInfo(IntentList, PsInfo) :-
    StartingPInfo = info(0, 0, 0, [], [], []),
    validPsInfo(IntentList, StartingPInfo, PsInfo).

validPsInfo([Intent|Is], OldPsInfo, NewPsInfo) :-
    findall(PInfo, dips(Intent, OldPsInfo, PInfo), PInfos),
    empty(Intent, EmptyPInfo),
    AllPInfo = [EmptyPInfo|PInfos],
    member(ChoosenPInfo, AllPInfo),
    mergePlacements(OldPsInfo, ChoosenPInfo, TmpPsInfo),
    validPsInfo(Is, TmpPsInfo, NewPsInfo).
validPsInfo([], PsInfo, PsInfo).