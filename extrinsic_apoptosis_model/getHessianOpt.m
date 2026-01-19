function getHessianOpt_k(scenario, k)
   %% k index of parameter
   %% addpath(genpath('../matlab_toolbox/MEMOIR/models'))
   %% addpath(genpath('project/models'))
    
    k_str = num2str(k);
    [par, Data, Model, ~, ~, foldername, parameters] = getPlotSetting(scenario);
    options_logL.plot = 0;
    options_logL.rescaleSCTL = 1;
    options_logL.estimate_sigma = 1;
    options_logL.scalePA = 1;
    options_logL.scaleSCSH = 1;
    %% use fmincon to compute hessian
    objective_function = @(theta) logLMEMOIR(theta,Data,Model,options_logL);
    [~, g_fd_f, ~, ~] = testGradient(par, objective_function, sqrt(eps), 2, 3, k);
    [~, gradient] = logLMEMOIR(par,Data,Model,options_logL);
    %% save hessian and gradient
%     parameters.MS.gradient(:,1) = g;
%     parameters.MS.hessian(:,:,1) = g_fd_f;
    gradient_file = ['gradient_' k_str '.mat'];
    hessian_file = ['hessian_' k_str '.mat'];
    save_folder_gradient = fullfile(foldername, gradient_file);
    save(save_folder_gradient, 'gradient')
    save_folder_hessian = fullfile(foldername, hessian_file);
    save(save_folder_hessian, 'g_fd_f')
end