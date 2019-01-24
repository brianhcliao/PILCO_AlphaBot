%% alphabotControl.m
% *Summary:* Apply control signal onto AlphaBot
%
%   function [ nextState ] = alphabotControl(curState, u, plant)
%
% *Input arguments:*
%   
%   curState       AlphaBot current state
%   u              Control signal
%   plant          plant structure
%    .dt             time discretization
%
% *Output arguments:*
%
%   nextState      AlphaBot next state measured from sensors
%
% Copyright (C) 2018-2019 by 
% Brian Liao
%
% Last modification: 2019-01-22
%
%% High-Level Steps
% For each time step
% # Apply control signal
% # Measure states through sensors
% # Feedback state changes


function [ next ] = alphabotControl(state, u, plant, mypi)
%% Code

% Add path to utility
addpath('./utility/');

% Integrate u into PWM duty cycle
delta_dutyCycle = u * plant.dt;
dutyCycle = state(2) + delta_dutyCycle;

% Cap duty cycle into [0, 1]
if dutyCycle > 1
    dutyCycle = 1;
elseif dutyCycle < 0
    dutyCycle = 0;
end

% Take movement
writePWMDutyCycle(mypi, 13, dutyCycle);
%java.lang.Thread.sleep(plant.dt * 1000);

% Measure states
dist = get_distance(mypi);
dist_mapped = mapfun(dist, 250, 50, 0, 2);

% Feedback next state
nextState(1) = dist_mapped;
nextState(2) = dutyCycle;






