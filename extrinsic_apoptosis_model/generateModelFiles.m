clear
close all

addpath(genpath('project/models'))
addpath(genpath('project'))
    
    %% General options
    
    model = 'caspase8';
    
    S = [1:14]; % Index of experiments
    
    load('ExpData')
    model_fun = @(xi) model_caspase8_diag(xi);
    experiment_fun = @(Model,S) experiments_caspase8(Model, S, Data);
    
    %% Definition of mixed-effect model
    % parameters for simulating experimental data:
    % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
    % CD95_0A CD95_0H FADD_0 p55_0 BID_0 PrERF1_0A PrERF1_0H PrNESF2_0A PrNESF2_0H volume_0 tBID_tapt
    % s_GFP s_mCh 
    logbeta = log([8.98;15.4;0.000812;0.00567;0.000492;0.0114;...       %ks
        0.000447;0.00344;0.0950;0.000529;0.00152;...                    %ks
        116.2;12.61;93.41;155.6;236.2;5291;3913;1760;1964;3662;.3136;...%x0,vol,tBID_thd
        0.00350;0.0173]);                                               %sfs
    % diagonal of covariance matrix, random effects for:
    % CD95_0A CD95_0H FADD_0 p55_0 BID_0 PrERF1_0A PrERF1_0H PrNESF2_0A PrNESF2_0H volume_0 tBID_tapt
    logdelta = log([.1831;.2760;.1153;.2171;.4723;.0413;.0906;.1252;.0385;.0422;.1617]);%Ds, x0 Vc tBID_thd
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
 
    save('ExpModel.mat','Model','parameters_MEM')
    
end

