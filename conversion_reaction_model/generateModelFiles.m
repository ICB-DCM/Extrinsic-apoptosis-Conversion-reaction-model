clear
close all
% 
% addpath(genpath('../../matlab_toolbox/MEMOIR'))
% addpath(genpath('../../matlab_toolbox/AMICI'))
% addpath(genpath('../../matlab_toolbox/PESTO'))
% addpath(genpath('conversion_model'))
    
%% General options

model = 'Conversion_syn';

S = [1:9]; % Index of experiments
model_fun = @(xi) model_conversion(xi);
experiment_fun = @(Model,S) syn_conversion(Model,S);

%% Definition of mixed-effect model
logbeta = log([0.6; 0.2; 2.5; 1.8]);                                           
% diagonal of covariance matrix, random effects for:
% CD95_0A CD95_0H FADD_0 p55_0 BID_0 PrERF1_0A PrERF1_0H PrNESF2_0A PrNESF2_0H volume_0 tBID_tapt
logdelta = log([sqrt(0.1); sqrt(0.1); sqrt(0.1)]);%Ds, x0 Vc tBID_thd
logsigma = [];
xi = [logbeta;logdelta,logsigma];
[Model,parameters_MEM] =  model_fun(xi);

Model.integration = true;
Model.penalty = false;
Model.name = model;

%% Definition of Experiments

Model = experiment_fun(Model,S);

Model = complete_model(Model,S);

close all

save('SynModel.mat','Model','parameters_MEM')

