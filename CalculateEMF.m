function [time,emf] = CalculateEMF(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v,N_turn,r,d)
%% Calculate Induced EMF(Electromotive Force)

% Coil settings
% N_turn = 50;    % 임의의 값
% r = 5e-3;      % Radius of coil [m]
% d = 5e-2;     % Length of coil [m]

[time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v);
%% EMF due to blood flow

timeVaryingMField = (MField(2:end)-MField(1:end-1))./(time(2)-time(1));
emf = -N_turn * timeVaryingMField * pi * (r^2);

% figure
% plot(time(1:end-1),emf1); 
% title('EMF due to blood flow'); xlabel('Time(s)'); ylabel('Electromotive Force(V)');