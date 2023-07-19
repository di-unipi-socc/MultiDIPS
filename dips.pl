:-['src/properties.pl','src/rank.pl']. 
:- ['src/infrastructureData.pl','src/intentsData.pl'].

:- set_prolog_flag(answer_write_options,[max_depth(0), spacing(next_argument)]).
:- set_prolog_flag(stack_limit, 32 000 000 000).
:- set_prolog_flag(last_call_optimisation, true).


dips(intent(_, IntentId, NUsers, TargetId), OldPsInfo, PInfo) :-
    OldPsInfo = info(_, _, _, OldPs, OldAllocBW, _),
    chainForIntent(IntentId, TargetId, Chain),
    dimensionedChain(Chain, NUsers, DimChain),      
    placedChain(DimChain, IntentId, OldPs, AllocBW, P),
    checkPlacement(IntentId, P, AllocBW, OldAllocBW, UnsatProp),
    findPInfo(IntentId, P, UnsatProp, AllocBW, PInfo).

findPInfo(IntentId, P, UnsatProp, AllocBW, PInfo) :-
    calculateHWInfo(P, HWEnergy, HWCarbon, Profit),
    calculateFootprintBW(AllocBW, BWEnergy, BWCarbon),
    Carbon is HWCarbon + BWCarbon, Energy is HWEnergy + BWEnergy,
    PInfo = info(Profit, Carbon, Energy, (IntentId, P), AllocBW, UnsatProp).


%% ASSEMBLY %%
chainForIntent(IntentId, TargetId, Chain) :-
    target(TargetId, ServiceChain), 
    layeredChain(ServiceChain, LChain),
    findall((P,F), (changingProperty(P,F), propertyExpectation(IntentId, P, _, _, _)), Properties),
    completedChain(IntentId, Properties, LChain, Chain).

layeredChain([F|Fs], [(F,A)|NewFs]) :- 
    vnf(F, A, _), layeredChain(Fs, NewFs).
layeredChain([], []).

completedChain(IntentId, [(P,F)|Ps], Chain, NewChain) :- 
    propertyExpectation(IntentId, P, Bound, From, To), vnf(F, Bound, _),
    chainModifiedByProperty(P, Bound, From, To, (F,Bound), Chain, ModChain),
    completedChain(IntentId, Ps, ModChain, NewChain).
completedChain(_, [], Chain, Chain).


%% PLACEMENT %%
dimensionedChain(Chain, NUsers, DimChain) :- 
    dimensionedChain(Chain, NUsers, [], DimChain).
dimensionedChain([(F,A)|Zs], U, OldC, NewC) :- 
    vnfXUser(F, D, (L, H), _), between(L, H, U),  dimensionedChain(Zs, U, [(F, A, D)|OldC], NewC).
dimensionedChain([], _, Chain, Chain).

placedChain(DimChain, IntentId, OldPs, AllocBW, P) :-
    findall(N, node(N,_,_), Nodes), sortByAttributes(Nodes, SortedNodes),                   
    placedChain(DimChain, IntentId, OldPs, SortedNodes, start, start, [], [], AllocBW, P).
placedChain([(F, L, D)|VNFs], IntentId, OldPs, SortedNodes, LastNode, LastBWValue, OldAllocBW, OldP, AllocBW, NewP) :-
    vnfXUser(F, D, _, HWReqs), member((_,N), SortedNodes), node(N, L, HWCaps),
    hwOK(N, HWReqs, HWCaps, [(IntentId, OldP)|OldPs]),
    findBW(IntentId, F, LastBWValue, NewBWValue),
    nodeToNodeBW(N, LastNode, LastBWValue, OldAllocBW, TmpAllocBW),
    placedChain(VNFs, IntentId, OldPs, SortedNodes, N, NewBWValue, TmpAllocBW, [on(F, D, N)|OldP], AllocBW, NewP).
placedChain([], _, _, _, _, _, AllocBW, NewP, AllocBW, NewP).

hwOK(N, HWReqs, HWCaps, OldPs) :-
    HWReqs = (RamReq, CPUReq, StorageReq),
    HWCaps = (RamCap, CPUCap, StorageCap),
    allocatedHW(OldPs, N, (AllocRam, AllocCPU, AllocStorage)),
    RamReq + AllocRam =< RamCap, CPUReq + AllocCPU =< CPUCap, StorageReq + AllocStorage =< StorageCap.

nodeToNodeBW(_, start, _, NewAllocBW, NewAllocBW).
nodeToNodeBW(N, M, BWValue, OldAllocBW, [(N, M, BWValue)|OldAllocBW]) :- dif(M, start), dif(N,M). 
nodeToNodeBW(N, N, _, NewAllocBW, NewAllocBW). 

calculateHWInfo([on(F, D, N)|T], TotHWEnergy, TotHWCarbon, TotProfit):-
    calculateHWInfo(T, TmpHWEnergy, TmpHWCarbon, TmpProfit),
    energySourceMix(N, Sources),
    calculateEnergy(on(F, D, N), HWEnergy),
    carbon(Sources, HWEnergy, HWCarbon),
    calculateProfit(on(F, D, N), HWEnergy, Profit),
    TotHWEnergy is TmpHWEnergy + HWEnergy, TotHWCarbon is TmpHWCarbon + HWCarbon, TotProfit is TmpProfit + Profit.
calculateHWInfo([], 0, 0, 0).

calculateEnergy(on(F, D, N), HWEnergy) :-
    vnfXUser(F, D, _, (Ram, CPU, Storage)),
    totHW(N, (TotRam, TotCPU, TotStorage)),
    pue(N, PUE),
    RamLInc is Ram / TotRam, ramEnergyProfile(N, RamLInc, RamE), 
    CPULInc is CPU / TotCPU, cpuEnergyProfile(N, CPULInc, CPUE),
    StorageLInc is Storage / TotStorage, storageEnergyProfile(N, StorageLInc, StorageE),
    HWEnergy is (RamE + CPUE + StorageE) * PUE.

carbon([(Prob, Src)|Srcs], HWEnergy, HWCarbon) :-
    carbon(Srcs, HWEnergy, SrcsCarbon),
    emissions(Src, MU), 
    SrcCarbon is Prob * MU * HWEnergy,
    HWCarbon is SrcCarbon + SrcsCarbon.
carbon([], _, 0).

calculateProfit(on(F, D, N), HWEnergy, Profit) :-
    vnfXUser(F, D, _, (RamReq, CPUReq, StorageReq)),
    node(N,L,_), price(L, (RamPrice, CPUPrice, StoragePrice)), energyCost(N, ECost),
    Profit is RamReq * RamPrice + CPUReq * CPUPrice + StorageReq * StoragePrice - HWEnergy * ECost.
calculateProfit([], _, 0).

calculateFootprintBW(AllocBW, BWEnergy, BWCarbon) :-
    sumBW(AllocBW, BWValue),
    kWhPerMB(V), averageGCI(GCI),
    BWEnergy is BWValue * V,
    BWCarbon is BWEnergy * GCI.

%% PROPERTIES CHECK %%
checkPlacement(IntentId, P, AllocBW, OldAllocBW, UnsatProp) :-
    checkBW(P, AllocBW, OldAllocBW),
    findall((Prop, From, To), (propertyExpectation(IntentId, Prop, _, _, _, _, From, To), dif(Prop, bandwidth)), NonChangProp),
    checkProperties(NonChangProp, IntentId, P, [], UnsatProp).
checkProperties([(Prop, From, To)|Props], IntentId, P, OldUnsatProp, NewUnsatProp) :- 
    checkProperty(IntentId, Prop, From, To, P, OldUnsatProp, TmpUnsatProp), 
    checkProperties(Props, IntentId, P, TmpUnsatProp, NewUnsatProp).
checkProperties([], _, _, UnsatProp, UnsatProp).