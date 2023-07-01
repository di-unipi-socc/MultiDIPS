:-['src/data.pl', 'src/dataInfrProv.pl','src/properties.pl'].

:- set_prolog_flag(answer_write_options,[max_depth(0), spacing(next_argument)]).
:- set_prolog_flag(stack_limit, 32 000 000 000).
:- set_prolog_flag(last_call_optimisation, true).

/*
go(Problem, BestSol, PBest) :-
    solution(Problem, BestSol), profit(BestSol, PBest),
    \+ (solution(Problem, Sol), dif(BestSol, Sol), profit(Sol,P), P > PBest).

IDEE: 
- globali -> anche resource usage medio?
- keep intent id in the placement?
*/

optimumDips(Output) :-
    findall(intent(SH, IID, N, TId), intent(SH, IID, N, TId), AllIntents),
    findall((P, Cap), globalIntent(P, smaller, Cap, _), GlobProps),
    optimalPlacementsInfo(AllIntents, GlobProps, Output). 

optimalPlacementsInfo(AllIntents, GlobProps, BestSol) :-
    findall(PsInfo, validPsInfo(AllIntents, GlobProps, PsInfo), Sols),
    sort(2, @>=, Sols, [BestSol|_]).

validPsInfo(IntentList, GlobProps, PsInfo) :-
    StartingPInfo = info(0, 0, 0, [], [], []),
    validPsInfo(IntentList, GlobProps, StartingPInfo, PsInfo).

validPsInfo([intent(StakeHolder, IID, NUsers, _)|Is], GlobProps, OldPsInfo, NewPsInfo) :-
    OldPsInfo = info(_, _, _, OldPs, OldAllocBW, _),
    dips(StakeHolder, IID, NUsers, OldPs, OldAllocBW, PInfo),  
    checkGlobalProperties(OldPsInfo, PInfo, GlobProps),
    mergePlacements(OldPsInfo, PInfo, TmpPsInfo),
    validPsInfo(Is, GlobProps, TmpPsInfo, NewPsInfo).
validPsInfo([], _, _, _, PsInfo, PsInfo).

mergePlacements(OldInfo, Info, NewInfo) :-
    OldInfo = info(OldPR, OldC, OldE, OldPs, OldAllocBW, OldU), Info = info(PR, C, E, P, AllocBW, U),
    NewPR is OldPR + PR, NewC is OldC + C, NewE is OldE + E,
    NewInfo = info(NewPR, NewC, NewE, [P|OldPs], [AllocBW|OldAllocBW], [U|OldU]).


multiDips(Output) :-
    findall(intent(StakeHolder, IntentID, NUsers, TargetId), intent(StakeHolder, IntentID, NUsers, TargetId), IntentList),
    findall((Property, Cap), globalIntent(Property, smaller, Cap, _), GlobProps),
    rankIntent3(IntentList, [], OrderedIntentList),
    StartingPInfo = info(0, 0, 0, [], [], []),
    callDips(OrderedIntentList, GlobProps, StartingPInfo, Output), !.

callDips([intent(StakeHolder, IID, NUsers, _)|Is], GlobProps, OldPsInfo, NewPsInfo) :-
    OldPsInfo = info(OldPR, OldC, OldE, OldPs, OldAllocBW, OldU),
    dips(StakeHolder, IID, NUsers, OldPs, OldAllocBW, PInfo),       
    checkGlobalProperties(OldPsInfo, PInfo, GlobProps),             % gestire fallimento
    mergePlacements(OldPsInfo, PInfo, TmpPsInfo),
    callDips(Is, GlobProps, TmpPsInfo, NewPsInfo).
callDips([], _, NewPsInfo, NewPsInfo).
    

dips(StakeHolder, IID, NUsers, OldPs, OldAllocBW, PInfo) :-
    chainForIntent(StakeHolder, IntentID, Chain),
    dimensionedChain(Chain, NUsers, DimChain),
    findall((Prop, From, To), propertyExpectation(IntentID, Prop, _, _, _, _, From, To), NonChangProp),      
    placedChain(DimChain, IID, OldPs, AllocBW, P),
    checkPlacement(IID, NonChangProp, P, OldAllocBW, UnsatProp),
    findPInfo(P, OldPs, UnsatProp, AllocBW, PInfo).

findPInfo(P, OldPs, UnsatProp, AllocBW, PInfo) :-
    calculateFootprintHW(P, OldPs, HWEnergy, HWCarbon),
    calculateFootprintBW(AllocBW, BWEnergy, BWCarbon),
    Carbon is HWCarbon + BWCarbon, Energy is HWEnergy + BWEnergy,
    calculateProfit(P, BWEnergy, HWEnergy, Profit),
    PInfo is (Profit, Carbon, Energy, P, AllocBW, UnsatProp).

%% ASSEMBLY %%

chainForIntent(StakeHolder, IntentID, Chain) :-
    intent(StakeHolder, IntentID, _, TargetId), 
    target(TargetId, ServiceChain), 
    layeredChain(ServiceChain, LChain),
    findall((P,F), (changingProperty(P,F), propertyExpectation(IntentID, P, _, _, _)), Properties),
    completedChain(IntentID, Properties, LChain, Chain).


layeredChain([F|Fs], [(F,A)|NewFs]) :- 
    vnf(F, A, _), layeredChain(Fs, NewFs).
layeredChain([], []).


completedChain(IntentID, [(P,F)|Ps], Chain, NewChain) :- 
    propertyExpectation(IntentID, P, Bound, From, To), vnf(F, Bound, _),
    chainModifiedByProperty(P, Bound, From, To, (F,Bound), Chain, ModChain),
    completedChain(IntentID, Ps, ModChain, NewChain).
completedChain(_, [], Chain, Chain).


%% PLACEMENT %%

dimensionedChain(Chain, NUsers, DimChain) :- 
    dimensionedChain(Chain, NUsers, [], DimChain).
dimensionedChain([(F,A)|Zs], U, OldC, NewC) :- 
    vnfXUser(F, D, (L, H), _), between(L, H, U),  dimensionedChain(Zs, U, [(F, A, D)|OldC], NewC).
dimensionedChain([], _, Chain, Chain).


placedChain(DimChain, IID, OldPs, AllocBW, P) :-                   
    placedChain(DimChain, IID, _, _, OldPs, [], [], AllocBW, P).
placedChain([(F, L, D)|VNFs], IID, LastNode, LastBWValue, OldPs, OldAllocBW, OldP, AllocBW, NewP) :-
    vnfXUser(F, D, _, HWReqs), node(N, L, HWCaps),  
    hwOK(N, HWReqs, HWCaps, [OldP|OldPs]),
    findBW(IID, F, LastBWValue, NewBWValue),
    calculateAllocatedBW(N, LastNode, LastBWValue, OldAllocBW, TmpAllocBW),
    placedChain(VNFs, IID, N, NewBWValue, IID, OldPs, [on(F, D, N)|OldP], TmpAllocBW, NewP).
placedChain([], _, _, _, AllocBW, NewP, AllocBW, NewP).


hwOK(N, HWReqs, HWCaps, OldPlacements) :-
    HWReqs is (RamReq, CPUReq, StorageReq)
    HWCaps is (RamCap, CPUCap, StorageCap),
    allocatedHW(OldPlacements, N, (AllocRam, AllocCPU, AllocStorage)),
    RamReq + AllocRam =< RamCap,
    CPUReq + AllocCPU =< CPUCap,
    StorageReq + AllocStorage =< StorageCap.


calculateAllocatedBW(_, M, _, NewAllocBW, NewAllocBW) :- var(M).
calculateAllocatedBW(N, M, BWValue, TmpAllocBW, [(N, M, BWValue)|TmpAllocBW]) :- dif(N,M), nonvar(M). 
calculateAllocatedBW(N, N, _, T, T) :- nonvar(N). 


calculateFootprintHW([on(F, D, N)|T], OldPs, TotHWEnergy, TotHWCarbon):-
    calculateFootprintHW(T, OldPs, TmpHWEnergy, TmpHWCarbon),
    vnfXUser(VNF, D, _, (Ram, CPU, Storage))
    totHW(N, (TotRam, TotCPU, TotStorage)),
    pue(N, PUE), energySourceMix(N, Sources),
    RamLInc is Ram / TotRam, ramEnergyProfile(N, RamLInc, RamE), 
    CPULInc is CPU / TotCPU, cpuEnergyProfile(N, CPULInc, CPUE),
    StorageLInc is Storage / TotStorage, storageEnergyProfile(N, StorageLInc, StorageE),
    HWEnergy is RamE + CPUE + StorageE,
    carbon(Sources, HWEnergy, HWCarbon),
    TotHWEnergy is TmpHWEnergy + HWEnergy,
    TotHWCarbon is TmpHWCarbon + HWCarbon. 


carbon([(Prob, Src)|Srcs], HWEnergy, HWCarbon) :-
    carbon(Srcs, HWEnergy, SrcsCarbon)
    emissions(Src, MU), 
    SrcCarbon is Prob * MU * HWEnergy,
    HWCarbon is SrcCarbon + SrcsCarbon.
carbon([], _, 0).


calculateFootprintBW(AllocBW, BWEnergy, BWCarbon) :-
    sumBW(AllocBW, BWValue),
    kWhPerMB(V), averageGCI(GCI),
    BWEnergy is BWValue * V,
    BWCarbon is BWEnergy * GCI.


calculateProfit([on(F, D, N)|T], BWEnergy, HWEnergy, Profit) :-
    calculateProfit(T, BWEnergy, HWEnergy, TmpProfit),
    vnfXUser(F, D, _, (RamReq, CPUReq, StorageReq)),
    node(N,L,_), price(L, (RamPrice, CPUPrice, StoragePrice)), cost(N, Cost), energyCost(N, ECost),
    Profit is TmpoProfit + RamReq * RamPrice + CPUReq * CPUPrice + StorageReq * StoragePrice - (HWEnergy + BWEnergy) * ECost.


checkPlacement(IntentID, NonChangProp, Placement, OldAllocatedBW, UnsatProp) :-
    checkPlacement(IntentID, NonChangProp, Placement, OldAllocatedBW, [], UnsatProp).
checkPlacement(IntentID, [(P, From, To)|Ps], Placement, OldAllocatedBW, OldUnsatProp, NewUnsatProp) :- 
    checkProperty(IntentID, P, From, To, Placement, OldAllocatedBW, OldUnsatProp, TmpUnsatProp), 
    checkPlacement(IntentID, Ps, Placement, OldAllocatedBW, TmpUnsatProp, NewUnsatProp).
checkPlacement(_, [], _, _, UnsatProp, UnsatProp).