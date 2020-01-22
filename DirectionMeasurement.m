%% Direction Measurement (Magnetic Field)
%% Description
% �ǰ� �帣�� �������� ������ �̵���ų �� ���� �ӵ��� ������ �̵��ӵ����� 
% ���ӵ��� ���. ���ӵ�(v_r)�� ���� Rate Change Of MagneticField�� ���Ѵ�. dsdfsdf
%% Parameter setting
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

v_sensor1 = 0.5;        % a sensor moving in the direction concordance with blood flow
v_r1 = v - v_sensor1;   % relative velocity between coil and blood flow

v_sensor2 = -0.5;       % a sensor moving in the opposite direction with blood flow
v_r2 = v - v_sensor2;   % relative velocity between coil and blood flow

AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);

RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v_r1);
RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v_r2);
%%
%[time1, MField1] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);

%[time2, MField2] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v_r1);

%[time3, MField3] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v_r2);

%[T1,M1] = meshgrid(time1, MField1);
%[T2,M2] = meshgrid(time2, MField2);
%[T3,M3] = meshgrid(time3, MField3);

%figure(1)
%plot(T1,M1, 'black');
%xlabel('time (s)'); ylabel('Magnetic field (T)');
%figure(2)
%plot(T2,M2, 'red');
%xlabel('time (s)'); ylabel('Magnetic field (T)');
%figure(3)
%plot(T3,M3, 'blue');
%xlabel('time (s)'); ylabel('Magnetic field (T)');
%
