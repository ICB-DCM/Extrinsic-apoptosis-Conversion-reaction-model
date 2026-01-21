function check_gradient(s, num_cell)
%% addpath
%     addpath(genpath('../matlab_toolbox/MEMOIR/models'))
    addpath(genpath('project/models'))
    
%% load data and model
    s_str = num2str(s);
    [par, Data, Model, ~, ~, ~, ~] = getPlotSetting(1);
    Data = Data(s);
    Model.exp = Model.exp(s);
%% options
    options_logL.plot = 0;
    options_logL.rescaleSCTL = 1;
    options_logL.estimate_sigma = 1;
    options_logL.scalePA = 1;
    options_logL.scaleSCSH = 1;
    
%% set parameters
    par_min = log(1e-5);
    par_max = log(1e5);
    par1_all = par_min:0.1:par_max;
    len_par = length(par1_all);
    g_fd_fbc = zeros(len_par, 3);
    g_analytical = zeros(len_par, 1);
    
% %% loop over gradient calculation
        par = [-0.5152
   -1.6109
    0.9023
    0.5315
   -2.4730
   -2.2422
   -2.1345];
        objective_function = @(theta) logLMEMOIR(theta,Data,Model,options_logL);
        stepsize_all = [1e-10, 1e-9, 1e-8, 1e-7, 1e-6, 1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1, 10];
        for stepsize = stepsize_all
            [g, g_fd_f, g_fd_b, g_fd_c, cpu_time_g, cpu_time_fd] = testGradient(par, objective_function, 1e-2, 1, 2);
    
            foldername = 'check_gradient';
            filename = ['gradient_' s_str '_' num2str(stepsize) '.mat'];
            file_save = fullfile(foldername, filename);
            save(file_save, 'g', 'g_fd_f', 'g_fd_c', 'g_fd_b')
        end
end