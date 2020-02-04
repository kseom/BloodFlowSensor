%% Velocity Measurement
%% Calculate Magnetic Field

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

figure(1)
plot(time(1:end-1),emf1, 'black'); hold on;
xlim([0 4e-4]);
title('Sensor Direction Measurement'); xlabel('Time(s)'); ylabel('Electromotive Force(V)');
%% A sensor moving in the direction concordance with blood flow

v_sensor1 = 0.5;        % a sensor moving in the direction concordance with blood flow
v_r1 = v - v_sensor1;   % relative velocity between coil and blood flow

AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v_r1);

[time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v_r1);

timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
emf2 = -N_turn * timeVaryingMField * pi * (r^2);

figure(1)
plot(time(1:end-1),emf2, 'red'); hold on;
%title('A sensor moving in the direction concordance with blood flow'); xlabel('Time(s)'); ylabel('Electromotive Force(V)');

%% A sensor moving in the opposite direction with blood flow

v_sensor2 = -0.5;       % a sensor moving in the opposite direction with blood flow
v_r2 = v - v_sensor2;   % relative velocity between coil and blood flow

AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v_r2);

[time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v_r2);

timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
emf3 = -N_turn * timeVaryingMField * pi * (r^2);

figure(1)
plot(time(1:end-1),emf3, 'blue'); hold off;

%title('A sensor moving in the opposite direction with blood flow'); xlabel('Time(s)'); ylabel('Electromotive Force(V)');

%%
%y = MField * pi * (r^2);    % Magnetic Field is perpendicular to the surface of coil
%emf = -N * diff(y);

%[t,EMF] = meshgrid(time,emf);

%fplot(emf);
%figure
%plot(t,EMF); xlabel('Time(s)'); ylabel('Electromotive Force(V)');

















