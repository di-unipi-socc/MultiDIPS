/* INFRASTRUCTURE PROVIDER DATA */

:- discontiguous node/3.
:- discontiguous totHW/2.
:- discontiguous pue/2.
:- discontiguous energyProfile/3.
:- discontiguous energySourceMix/2.
:- discontiguous cost/2.
:- discontiguous energyCost/2.


% Global intent
% globalIntent(Property, Bound, Value, Unit)
globalIntent(footprint, smaller, 0.800, kg).


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


% price(Type, Price (€/h for unit)).  (users pricing)
price(edge, 0.065).
price(cloud, 0.050).


% node(Id, Type, HWCaps).
    % pue(Id, Value).
    % energyProfile(Id, Load (from 0 to 1), Energy (Kw/h) ).
    % energySourceMix(Id, Sources).
    % cost(Id, Cost(€/h for unit) ).
    % energyCost(Id, Cost(€/Kwh) ).

node(gateway, edge, 10).
    totHW(gateway, 15).
    pue(gateway, 1.10).
    energyProfile(gateway, L, E) :- E is 0.020 + 0.080 * L.
    energySourceMix(gateway, [(0.3,coal), (0.3,solar), (0.4,gas)]).
    cost(gateway, 0.03).
    energyCost(gateway, 0.22).

node(edge1, edge, 15).
    totHW(edge1, 20).
    pue(edge1, 1.15).
    energyProfile(edge1, L, E) :- E is 0.040 + 0.180 * L.
    energySourceMix(edge1, [(0.2,coal), (0.2,onshorewind), (0.6,solar)]).
    cost(edge1, 0.05).
    energyCost(edge1, 0.311).

node(edge2, edge, 16).
    totHW(edge2, 19).
    pue(edge2, 1.12).
    energyProfile(edge2, L, E) :- E is 0.035 + 0.190 * L.
    energySourceMix(edge2, [(0.1,gas), (0.8,coal), (0.1,offshorewind)]).
    cost(edge2, 0).
    energyCost(edge2, 0.129).

node(edge3, edge, 14).
    totHW(edge3, 18).
    pue(edge3, 1.14).
    energyProfile(edge3, L, E) :- E is 0.040 + 0.180 * L.
    energySourceMix(edge3, [(0.4,gas), (0.4,coal), (0.2,solar)]).
    cost(edge3, 0).
    energyCost(edge3, 0.252).

node(cloud1, cloud, 161).
    totHW(cloud1, 190).
    pue(cloud1, 1.30).
    energyProfile(cloud1, L, E) :- E is 0.08 + 0.530 * L.
    energySourceMix(cloud1, [(0.5,solar), (0.1,gas), (0.4,coal)]).
    cost(cloud1, 0).
    energyCost(cloud1, 0.153).

node(cloud2, cloud, 158).
    totHW(cloud2, 200).
    pue(cloud2, 1.40).
    energyProfile(cloud2, L, E) :- E is 0.03 + 0.560 * L.
    energySourceMix(cloud2, [(0.1,solar), (0.9,coal)]).
    cost(cloud2, 0).
    energyCost(cloud2, 0.311).

/*
%nodi originali
% node(Id, Type, HWCaps).
node(gateway, edge, 10).
node(edge1, edge, 18).
node(edge2, edge, 25).
node(cloud1, cloud, 100).
node(cloud2, cloud, 150).
*/


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

% estensione
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

/*
% link originali
% link(From, To, FeatLat, FeatBw).
link(gateway, edge1, 5, 30).
link(gateway, edge2, 35, 30).
link(gateway, cloud1, 135, 30).
link(gateway, cloud2, 125, 30).
link(edge1, gateway, 5, 30).
link(edge1, edge2, 30, 70).
link(edge1, cloud1, 130, 120).
link(edge1, cloud2, 120, 120).
link(edge2, gateway, 35, 30).
link(edge2, edge1, 30, 70).
link(edge2, cloud1, 135, 80).
link(edge2, cloud2, 125, 80).
link(cloud1, gateway, 135, 30).
link(cloud1, edge1, 130, 120).
link(cloud1, edge2, 135, 80).
link(cloud1, cloud2, 10, 1000).
link(cloud2, gateway, 125, 30).
link(cloud2, edge1, 120, 120).
link(cloud2, edge2, 125, 80).
link(cloud2, cloud1, 10, 1000).
link(N, N, 0, 100000). % no latency and infinite bandwdith on self-links
*/
