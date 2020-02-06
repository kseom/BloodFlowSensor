%% Sensor Variation2 (Rotation)
% Peak EMF voltage to Rotation angle of the sensor
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
x_pnt=0; y_pnt = 0.5e-4; % location of the sensor
%% Coil settings

N_turn = 50;    % 임의의 값
r = 5e-3;      % Radius of coil [m]
d = 5e-2;     % Length of coil [m]

%% Angle of Coil

pos=5;
PeakTime = [];
for i=1:pos;
    angle = pi  * i / (pos*2);
    [time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
    timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
    emf = -N_turn * timeVaryingMField * pi * (r^2) * cos(angle);    % Dot product -> cos(angle)
    [PeakVal(i),i] = max( findpeaks( emf ) );
end

angle = linspace(0,90,pos);

figure;
plot(angle,PeakVal);
title('Sensor Variation2 - Rotation');
xlabel('Angle of Coil relative to Blood flow direction (Degree)'); ylabel('Peak EMF Voltage(V)');
