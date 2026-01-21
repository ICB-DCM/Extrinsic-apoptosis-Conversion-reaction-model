clear all; close all; clc;
noise_mean = 0.03;
noise_variance = 0.001;
%% SCTL
% less data points
load('SCTL_syn.mat')
Data{1}.SCTL.time = [0:0.4:3]';
Data{1}.SCTL.Y = permute(x2_syn, [1, 3, 2]);
Data{1}.SCTL.Y = Data{1}.SCTL.Y(1:2:15, :, :);
Data{1}.SCTL.Sigma_Y = 0.06;
Data{1}.SCTL.T = permute(T_syn, [2, 3, 1]);
Data{1}.SCTL.Sigma_T = 0.06;
Data{1}.condition = 0;
Data{1}.name = 'SCTL, toy_model, conversion';
Data{1}.measurands = {'x2'};
% less data points, no event
load('SCTL_syn.mat')
Data{2}.SCTL.time = [0:0.4:3]';
Data{2}.SCTL.Y = permute(x2_syn, [1, 3, 2]);
Data{2}.SCTL.Y = Data{2}.SCTL.Y(1:2:15, :, :);
Data{2}.SCTL.Sigma_Y = 0.06;
Data{2}.condition = 0;
Data{2}.name = 'SCTL, toy_model, conversion';
Data{2}.measurands = {'x2'};
% more data points
load('SCTL_x2_syn_16.mat')
Data{3}.SCTL.time = [0:0.2:3]';
Data{3}.SCTL.Y = permute(x2_syn, [1, 3, 2]);
Data{3}.SCTL.Sigma_Y = 0.06;
Data{3}.SCTL.T = permute(T_syn, [2, 3, 1]);
Data{3}.SCTL.Sigma_T = 0.06;
Data{3}.condition = 0;
Data{3}.name = 'SCTL, toy_model, conversion';
Data{3}.measurands = {'x2'};
%% more data points
% PA
load('PA_syn.mat')
mean_x2 = mean(x2_syn');
mean_x2 = mean_x2';
noise = normrnd(0,noise_mean,[size(mean_x2,1),1]);
mean_x2 = mean_x2 + noise;
Data{5}.PA.time = [0:0.2:3]';
Data{5}.PA.m = mean_x2;
Data{5}.PA.Sigma_m = noise_mean * ones(size(mean_x2,1), 1);
Data{5}.condition = 0;
Data{5}.name = 'PA_more, toy_model, conversion';
Data{5}.measurands = {'x2'};
% SCSH
x2_syn = x2_syn';
C = var(x2_syn);
C = C';
noise = normrnd(0,noise_variance,[size(C,1),1]);
C = C + noise;
Data{8}.SCSH.time = [0:0.2:3]';
Data{8}.SCSH.m = nan(size(C,1),1);
Data{8}.SCSH.C = C;
Data{8}.condition = 0;
Data{8}.name = 'SCSH_more, toy_model, conversion';
Data{8}.measurands = {'x2'};
%% less data points
% PA
mean_x2 = mean_x2(1:2:15);
Data{4}.PA.time = [0:0.4:3]';
Data{4}.PA.m = mean_x2;
Data{4}.PA.Sigma_m = noise_mean* ones(size(mean_x2,1), 1);
Data{4}.condition = 0;
Data{4}.name = 'PA_less, toy_model, conversion';
Data{4}.measurands = {'x2'};
% SCSH
C = C(1:2:15);
Data{7}.SCSH.time = [0:0.4:3]';
Data{7}.SCSH.m = nan(size(C,1), 1);
Data{7}.SCSH.C = C;
Data{7}.condition = 0;
Data{7}.name = 'SCSH_less, toy_model, conversion';
Data{7}.measurands = {'x2'};
%% t0
% PA
load('PA_x2_syn_16.mat')
mean_x2 = mean(x2_syn');
mean_x20 = mean_x2(1);
noise = normrnd(0,noise_mean,[size(mean_x2,1),1]);
mean_x20 = mean_x20 + noise;
Data{6}.PA.time = [0];
Data{6}.PA.m = mean_x20;
Data{6}.PA.Sigma_m = noise_mean;
Data{6}.condition = 0;
Data{6}.name = 'PAt0, toy_model, conversion';
Data{6}.measurands = {'x2'};
% SCSH
x2_0 = x2_syn(1, :);
C = var(x2_0);
noise = normrnd(0,noise_variance,[1,1]);
C = C + noise;
Data{9}.SCSH.time = [0];
Data{9}.SCSH.m = nan;
Data{9}.SCSH.C = C;
Data{9}.condition = 0;
Data{9}.name = 'SCSHt0, toy_model, conversion';
Data{9}.measurands = {'x2'};
%% save
save('SynData30', 'Data')