clear all; close all; clc;
%% parameter and noise
theta_mean = [log(0.6), log(0.2)];  % mean of parameters
theta_variance = [0.1,0;0,0.1];  % variance of parameters
noise_variance = 0.06;  % variance of measurement noise
all_ncell = 100;  % number of cells

%% file names
ncell = all_ncell;
t = 0:0.2:3;

data_filename = ['PA_syn.mat'];
%%  generate parameters
theta = mvnrnd(theta_mean, theta_variance, ncell);
%% generate artificial measurements
x2_syn = zeros(size(t, 2), ncell);
measurement = zeros(size(t,1), ncell);
for itheta = 1:size(theta, 1)
    sol = simulate_conversion_PA(t, theta(itheta, :));
    y = sol.y;
    noise = normrnd(0,noise_variance,[size(y,1),1]);
    x2_syn(:, itheta) = y + noise;
end
save(data_filename, 'x2_syn')