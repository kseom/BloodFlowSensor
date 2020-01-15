function [x y B] = MagneticField(x_loc,y_loc,x_lim,y_lim,interval,N,v)
%% Description 
% Calculate the Magnetic field at 'x' and 'y' generated from a single electric charge (q) 
% moving with a velocity of 'v' located on 'x_loc' and 'y_loc'.
%% Parameter setting
% MagneticField(x_loc,y_loc,x_lim,y_lim,interval,N,v)
% examplar code: MagneticField(0.5,0.5,1,1,1e-1,1,1)
 
mu0 = 4*pi()*1e-7; % [Henry per meter]
q = 1.6e-19; % [Coulomb]

% N = 1; % Number of positive point charge consisting a group 
% v = 1; % [meter per second]
% x_lim = 1; % [meter] Limit of x-axis where we plot the magnetic field on.
% y_lim = 1; % [meter] Limit of x-axis where we plot the magnetic field on.
% interval = 1e-1;
% x_loc=0.5; % location of point charge in x-axis
% y_loc=0.5; % location of point charge in y-axis

%% M-field plane setting
X = -1*x_lim:interval:x_lim;
Y = -1*y_lim:interval:y_lim;
[x,y] = meshgrid(X,Y);

%% Calculate the M-field on a plane
B = (mu0*q*N*v)/(4*pi())*sin(atan(abs((y-y_loc)./(x-x_loc))))./((x-x_loc).^2+(y-y_loc).^2);
%surf(x,y,B)
end



%%
% %% Calculate the Magnetic field of a single electric charge moving with a velocity of v located on x_loc, y_loc.
% %% Parameter setting
% clear all
% clc
% 
% mu0 = 4*pi()*1e-7; % Henry per meter
% q = 1.6e-19; % Coulomb
% N = 1; % Number of positive point charge consisting a group 
% v = 1; % meter per second
% 
% x_lim = 1;
% y_lim = 1;
% interval = 1e-1;
% 
% x_loc=0.5;
% y_loc=0.5;
% 
% %% M-field plane setting
% X = -1*x_lim:interval:x_lim;
% Y = -1*y_lim:interval:y_lim;
% [x,y] = meshgrid(X,Y);
% 
% %% Calculate the M-field on a plane
% B = (mu0*q*N*v)/(4*pi())*sin(atan(abs((y-y_loc)./(x-x_loc))))./((x-x_loc).^2+(y-y_loc).^2);
% surf(x,y,B)
% 
