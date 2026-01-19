clear all; close all; clc;
%% parameter and noise
theta_mean = [log(0.6), log(0.2), log(1.8)];  % mean of parameters
theta_variance = [0.1,0,0;0,0.1,0;0,0,0.1];  % variance of parameters
scaling = log(2.5);
noise_variance = 0.06;  % variance of measurement noise
all_ncell = 30;  % number of cells
ncell = all_ncell;
t = 0:0.2:3;

    data_filename = ['SCTL_syn.mat'];
    %%  generate parameters
    theta = mvnrnd(theta_mean, theta_variance, ncell);
    %% generate artificial measurements
    x2_syn = zeros(size(t, 2), ncell);
    T_syn = zeros(ncell, 1);
    measurement = zeros(size(t,1), ncell);
    for itheta = 1:size(theta, 1)
        par = [theta(itheta, 1:2), scaling, theta(itheta, 3)];
        sol = simulate_conversion_SCTL(t, par);
        y = sol.y;
        T = sol.z;
        noise = normrnd(0,noise_variance,[size(y,1),1]);
        x2_syn(:, itheta) = y + noise;
        T_syn(itheta) = T(1) + noise(1);
        if (T_syn(itheta)) > 3
            T_syn(itheta) = 3;
        end
    end
%     
    save(data_filename, 'x2_syn', 'T_syn')
end