%% Sensor Variation3 (N_turn size of the coil)
% Peak EMF voltage to Distance between coil and RBC (Position)
%% Magnetic Field Setting

clear all
clc
 
N_p = 30; % number of particle
d_int = 1e-4; % interparticle spacing

N = 1; % Number of positive point charge consisting a group / (2.464e-12 / 1.6e-19)
v = 1; % meter per second
dura = 0.01;
interval = 1e-6;

graphType = 'x';
x_pnt = 0; y_pnt = 0.5e-4; % location of the sensor

%% Coil settings

%N_turn = 50;    % 임의의 값
r = 5e-3;      % Radius of coil [m]
d = 5e-2;     % Length of coil [m]

%% Varify the Number of Turns of Coil(sensor)

Turn_No_max = 5;
PeakTime = [];
for i=1:Turn_No_max;
    N_turn = (i) * 50; % # of Turns
    [time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
    timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
    emf = -N_turn * timeVaryingMField * pi * (r^2);
    [PeakVal(i),i] = max( findpeaks( emf ) );
end

%% Plot (Distance between Coil and RBCs - PeakVal) Graph

Turns = linspace(50, Turn_No_max*50, Turn_No_max);
figure;
plot(Turns,PeakVal);
title('Sensor Variation3 - N_Turn');
xlabel('Number of Turns of Coil'); ylabel('Peak EMF Voltage(V)');
