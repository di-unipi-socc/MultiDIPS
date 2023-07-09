:-['../reasoner.pl'].

:-dynamic deployment/4.
:-dynamic deployment2/4.
:-dynamic application/2.
:-dynamic service/6.
:-dynamic s2s/5.
:-dynamic link/4.
:-dynamic node/4.

:-set_prolog_flag(stack_limit, 128 000 000 000).
:-set_prolog_flag(last_call_optimisation, true).

cr(App, OldP, OldR, OldAlloc, NewP, NewR, NewAlloc, OldL, NewL, M, NM, CR, NCR, Infs, Time) :-
    enactAlloc(OldAlloc),
    statistics(inferences, Before1),
        statistics(cputime, T1),
            fogBrainX(App, NewP, NewR), 
        statistics(cputime, T2),
    statistics(inferences, After1), 

	Infs is After1 - Before1 - 5, 
	Time is T2 - T1,

	deployment(App, _, _, NewAlloc),
    removeAlloc(OldAlloc),

	migrations(OldP, NewP, OldL, NewL, M, NM),
	updatedRates(OldR, NewR, CR, NCR).

exhaustive(App, OldP, OldR, NewP, NewR, NewAlloc, OldL, NewL, M, NM, CR, NCR, Infs, Time) :-
	retractall(deployment2(_,_,_,_)),
	statistics(inferences, Before2),
		statistics(cputime, T1),
			fogBrainX2(App, NewP, NewR),
		statistics(cputime, T2),
	statistics(inferences, After2), 
	
	Infs is After2 - Before2 - 5, 
	Time is T2 - T1,

	deployment2(App, _, _, NewAlloc),
	migrations(OldP, NewP, OldL, NewL, M, NM),
	updatedRates(OldR, NewR, CR, NCR).

fogBrainX2(A,Placement,Rates) :-
    retractall(ranking(_)), rankNodes(RankedNodes), assert(ranking(RankedNodes)),
    reason2(A,Placement,Rates).

reason2(A,Placement,Rates) :- 
    \+ deployment2(A,_,_,_), placement(A,Placement,Rates),
    allocatedResources(Placement,Rates,Alloc),
    assert(deployment2(A,Placement,Rates,Alloc)).

removeAlloc((AllocHW, AllocBW)) :- incrementNodes(AllocHW), incrementLinks(AllocBW).

incrementNodes([(N,_)|AllocHW]) :-
	node(N,_,HW,_), HW=inf, incrementNodes(AllocHW).
incrementNodes([(N,OldHW)|AllocHW]) :-
	retract(node(N,SW,HW,T)), dif(HW, inf),
	NewHW is HW + OldHW,
	assert(node(N,SW,NewHW,T)),
	incrementNodes(AllocHW).
incrementNodes([]).

incrementLinks([((N1,N2),_)|Ls]) :-
	link(N1,N2,_,inf), incrementLinks(Ls).
incrementLinks([((N1,N2),OldBW)|Ls]) :-
	retract(link(N1,N2,Lat,BW)), dif(BW,inf),
	NewBW is BW + OldBW, assert(link(N1,N2,Lat,NewBW)),
	incrementLinks(Ls).
incrementLinks([]).

enactAlloc((AllocHW, AllocBW)) :- decrementNodes(AllocHW), decrementLinks(AllocBW).

decrementNodes([(N,_)|Ns]) :-
	node(N,_,HW,_), HW=inf, decrementNodes(Ns).
decrementNodes([(N,OldHW)|Ns]) :-
	retract(node(N,SW,HW,T)), dif(HW, inf),
	NewHW is HW - OldHW, assert(node(N,SW,NewHW,T)),
	decrementNodes(Ns).
decrementNodes([]).

decrementLinks([((N1,N2),_)|Ls]) :-
	link(N1,N2,_,inf), decrementLinks(Ls).
decrementLinks([((N1,N2),OldBW)|Ls]) :-
	retract(link(N1,N2,Lat,BW)), dif(BW,inf),
	NewBW is BW - OldBW, assert(link(N1,N2,Lat,NewBW)),
	decrementLinks(Ls).
decrementLinks([]).

migrations(OldP, NewP, OldL, NewL, M, NM) :-
	findall(1, (member(on((S,_),N),OldP), member(on((S,_),N1),NewP), dif(N,N1)), Ms), length(Ms,M),
	findall(1, (member(on((S,_),N),OldP), member(on((S,_),N),NewP)), NMs), length(NMs,NM),
	length(OldP,OldL), length(NewP,NewL).

updatedRates(OldR, NewR, CR, NCR) :-
	findall(1, (member((S1,S2,R),OldR), member((S1,S2,R1),NewR), dif(R,R1)), CRs), length(CRs,CR),
	findall(1, (member((S1,S2,R),OldR), member((S1,S2,R),NewR)), NCRs), length(NCRs,NCR).

unload_infra :- retractall(node(_,_,_,_)), retractall(link(_,_,_,_)).
unload_app :- retractall(application(_,_)), retractall(service(_,_,_,_,_,_)), retractall(s2s(_,_,_,_,_)).