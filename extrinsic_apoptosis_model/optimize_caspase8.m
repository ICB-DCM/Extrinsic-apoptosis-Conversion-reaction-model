function optimize_caspase8(scenario,k)
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
    
   %S  Index of experiments
    % 1     SCTL, CD95-HeLa, L=50ng/ml
    % 2     SCTL, CD95-HeLa, L=500ng/ml
    % 3     SCTL, CD95-HeLa, L=5000ng/ml
    % 4     SCTL, CD95-HeLa, L=10000ng/ml
    % 5     SCTL, wt HeLa, L=500ng/ml
    % 6     SCTL, wt HeLa, L=2000ng/ml
    % 7     SCTL, wt HeLa, L=5000ng/ml
    % 8     SCTL, wt HeLa, L=10000ng/ml
    % 9     PA, CD95-HeLa, L=50ng/ml
    % 10    PA, CD95-HeLa, L=500ng/ml
    % 11    PA quant, CD95-HeLa
    % 12    PA quant, wt HeLa
    % 13    SCSH, CD95-HeLa, L=50ng/ml
    % 14    SCTLstat, CD95-HeLa, L=50ng/ml
    
    load(['ExpData.mat']);
    
    % load model
    load(['ExpModel.mat']);
    
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
    
    
    options.n_starts = 600;
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
