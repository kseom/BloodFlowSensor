%% Frequency change of EMF with Velocity Variation
%% Calculate Magnetic Field (without v (velocity of RBCs))

clear all
clc

N_p = 30; % number of particle
d_int = 1e-4; % interparticle spacing

N = 1; % Number of positive point charge consisting a group / (2.464e-12 / 1.6e-19)
dura = 0.0005;
interval = 1e-6;

graphType = 'x';
x_pnt = 0; y_pnt = 0.5e-4; % location of the sensor

%% Coil settings

N_turn = 50;    % 임의의 값
r = 5e-3;      % Radius of coil [m]
d = 5e-2;     % Length of coil [m]

%% Calculate Induced EMF(Electromotive Force)
% 
v_max = 10;
freq_emf = [];
PeakTime = [];
for i=1:v_max;
    v = i; % meter per second = v_RBC : velocity of RBCs
    [time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
    timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
    emf = -N_turn * timeVaryingMField * pi * (r^2);
    %[pks,locs] = findpeaks(emf);
    PeakTime = find( emf == max(emf) );
    freq_emf(i) = 1./( abs( time( PeakTime(2) )-time( PeakTime(1) ) ) );
end

v = linspace(1,v_max,v_max);
figure
plot(v,freq_emf); 
title('RBC Flow Velocity'); xlabel('Velocity of RBCs[m/s]'); ylabel('Frequency of EMF');
