%% Frequency change of EMF with RBCs Spacing Variation
%% Calculate Magnetic Field (without d_int (RBCs Spacing))

clear all
clc

N_p = 30; % number of particle

N = 1; % Number of positive point charge consisting a group / (2.464e-12 / 1.6e-19)
v = 1; % meter per second = v_RBC : velocity of RBCs
dura = 0.0005;
interval = 1e-6;

graphType = 'x';
x_pnt = 0; y_pnt = 0.5e-4; % location of the sensor

%% Coil settings

N_turn = 50;    % ������ ��
r = 5e-3;      % Radius of coil [m]
d = 5e-2;     % Length of coil [m]

%% Calculate Induced EMF(Electromotive Force)

d_max = 10;
freq_emf = [];
PeakTime = [];
for i=1:d_max;
    d_int = (i+2) * 2e-5; % interparticle spacing
%    [X_data, Y_data] = AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);
%    [pks,locs] = findpeaks(Y_data);
    [time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
    timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
    emf = -N_turn * timeVaryingMField * pi * (r^2);
    [pks,locs] = findpeaks(emf);
    PeakTime = find( emf == max(emf) );
    freq_emf(i) = 1./( abs( time( PeakTime(2) )-time( PeakTime(1) ) ) );
end

d_int = linspace(3 * 2e-5,(d_max+2) * 2e-5,d_max);
figure
plot(d_int,freq_emf);
title('RBC Spacing'); xlabel('Interparticle spacing(RBCs Spacing)'); ylabel('Frequency of EMF');
