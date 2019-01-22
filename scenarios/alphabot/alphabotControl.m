%% alphabotControl.m
% *Summary:* Apply control signal onto AlphaBot
%
%   function [ nextState ] = alphabotControl(curState, u)
%
% *Input arguments:*
%   
%   curState       AlphaBot current state
%   u              Control signal
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


function [ next ] = alphabotControl(state, u)
%% Code




