%% Velocity_Measurement_Integrated1

clear all
clc

N_p = 30; % number of particle
d_int = 1e-4; % interparticle spacing

N = 1; % Number of positive point charge consisting a group / (2.464e-12 / 1.6e-19)
v = 1; % meter per second
dura = 0.0005;
interval = 1e-6;

graphType = 'x';
x_pnt = 0; y_pnt = 0.5e-4; % location of the sensor

[X,Y] = AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);

%RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);

%% Calculate Induced EMF(Electromotive Force)

% Coil settings
N_turn = 50;    % 임의의 값
r = 5e-3;      % Radius of coil [m]
d = 5e-2;     % Length of coil [m]

[time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
%% EMF due to blood flow

timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
emf1 = -N_turn * timeVaryingMField * pi * (r^2);

figure
yyaxis left
plot(time(1:end-1),MField(1:end-1));
yyaxis right
plot(time(1:end-1),emf1);

yyaxis left
title('Magnetic Field and EMF due to blood flow'); 
xlabel('Time(s)');
ylabel('Magnetic Field(T)');

yyaxis right
ylabel('Electromotive Force(V)');