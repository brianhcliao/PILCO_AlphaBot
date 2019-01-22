%% draw_cp.m
% *Summary:* Draw the AlphaBot with reward, applied force, and 
% predictive uncertainty of the tip of Alphabot
%
%    function draw_ab(x, theta, force, cost, text1, text2, M, S)
%
%
% *Input arguments:*
%
%		x          position of the cart
%   theta      angle of pendulum
%   force      force applied to cart
%   cost       cost structure
%     .fcn     function handle (it is assumed to use saturating cost)
%     .<>      other fields that are passed to cost
%   M          (optional) mean of state
%   S          (optional) covariance of state
%   text1      (optional) text field 1
%   text2      (optional) text field 2
%
%
% Copyright (C) 2008-2013 by
% Marc Deisenroth, Andrew McHutchon, Joe Hall, and Carl Edward Rasmussen.
%
% Last modified: 2013-03-07

function draw_ab(x, force, cost, text1, text2, M, S)
%% Code

xmin = -6; 
xmax = 6;
xtarget = 5;
height = 0.2;
width  = 0.3;
maxU = 4;

% Compute positions 
car = [ x + width,  height
        x + width, -height
        x - width, -height
        x - width,  height
        x + width,  height ];

clf; hold on

% Plot objects
plot(xtarget,0,'r*','MarkerSize',15,'linewidth',2)
plot(0,0,'g*','MarkerSize',15,'linewidth',2)
plot([xmin, xmax], [-height-0.1, -height-0.1],'k','linewidth',2)

% Plot the car
fill(car(:,1), car(:,2),'k','edgecolor','k');

% Plot force
plot([0 force/maxU*xmax],[-0.5, -0.5],'g','linewidth',10)

% Plot reward
reward = 1-cost.fcn(cost,[x, 0]', zeros(2));
plot([0 reward*xmax],[-0.8, -0.8],'y','linewidth',10)

% Text
text(0,-0.5,'applied force')
text(0,-0.8,'immediate reward')
if exist('text1','var')
  text(0,-1.1, text1)
end
if exist('text2','var')
  text(0,-1.4, text2)
end

set(gca,'DataAspectRatio',[1 1 1],'XLim',[xmin xmax],'YLim',[-1.6 1.4]);
axis off;
drawnow;