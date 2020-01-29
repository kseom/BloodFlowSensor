%% Sensor Variation1 (Position)
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
x_pnt = 0;
% x_pnt = 0; y_pnt = 0.5e-4; % location of the sensor

%% Varify the position of sensor

pos=5; % Position number

PeakVal = []; % PeakValue of AddedMagneticField depending on position of sensor
for i = 1 : pos
    y_pnt = i * 1e-4;
   [X_data,Y_data] = AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);
   [PeakVal(i),i] = max( findpeaks( Y_data ) );
end

%% Plot (Distance between Coil and RBCs - PeakVal) Graph

DistSensor = linspace(1e-4, pos*1e-4, pos);
figure;
plot(DistSensor,PeakVal);
title('Sensor Variation1 - Position');
xlabel('Distance between Coil and RBCs'); ylabel('Peak Magnetic Field');

%%
% [time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
% timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
%% Calculate Induced EMF(Electromotive Force)

% Coil settings
%N_turn = 50;    % ������ ��
%r = 5e-3;      % Radius of coil [m]
%d = 5e-2;     % Length of coil [m]

%pos=5; % Position number

%PeakVal = []; % PeakValue of AddedMagneticField depending on position of sensor
%for i = 1 : pos
%    y_pnt = i * 1e-4;
%    
%   [time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
%   timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
%   emf = -N_turn * timeVaryingMField * pi * (r^2);
%   
%   [PeakVal(i),i] = max( findpeaks( emf ) );
%end