%% alphaBot_learn.m
% *Summary:* Script to learn a controller for the AlphaBot control
%
% Copyright (C) 2018 by
% Brian Liao
%
% Last modified: 2018-11
%
%% High-Level Steps
% # Load parameters
% # Create J initial trajectories by applying random controls
% # Controlled learning (train dynamics model, policy learning, policy
% application)

%% Code

% 1. Initialization
clear all; 
close all;
settings_ab;                      % load scenario-specific settings
basename = 'alphaBot';           % filename used for saving data

% 2. Initial J random rollouts
for jj = 1:J
  [xx, yy, realCost{jj}, latent{jj}] = rollout(gaussian(mu0, S0), struct('maxU',policy.maxU), H, plant, cost);

  x = [x; xx];         % augment training sets for dynamics model
  y = [y; yy];       
  
  if plotting.verbosity > 0;      % visualization of trajectory
    if ~ishandle(1); 
        figure(1); 
    else
        set(0,'CurrentFigure',1);
    end; 
    clf(1);
    draw_rollout_ab;
  end
  traj{1} = xx;
end

mu0Sim(odei,:) = mu0; 
S0Sim(odei,odei) = S0;
mu0Sim = mu0Sim(dyno); 
S0Sim = S0Sim(dyno,dyno);


% 3. Controlled learning (N trials)
for j = 1:N
  
  %for i = 1:N_MPC
      % Algorithm execution
      trainDynModel;   % train (GP) dynamics model
      learnPolicy;     % learn policy
      applyController_ab; % apply controller to AlphaBot system
  %end
  
  % Plotting
  disp(['controlled trial # ' num2str(j)]);
  if plotting.verbosity > 0;      % visualization of trajectory
    if ~ishandle(1); 
        figure(1); 
    else set(0,'CurrentFigure',1); 
    end; 
    clf(1);
    draw_rollout_ab;
  end
  
  figure(5);                      % visualization of states
  plot(xx);
  legend('position', 'velocity', 'acceleration')
  traj{j+1} = xx;
end