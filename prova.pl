/*
0. clean up and extend code with triples 
    - energy model (e.g. based on RAM, CPU)
    - hw usage
    - add IntentId in IntentFulfillment?
1. think about 1-2 smart heuristics?
    - e.g. findall((AttributeNode, Node), ..., Nodes), sortByAttributes(Nodes, SortedNodes),
        ... 
2. motivating scenario: to explain the problem and the considered features, and to "tell our story"
3. extensive simulation (to be run on Unipi GreenCloud DC): that allows simulating and assessing different placement strategies in multiple realistic scenarios and averaging KPIs (e.g. exec times, profit, emissions, energy consumption, etc.)
    a. generate 20 random infrastructure with realistic data for [8, 16, 32, 64, 128, 256, 512] nodes
    b. try to place [10, 50, 100] intents onto all infras, setting a cap of 10 minutes, finding optimal vs heuristics
3'. MILP (14/06)
3''. MILP vs Prolog
3'''. Proposta TDR 
*/


/*
go(Problem, BestSol, PBest) :-
    solution(Problem, BestSol), profit(BestSol, PBest),
    \+ (solution(Problem, Sol), dif(BestSol, Sol), profit(Sol,P), P > PBest).

IDEE: 
- globali -> anche resource usage medio?
- keep intent id in the placement?
*/