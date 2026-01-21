function [par, Data, Model, options, optionmu, foldername, parameters] = getPlotSetting(scenario)
%% string of used dataset
%% folder and files to load
    switch(scenario)
        case 1
            foldername = 'conversion_SCTL_PA_SCSH';
            S = [1, 4, 7];
        case 2
            foldername = 'conversion_PA_SCSH';
            S = [4, 7];
        case 3
            foldername = 'conversion_SCTL_SCSH';
            S = [1, 7];
        case 4
            foldername = 'conversion_SCTL_PA';
            S = [1, 4];
        case 5
            foldername = 'conversion_SCTL';
            S = [1];
        case 6
            foldername = 'conversion_PA';
            S = [4];
    end
modelfile = ['SynModel.mat'];
datafile = ['SynData.mat'];
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