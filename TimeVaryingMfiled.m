%% Calculate the time varying magnetic field
%% Description
% Calculate the magnetic field at 'x_pnt' and 'y_pnt' as a function of
% time.
% We will use 'AddMagneticField.m' to get magnetic field generated from
% multiple moving particles. However, since hemoglobin flows continuously
% we will take only the one period of magnetic field in the center (where
% the magnetic field maximizes) and replicate this one period of magnetic
% field through entire time domain. 
%% Parameter setting
clear all
clc

N_p = 30; % number of particle
d_int = 1e-4; % interparticle spacing

N = 1; % Number of positive point charge consisting a group 
v = 1; % meter per second
dura = 0.005;   % ??
interval = 1e-6;

graphType = 'x';
x_pnt = 0; y_pnt = 0.5e-4; % location of the sensor

AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);
 

%% time varying magnetic field
[X_data, Y_data] = AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);
[pks,locs] = findpeaks(Y_data);     % pks : peaks의 값, loc : peak의 location.

if length(pks) ~= N_p           % length(pks) : vector의 크기(길이) / peak의 갯수  check
    warning('Unexpected error in the number of peaks')
end

idx_temp = locs(round(length(pks)/2)); idx_center = round(length(Y_data)/2);

if idx_temp >= idx_center
    idx_1st = locs(round(length(pks)/2)-1); idx_2nd = idx_temp;
else
    idx_1st = idx_temp; idx_2nd = locs(round(length(pks)/2)+1);
end


%% rate change of magnetic field
Y_data_new = [Y_data(idx_center:idx_2nd), Y_data(idx_1st+1:idx_center-1)]; Y_data_new = flip(Y_data_new);
n_cyc = round(dura/(length(Y_data_new)*interval/v));
MField = repmat(Y_data_new,1,n_cyc);    % repmat : Y_data_new matrix를 복사.
time = (0:1:length(MField)-1)*interval/v;

figure(3)
plot(time, MField); xlabel('time (s)'); ylabel('Magnetic field (T)');
