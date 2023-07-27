:- ['../dips.pl'].
:- ['../src/infrastructureData.pl','../src/intentsData.pl'].

:- set_prolog_flag(answer_write_options,[max_depth(0), spacing(next_argument)]).
:- set_prolog_flag(stack_limit, 32 000 000 000).
:- set_prolog_flag(last_call_optimisation, true).

% Milp pre calculations
milp(Nodes, Res_j, Layer_j, Power_j, Pue_j, ECost_j, Vnfs, OnlyVnfs, ReqHW_i, Layer_i, Lat_i, BWReq, MaxLat, LinkBW_jk, LinkLat_jk, MaxEmissions, Carbon_ij, Profit_ij) :-
    % nodes infos
    findall((N, L, HWRes), node(N, L, HWRes), NodesInfos),
    nodesInfo(NodesInfos, Nodes, Layer_j, Res_j, Power_j, Pue_j, ECost_j),
    % vnfs infos
    findall(intent(StakeHolder, IntentId, NUsers, TargetId), intent(StakeHolder, IntentId, NUsers, TargetId), IntentList),
    vnfsInfos(IntentList, Vnfs, Dim_i, ReqHW_i, Layer_i, Lat_i, BWReq, MaxLat),
    onlyVnfs(Vnfs, OnlyVnfs),
    % link infos
    linkInfo(Nodes, Nodes, LinkBW_jk, LinkLat_jk),
    % Max emissions
    globalIntent(footprint, smaller, MaxEmissions, kg),
    % ij infos
    ijInfos(OnlyVnfs, Dim_i, Nodes, Carbon_ij, Profit_ij).



nodesInfo([Node|T], Nodes, Layer_j, Res_j, Power_j, Pue_j, ECost_j) :-
    nodesInfo(T, TmpNodes, TmpLayer_j, TmpRes_j, TmpPower_j, TmpPue_j, TmpEcost_j),
    % Nodes, Layer_j, Res_j
    Node = (N, L, HWRes),
    Nodes = [N|TmpNodes],
    Layer_j = [L|TmpLayer_j],
    Res_j = [HWRes|TmpRes_j],
    % Power_j
    ramEnergyProfile(N, 1, RamE),
    cpuEnergyProfile(N, 1, CpuE),
    storageEnergyProfile(N, 1, StorE),
    Power_j = [(RamE, CpuE, StorE)|TmpPower_j],
    % Pue_J
    pue(N, Pue),
    Pue_j = [Pue|TmpPue_j],
    % ECost_j
    energyCost(N, ECost),
    ECost_j = [ECost|TmpEcost_j].
nodesInfo([], [], [], [], [], [], []).


vnfsInfos([Intent|T], Vnfs, Dim_i, ReqHW_i, Layer_i, Lat_i, BWReq, MaxLat) :-
    Intent = intent(_, IntentId, NUsers, TargetId),
    vnfsInfos(T, TmpVnfs, TmpDim_i, TmpReqHW_i, TmpLayer_i, TmpLat_i, TmpBWReq, TmpMaxLat),
    chainForIntent(IntentId, TargetId, Chain),
    dimensionedChain(Chain, NUsers, ReverseDimChain),
    reverse(ReverseDimChain, DimChain),
    % VNFs infos
    chainInfos(DimChain, ChainVnfs, ChainDim, ChainReq, ChainLayer, ChainAcc),
    append([(IntentId,ChainVnfs)], TmpVnfs, Vnfs),
    append(ChainDim, TmpDim_i, Dim_i),
    append(ChainReq, TmpReqHW_i, ReqHW_i),
    append(ChainLayer, TmpLayer_i, Layer_i),
    append(ChainAcc, TmpLat_i, Lat_i),
    % BW and LAT infos
    propertyInfos(DimChain, IntentId, ChainBWReq, ChainMaxLat),
    append([(IntentId,ChainBWReq)], TmpBWReq, BWReq),
    append([(IntentId,ChainMaxLat)], TmpMaxLat, MaxLat).
vnfsInfos([], [], [], [], [], [], [], []).


chainInfos([(F, L, D)|Tail], ChainVnfs, ChainDim, ChainReq, ChainLayer, ChainAcc) :-
    chainInfos(Tail, TmpChainVnfs, TmpChainDim, TmpChainReq, TmpChainLayer, TmpChainAcc),
    vnfXUser(F, D, _, HWReqs),
    vnf(F, L, T),
    ChainVnfs = [F|TmpChainVnfs],
    ChainDim = [D|TmpChainDim],
    ChainReq = [HWReqs|TmpChainReq],
    ChainLayer = [L|TmpChainLayer],
    ChainAcc = [T|TmpChainAcc].
chainInfos([], [], [], [], [], []).


propertyInfos([(F1, _, _),(F2, _, _)|Tail], IntentId, BWReq, MaxLat) :-
    propertyInfos([(F2, _, _)|Tail], IntentId, TmpBWReq, TmpMaxLat),
    lastPropValue(TmpBWReq, LastBwValue),
    findProp(IntentId, bandwidth, LastBwValue, F2, BW),
    lastPropValue(TmpMaxLat, LastLatValue),
    findProp(IntentId, latency, LastLatValue, F2, Lat),
    BWReq = [(F1,F2,BW)|TmpBWReq],
    MaxLat = [(F1,F2,Lat)|TmpMaxLat].
propertyInfos([_], _, [], []).

findProp(IntentId, Prop, end, F2, Value) :-
    \+ propertyExpectation(IntentId, Prop, _, hard, _, _, _, F2),
    \+ propertyExpectation(IntentId, Prop, _, hard, _, _, _, end),
    propValue(Prop, Value).
findProp(IntentId, Prop, end, F2, Value) :-
    propertyExpectation(IntentId, Prop, _, hard, Value, _, S, end), dif(S,F2).
findProp(IntentId, Prop, _, F2, Value) :-
    propertyExpectation(IntentId, Prop, _, hard, Value, _, _, F2).
findProp(IntentId, Prop, LastValue, F2, LastValue) :-
    dif(LastValue, end),
    \+ propertyExpectation(IntentId, Prop, _, hard, _, _, _, F2),
    \+ propertyExpectation(IntentId, Prop, _, hard, _, _, F2, _).       
findProp(IntentId, Prop, _, F2, Value) :-
    \+ propertyExpectation(IntentId, Prop, _, hard, _, _, _, F2),
    propertyExpectation(IntentId, Prop, _, hard, _, _, F2, _),
    propValue(Prop, Value).

propValue(bandwidth, 0).
propValue(latency, 10000).
lastPropValue([(_,_,Value)|_], Value).
lastPropValue([], end).


linkInfo([N|T], Nodes, LinkBW_jk, LinkLat_jk) :-
    linkInfo(T, Nodes, TmpLinkBW_jk, TmpLinkLat_jk),
    nodeToNodes(Nodes, N, LinkBW_j, LinkLat_j),
    LinkBW_jk = [LinkBW_j|TmpLinkBW_jk],
    LinkLat_jk = [LinkLat_j|TmpLinkLat_jk].
linkInfo([], _, [], []).

nodeToNodes([M|T], N, LinkBW_j, LinkLat_j) :-
    nodeToNodes(T, N, TmpLinkBW_j, TmpLinkLat_j),
    link(N,M,Lat,BW),
    LinkBW_j = [BW|TmpLinkBW_j],
    LinkLat_j = [Lat|TmpLinkLat_j].
nodeToNodes([], _, [], []).


onlyVnfs([(_,Vnfs)|T], OnlyVnfs) :-
    onlyVnfs(T, TmpOnlyVnfs),
    append(Vnfs, TmpOnlyVnfs, OnlyVnfs).
onlyVnfs([], []).


ijInfos([Vnf|T1], [D|T2], Nodes, Carbon_ij, Profit_ij) :-
    ijInfos(T1, T2, Nodes, TmpCarbon_ij, TmpProfit_ij),
    jinfos(Nodes, Vnf, D, Carbon_j, Profit_j),
    Carbon_ij = [Carbon_j|TmpCarbon_ij],
    Profit_ij = [Profit_j|TmpProfit_ij].
ijInfos([], [], _, [], []).

jinfos([N|T], Vnf, D, Carbon_j, Profit_j) :-
    jinfos(T, Vnf, D, TmpCarbon_j, TmpProfit_j),
    calculateEnergy(on(Vnf,D,N), Energy),
    energySourceMix(N, EnergySourceMix),
    calculateHWCarbon(EnergySourceMix, Energy, Carbon),
    Carbon_j = [Carbon|TmpCarbon_j],
    calculateProfit(on(Vnf,D,N), Energy, Profit),
    Profit_j = [Profit|TmpProfit_j].
jinfos([], _, _, [], []).