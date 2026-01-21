clear
close all
addpath(genpath('project'))
addpath(genpath('project/models'))
    
%% General options

model = 'Conversion_syn';

S = [1:9]; % Index of experiments
model_fun = @(xi) model_conversion(xi);
experiment_fun = @(Model,S) syn_conversion(Model,S);

%% Definition of mixed-effect model
logbeta = log([0.6; 0.2; 2.5; 1.8]);                                           
% diagonal of covariance matrix
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

