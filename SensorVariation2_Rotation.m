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

%% Angle of Coil

pos=5;

%PeakVal = []; % PeakValue of AddedMagneticField depending on position of sensor
[X_data,Y_data] = AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);
PeakVal = max( findpeaks( Y_data ) );   % maximum value of added magnetic field
PeakValAngle = [];
Angle = []; % angle check
for i = 1 : pos
   angle = pi  * i / (pos*2);
   Angle(i) = angle;
   PeakValAngle(i) = PeakVal .* cos(angle);
end

angle = linspace(0,90,pos);

figure;
plot(angle,PeakValAngle);
title('Sensor Variation2 - Rotation');
xlabel('Angle of Coil relative to Blood flow direction'); ylabel('Peak Magnetic Field');


%% Calculate the angle between direction of blood flow and location of sensor
% Assume that blood flows in the direction parallel to +x direction
%timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
%emf1 = -N * timeVaryingMField * pi * (r^2);

% figure
% plot(time(1:end-1),emf1);
% title('EMF due to blood flow'); xlabel('Time(s)'); ylabel('Electromotive Force(V)');

%% Wrong
%x_ref = 1.0e-4;
%y_ref = 0;

%y_pnt = 0.5e-4; % location of the sensor

%pos=5; % Position number

%PeakVal = []; % PeakValue of AddedMagneticField depending on position of sensor
%for i = 1 : pos
%    x_pnt = i * 1e-4;
%   [X_data,Y_data] = AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);
%   [PeakVal(i),i] = max( findpeaks( Y_data ) );
%end
%
%x_pnt = linspace(1e-4,pos*1e-4,pos); % Varify this.
%
%angle = 360*atan(abs((y_pnt-y_ref)./(x_pnt-x_ref)))/(2*pi);

%figure;
%plot(angle,PeakVal);
%title('Sensor Variation2 - Rotation');
%xlabel('Distance between Coil and RBCs'); ylabel('Peak EMF Voltage');