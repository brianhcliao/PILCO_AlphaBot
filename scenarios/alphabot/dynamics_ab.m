%% dynamics_ab.m
% *Summary:* Implements ths ODE for simulating the AlphaBot dynamics.
%
%    function dz = dynamics_ab(t, z, f)
%
%
% *Input arguments:*
%
%   t     current time step (called from ODE solver)
%   z     state                                                    [4 x 1]
%   f     (optional): force f(t)
%
% *Output arguments:*
%
%   dz    state derivative wrt time
%
% Copyright (C) 2018 by
% Brian Liao
%
% Last modified: 2018-11

function dz = dynamics_ab(t,z,f)
%% Code

l = 0;  % [m]     half length of AlphaBot
m = 0.5;  % [kg]     mass of AlphaBot
b = 0.1;  % [N/m/s]  coefficient of friction between cart and ground
g = 9.82; % [m/s^2]  acceleration of gravity

dz = zeros(2,1);
dz(1) = z(2);
dz(2) = (f(t)-b*m*g)/m;
