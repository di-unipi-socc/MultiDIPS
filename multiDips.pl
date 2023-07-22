:-['dips.pl'].

%% HEURISTIC SOLUTION %%
multiDips(Output) :-
    statistics(cputime, T1),
    findall(intent(StakeHolder, IntentId, NUsers, TargetId), intent(StakeHolder, IntentId, NUsers, TargetId), IntentList),
    findall((Property, Cap), globalIntent(Property, smaller, Cap, _), GlobProps),
    rankIntent3(IntentList, [], OrderedIntentList),
    StartingPInfo = info(0, 0, 0, [], [], []),
    callDips(OrderedIntentList, GlobProps, StartingPInfo, Output),
    statistics(cputime, T2),
    Time is T2 - T1,
    write('CPU Time: '), writeln(Time).

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

validPlacement(Intent, GlobProps, OldPsInfo, PInfo):-
    dips(Intent, OldPsInfo, PInfo),     
    checkGlobalProperties(GlobProps, OldPsInfo, PInfo).