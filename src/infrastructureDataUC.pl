:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous ramEnergyProfile/3.
:- discontiguous cpuEnergyProfile/3.
:- discontiguous storageEnergyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous energyCost/2.

/* INFRASTRUCTURE DATA */

% Global intent
% globalIntent(Property, Operator, Value, Unit)
globalIntent(footprint, smaller, 0.300, kg).

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
price(edge, (0.030, 0.060, 0.00050)).
price(cloud, (0.015, 0.030, 0.00025)).


% node(Id, Type, (RamCap [GB], vCPUCap, StorageCap [GB]) ). 
    % totHW(Id, totHW)     	
    % pue(Id, Value).
    % ramEnergyProfile(Id, Load (from 0 to 1), Energy (Kw/h) ).
    % cpuEnergyProfile(Id, Load (from 0 to 1), Energy (Kw/h) ).
    % storageEnergyProfile(Id, Load (from 0 to 1), Energy (Kw/h) ).
    % energySourceMix(Id, Sources).
    % energyCost(Id, Cost(€/Kwh) ).

node(edge1, edge, (16,7,900)).
    totHW(edge1, (32,12,2000)).
    pue(edge1, 1.15).
    ramEnergyProfile(edge1, L, E) :- E is 0.015 * L.
    cpuEnergyProfile(edge1, L, E) :- E is 0.112 * L.
    storageEnergyProfile(edge1, L, E) :- E is 0.015 * L.
    energySourceMix(edge1, [(0.1,coal), (0.3,onshorewind), (0.6,solar)]).
    energyCost(edge1, 0.383).

node(edge2, edge, (18,5,800)).
    totHW(edge2, (32,8,1000)).
    pue(edge2, 1.12).
    ramEnergyProfile(edge2, L, E) :- E is 0.023 * L.
    cpuEnergyProfile(edge2, L, E) :- E is 0.150 * L.
    storageEnergyProfile(edge2, L, E) :- E is 0.007 * L.
    energySourceMix(edge2, [(0.1,gas), (0.8,coal), (0.1,offshorewind)]).
    energyCost(edge2, 0.116).

node(cloud1, cloud, (114,29,8400)).
    totHW(cloud1, (256,48,12000)).
    pue(cloud1, 1.25).
    ramEnergyProfile(cloud1, L, E) :- E is 0.130 * L.
    cpuEnergyProfile(cloud1, L, E) :- E is 0.410 * L.
    storageEnergyProfile(cloud1, L, E) :- E is 0.100 * L.
    energySourceMix(cloud1, [(0.5,solar), (0.2,gas), (0.3,coal)]).
    energyCost(cloud1, 0.452).

node(cloud2, cloud, (108,31,9500)).
    totHW(cloud2, (256,48,12000)).
    pue(cloud2, 1.40).
    ramEnergyProfile(cloud2, L, E) :- E is 0.130 * L.
    cpuEnergyProfile(cloud2, L, E) :- E is 0.410 * L.
    storageEnergyProfile(cloud2, L, E) :- E is 0.100 * L.
    energySourceMix(cloud2, [(0.1,solar), (0.9,coal)]).
    energyCost(cloud2, 0.299).


% link(From, To, FeatLat, FeatBw).

link(edge1, edge2, 30, 150).
link(edge1, cloud1, 70, 200).
link(edge1, cloud2, 120, 250).
link(edge2, edge1, 30, 150).
link(edge2, cloud1, 135, 200).
link(edge2, cloud2, 125, 210).
link(cloud1, edge1, 70, 200).
link(cloud1, edge2, 135, 200).
link(cloud1, cloud2, 10, 1000).
link(cloud2, edge1, 120, 250).
link(cloud2, edge2, 125, 210).
link(cloud2, cloud1, 10, 1000).
link(N, N, 0, 100000).          