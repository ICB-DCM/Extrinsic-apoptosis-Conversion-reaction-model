function optimize_conversion(scenario,k)
%% add path
     addpath(genpath('../toolboxes/MEMOIR/models'))
     addpath(genpath('project/models'))
warning off
    
    rng(0); % sets seed for data simulation
    
    %% General options
    
    % int -> model integration
    int = 1;
    % sctl -> single cell time lapse
    sctlscale = 1;
    % S_str -> experimental index
    
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

    load(['SynData.mat']);
    
    % load model
    load(['SynModel.mat']);
    
    Model.integration = int;
    Data = Data(S);
    Model.exp = Model.exp(S);
    
    %% Mixed Effects Optimization
    
    %Options for multi-start optimization
    options = PestoOptions;
    options.localOptimizerOptions = optimset('algorithm','interior-point',...
        'GradObj','on',...
        'MaxIter',1000,... 
        'TolFun',0,...
        'TolX',1e-10,...
        'display','iter',... %        'display','final',...
        'MaxFunEvals',1000*parameters_MEM.number);
    
    
    options.n_starts = 200;
    options.comp_type = 'sequential';
    options.mode = 'text';
    options.start_index = k;
    
    options.foldername = foldername;
    options.trace = true;
    options.tempsave = true;
    options.save = true;

    options_logL.plot = 0;
    options_logL.rescaleSCTL = sctlscale;
    options_logL.estimate_sigma = 1;
    options_logL.scalePA = 1;
    options_logL.scaleSCSH = 1;
    options.obj_type = 'log-posterior';
    Model.estim_sigma = false;

    parameters_MEM = getMultiStarts(parameters_MEM,@(theta) logLMEMOIR(theta,Data,Model,options_logL),options);

    
    disp('now exiting')
    exit;
end
