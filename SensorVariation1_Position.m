%% Sensor Variation1 (Position)
% Peak EMF voltage to Distance between coil and RBC (Position)
%% Magnetic Field Setting

clear all
clc
 
N_p = 30; % number of particle
d_int = 1e-4; % interparticle spacing

N = 1; % Number of positive point charge consisting a group / (2.464e-12 / 1.6e-19)
v = 1; % meter per second
dura = 0.005;
interval = 1e-6;

graphType = 'x';
x_pnt = 0;
% x_pnt = 0; y_pnt = 0.5e-4; % location of the sensor
%% Coil settings

N_turn = 50;    % 임의의 값
r = 5e-3;      % Radius of coil [m]
d = 5e-2;     % Length of coil [m]

%% Position of Coil(Sensor)

pos=5;
PeakVal = [];
for i=1:pos;
    y_pnt = (i+2) * 1e-5;
%    [X_data, Y_data] = AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);
%    [pks,locs] = findpeaks(Y_data);
    [time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
    timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
    emf = -N_turn * timeVaryingMField * pi * (r^2);
    [PeakVal(i),i] = max( findpeaks( emf ) );
end

%% Plot (Distance between Coil and RBCs - PeakVal) Graph

DistSensor = linspace(3e-5, (pos+2)*1e-5, pos);
figure;
plot(DistSensor,PeakVal);
title('Sensor Variation1 - Position');
xlabel('Distance between Coil and RBCs'); ylabel('Peak EMF Voltage');
