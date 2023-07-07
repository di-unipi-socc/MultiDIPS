:-['dips.pl'].

%% OPTIMUM SOLUTION %%
optimumDips(Output) :-
    findall(intent(StakeHolder, IntentId, NUsers, TId), intent(StakeHolder, IntentId, NUsers, TId), AllIntents),
    findall((Prop, Cap), globalIntent(Prop, smaller, Cap, _), GlobProps),
    optimalPsInfo(AllIntents, GlobProps, Output). 

optimalPsInfo(AllIntents, GlobProps, BestSol) :-
    findall(PsInfo, validPsInfo(AllIntents, GlobProps, PsInfo), Sols),
    sort(1, @>=, Sols, [BestSol|_]).

validPsInfo(IntentList, GlobProps, PsInfo) :-
    StartingPInfo = info(0, 0, 0, [], [], []),
    validPsInfo(IntentList, GlobProps, StartingPInfo, PsInfo).

validPsInfo([Intent|Is], GlobProps, OldPsInfo, NewPsInfo) :-
    findall(PInfo, dips(Intent, OldPsInfo, PInfo), PInfos),
    empty(Intent, EmptyPInfo), AllPInfo = [EmptyPInfo|PInfos],
    member(ChoosenPInfo, AllPInfo),
    checkGlobalProperties(GlobProps, OldPsInfo, ChoosenPInfo),
    mergePlacements(OldPsInfo, ChoosenPInfo, TmpPsInfo),
    validPsInfo(Is, GlobProps, TmpPsInfo, NewPsInfo).
validPsInfo([], _, PsInfo, PsInfo) :- writeln(PsInfo).