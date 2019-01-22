%% applyController_ab.m
% *Summary:* Script to apply the learned controller to the realworld AlphaBot system
%
% Copyright (C) 2018 by
% Brian Liao
%
% Last modified: 2018-11
%
%% High-Level Steps
% # Generate a single trajectory rollout by applying the controller
% # Generate many rollouts for testing the performance of the controller
% # Save the data

%% Code

disp("Press a button to continue");
pause;

% 1. Generate trajectory rollout given the current policy
if isfield(plant,'constraint')
    HH = maxH; 
else
    HH = H; 
end

[xx, yy, realCost{j+J}, latent{j}] = rollout(gaussian(mu0, S0), policy, HH, plant, cost);

disp(xx);                           % display states of observed trajectory

x = [x; xx]; 
y = [y; yy];                            % augment training set

if plotting.verbosity > 0
  if ~ishandle(3); 
      figure(3); 
  else
      set(0,'CurrentFigure',3); 
  end
  hold on;
  plot(1:length(realCost{J+j}),realCost{J+j},'r');
  drawnow;
end

% 3. Save data
filename = [basename num2str(j) '_H' num2str(H)]; 
save(filename);
