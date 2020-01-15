function [time,MField] = RateChangeOfMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,dura,interval,N,v)
%% time varying magnetic field
[X_data, Y_data] = AddMagneticField(N_p,d_int,graphType,x_pnt,y_pnt,interval,N,v);
[pks,locs] = findpeaks(Y_data);

if length(pks) ~= N_p
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
MField = repmat(Y_data_new,1,n_cyc);
time = (0:1:length(MField)-1)*interval/v;

figure
plot(time, MField); xlabel('time (s)'); ylabel('Magnetic field (T)');