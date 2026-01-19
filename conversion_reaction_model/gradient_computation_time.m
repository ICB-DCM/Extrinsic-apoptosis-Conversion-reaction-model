function gradient_computation_time(s, step_size)
clear logLMEMOIR
%% addpath
%     addpath(genpath('../../matlab_toolbox/MEMOIR/models'))
%     addpath(genpath('project/models'))
    
%% load data and model
    s_str = num2str(s);
    step_size_str = num2str(step_size);
    [~, Data, Model, ~, ~, ~, ~] = getPlotSetting(1);
    Data = Data(s);
    Model.exp = Model.exp(s);
%% options
    options_logL.plot = 0;
    options_logL.rescaleSCTL = 1;
    options_logL.estimate_sigma = 1;
    options_logL.scalePA = 1;
    options_logL.scaleSCSH = 1;

    
% %% loop on gradient calculation
        par = [-0.5152
   -1.6109
    0.9023
    0.5315
   -2.4730
   -2.2422
   -2.1345];
len_par = length(par);
    tic
    [l, g] = logLMEMOIR(par,Data,Model,options_logL);
    cpu_time_g = toc;
    clear logLMEMOIR
    tic
    l = logLMEMOIR(par,Data,Model,options_logL);
    for i_par = 1:len_par
        par_f = par + [zeros(i_par - 1, 1); step_size; zeros(len_par - i_par, 1)];
        clear logLMEMOIR
        l_f = logLMEMOIR(par_f,Data,Model,options_logL);
        g_fd_f(i_par) = (l_f - l) / step_size;
        
    end
    cpu_time_fd = toc;
% 
    foldername = 'check_gradient';
    filename = ['cpu_time_' s_str '_' step_size_str '.mat'];
    file_save = fullfile(foldername, filename);
    save(file_save, 'cpu_time_g', 'cpu_time_fd')
    filename = ['gradient_' s_str '_' step_size_str '.mat'];
    file_save = fullfile(foldername, filename);
    save(file_save, 'g', 'g_fd_f')
end
