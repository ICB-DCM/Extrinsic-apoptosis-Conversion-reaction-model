function gradient_computation_time(s)
%% this is a function to get the computation time for gradient computation. In the manuscript we compute the gradient for each dataset using the optimized parameters for scenario 1.
%% addpath
%     addpath(genpath('../matlab_toolbox/MEMOIR/models'))
%     addpath(genpath('project/models'))
%     addpath(genpath('gridtool'))
    
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
    
%% this is the optima
        par = [9.7168
    3.9663
   -2.8718
   -4.6199
   -1.6519
   -4.3337
   -6.2466
   -4.3365
   -2.0224
   -7.5281
   -4.5757
    3.1271
    2.1445
    4.5042
    4.9614
    5.4060
    7.5776
    7.3898
    8.2049
    8.2783
    8.2413
   -3.2788
   -4.7015
   -4.7751
   -2.9415
   -2.8933
   -4.3977
   -4.2608
   -4.3694
   -3.1188
   -2.4116
   -1.8984
   -3.3368
   -4.1697
   -2.3324];
        objective_function = @(theta) logLMEMOIR(theta,Data,Model,options_logL);
        [g, g_fd_f, ~, ~, cpu_time_g, cpu_time_fd] = testGradient(par, objective_function, 1e-2, 1, 2);
    
    foldername = 'check_gradient';
    filename = ['cpu_time_' s_str '.mat'];
    file_save = fullfile(foldername, filename);
    save(file_save, 'cpu_time_g', 'cpu_time_fd')
end
