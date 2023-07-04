:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.


/* INFRASTRUCTURE PROVIDER DATA */

% Global intent
% globalIntent(Property, Bound, Value, Unit)
globalIntent(footprint, smaller, 1.570, kg).


% changingProperty(Property, VF). 
%% changing properties defined according to priority order
changingProperty(logging, logVF).
changingProperty(privacy, encVF).
changingProperty(security, authVF).
changingProperty(caching, cacheVF).
changingProperty(compression, compVF).
changingProperty(encoding, encodeVF).


% emission(Id, Value)
%% emissions in CO2 kg/kWh
emissions(gas, 0.610).
emissions(coal, 1.1).
emissions(onshorewind, 0.0097).
emissions(offshorewind, 0.0165).
emissions(solar, 0.05). 


% kWh consumed per MB
kWhPerMB(0.00008).


% Average global carbon intensity
averageGCI(0.475).


% price(Type, (RamPrice, vCPUPrice, StoragePrice) ).  (€/h for unit, users pricing)
price(edge, (0.065, 0.065, 0.065)).
price(cloud, (0.050, 0.050, 0.050)).


% node(Id, Type, (RamCap, vCPUCap, StorageCap) ).       1 unit = 4 GB RAM / 2 vCPU / 200 GB Storage	
    % pue(Id, Value).
    % energyProfile(Id, Load (from 0 to 1), Energy (Kw/h) ).
    % energySourceMix(Id, Sources).
    % cost(Id, Cost(€/h for unit) ).
    % energyCost(Id, Cost(€/Kwh) ).

node(gateway, edge, (4,3,3)).
    totHW(gateway, (6,4,4)).
    pue(gateway, 1.10).
    ramEnergyProfile(gateway, L, E) :- E is 0.004 * L.
    cpuEnergyProfile(gateway, L, E) :- E is 0.060 * L.
    storageEnergyProfile(gateway, L, E) :- E is 0.006 * L.
    energySourceMix(gateway, [(0.3,coal), (0.3,solar), (0.4,gas)]).
    energyCost(gateway, 0.22).

node(edge1, edge, (8,4,3)).
    totHW(edge1, (10,5,5)).
    pue(edge1, 1.15).
    ramEnergyProfile(edge1, L, E) :- E is 0.009 * L.
    cpuEnergyProfile(edge1, L, E) :- E is 0.090 * L.
    storageEnergyProfile(edge1, L, E) :- E is 0.008 * L.
    energySourceMix(edge1, [(0.2,coal), (0.2,onshorewind), (0.6,solar)]).
    energyCost(edge1, 0.311).

node(edge2, edge, (8,7,1)).
    totHW(edge2, (8,7,1)).
    pue(edge2, 1.12).
    ramEnergyProfile(edge2, L, E) :- E is 0.008 * L.
    cpuEnergyProfile(edge2, L, E) :- E is 0.120 * L.
    storageEnergyProfile(edge2, L, E) :- E is 0.006 * L.
    energySourceMix(edge2, [(0.1,gas), (0.8,coal), (0.1,offshorewind)]).
    energyCost(edge2, 0.129).

node(edge3, edge, (6,5,4)).
    totHW(edge3, (7,6,6)).
    pue(edge3, 1.14).
    ramEnergyProfile(edge3, L, E) :- E is 0.009 * L.
    cpuEnergyProfile(edge3, L, E) :- E is 0.115 * L.
    storageEnergyProfile(edge3, L, E) :- E is 0.006 * L.
    energySourceMix(edge3, [(0.4,gas), (0.4,coal), (0.2,solar)]).
    energyCost(edge3, 0.252).

node(cloud1, cloud, (96,48,45)).
    totHW(cloud1, (100,50,50)).
    pue(cloud1, 1.25).
    ramEnergyProfile(cloud1, L, E) :- E is 0.130 * L.
    cpuEnergyProfile(cloud1, L, E) :- E is 0.410 * L.
    storageEnergyProfile(cloud1, L, E) :- E is 0.100 * L.
    energySourceMix(cloud1, [(0.5,solar), (0.1,gas), (0.4,coal)]).
    energyCost(cloud1, 0.153).

node(cloud2, cloud, (94,44,42)).
    totHW(cloud2, (100,50,50)).
    pue(cloud2, 1.40).
    ramEnergyProfile(cloud2, L, E) :- E is 0.130 * L.
    cpuEnergyProfile(cloud2, L, E) :- E is 0.410 * L.
    storageEnergyProfile(cloud2, L, E) :- E is 0.100 * L.
    energySourceMix(cloud2, [(0.1,solar), (0.9,coal)]).
    energyCost(cloud2, 0.311).


% link(From, To, FeatLat, FeatBw).
link(gateway, edge1, 5, 80).
link(gateway, edge2, 35, 80).
link(gateway, cloud1, 135, 80).
link(gateway, cloud2, 125, 80).
link(edge1, gateway, 5, 80).
link(edge1, edge2, 30, 120).
link(edge1, cloud1, 130, 180).
link(edge1, cloud2, 120, 180).
link(edge2, gateway, 35, 80).
link(edge2, edge1, 30, 120).
link(edge2, cloud1, 135, 140).
link(edge2, cloud2, 125, 140).
link(cloud1, gateway, 135, 80).
link(cloud1, edge1, 130, 180).
link(cloud1, edge2, 135, 140).
link(cloud1, cloud2, 10, 1000).
link(cloud2, gateway, 125, 80).
link(cloud2, edge1, 120, 180).
link(cloud2, edge2, 125, 140).
link(cloud2, cloud1, 10, 1000).
link(N, N, 0, 100000). % no latency and infinite bandwdith on self-links

% extension
link(gateway, edge3, 25, 60).
link(edge1, edge3, 30, 130).
link(edge2, edge3, 20, 120).
link(edge3, gateway, 25, 60).
link(edge3, edge1, 30, 130).
link(edge3, edge2, 20, 120).
link(edge3, cloud1, 100, 160).
link(edge3, cloud2, 120, 130).
link(cloud1, edge3, 100, 160).
link(cloud2, edge3, 120, 130).
