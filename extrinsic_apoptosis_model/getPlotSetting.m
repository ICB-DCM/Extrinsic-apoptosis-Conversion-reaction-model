function [par, Data, Model, options, optionmu, foldername, parameters] = getPlotSetting(scenario)
%% string of used dataset
    switch(scenario)
        case 1
            foldername = 'caspase_SCTL_PA_SCSH';
            S = [1:14];
        case 2
            foldername = 'caspase_PA_SCSH';
            S = [9:14];
        case 3
            foldername = 'caspase_SCTL_SCSH';
            S = [1:8, 13:14];
        case 4
            foldername = 'caspase_SCTL_PA';
            S = [1:12];
        case 5
            foldername = 'caspase_SCTL_PA_SCSH_CD95_Hela';
            S = [1:4, 9:11, 13, 14];
    end

%% folder and files to load
modelfile = ['ExpModel.mat'];
datafile = ['ExpData.mat'];
parameter_file = 'parameters_all.mat';

%% load parameters, data and model
load(fullfile(foldername, parameter_file))
load(modelfile)
load(datafile)
%% get parameters, data and model for fitting
par = parameters.MS.par(:, 1);
type_D = Model.type_D;
%% options for amici
options.plot = 0;
options.tau_update = 0;
options.ms_iter = 10;
options.events = 1;
options.rescaleSCTL = 1;
options.optimal_sigma = 1;
options.nderiv = 1;
options.type_D = type_D;
options.integration = Model.integration;
options.estimate_sigma = 1;
%% options for model simulation
optionmu = amioption();
optionmu.atol = 1e-8;
optionmu.rtol = 1e-12;
optionmu.nmaxevent = 1;
optionmu.maxsteps = 1e5;
end