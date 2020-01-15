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

AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);

%RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);

%% Calculate Induced EMF(Electromotive Force)

% Coil settings
N = 50;    % 임의의 값
r = 5e-3;      % Radius of coil [m]
d = 5e-2;     % Length of coil [m]

[time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
%%
timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
figure(3)
plot(time(1:end-1),timeVaryingMField);
%%
y = MField * pi * (r^2);    % Magnetic Field is perpendicular to the surface of coil

emf = -N * diff(y);

[t,EMF] = meshgrid(time,emf);

%fplot(emf);
figure
plot(t,EMF); xlabel('Time(s)'); ylabel('Electromotive Force(V)');

%% test
% this is a test
















