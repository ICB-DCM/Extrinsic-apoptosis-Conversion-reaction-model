function generate_SP_approximation(nsamples, approx)
s = [1, 4, 7];

[par, Data, Model, ~, optionmu, foldername] = getPlotSetting(1);
%% PA approximation
is = 4;
    model_is = Model.exp{is};
    model_out = @(phi) model_output_SP_toy(phi, Model, Data, is, optionmu);
    op_SP.nderiv = 0;
    op_SP.req = [1,1,0,0,0,1,0]; % [1,1,0,0,0,1,0];
    op_SP.type_D = Model.type_D;
    op_SP.approx = approx;
    op_SP.nsamples = nsamples;
    SP = getSigmaPointApp(model_out,par,model_is,op_SP);
    mean_sim = SP.my;

    folder_name =  'comparison_SP_MC';
    if strcmp(approx, 'samples')
       file_name = ['PA_' num2str(is) '_samples' num2str(nsamples) '.mat'];
    else
            file_name = ['PA_' num2str(is) '_SP.mat'];
    end
    file_save = fullfile(folder_name, file_name);
    save(file_save, 'SP', 'mean_sim')
is = 7;
%% SCSH approximation
    optionsSim.approx = approx;
    optionsSim.nderiv = 0;
    optionsSim.req = [1,1,0,0,0,1,0];
    optionsSim.type_D = Model.type_D;
    optionsSim.approx = approx;
    optionsSim.nsamples = nsamples;
    [SP,~,cov_sim] = getSimulationSCSH(par, Model, Data, is, optionsSim);
 
     folder_name = 'comparison_SP_MC';
     if strcmp(approx, 'samples')
         file_name = ['SCSH_' num2str(is) '_samples' num2str(nsamples) '.mat'];
     else
            file_name = ['SCSH_' num2str(is) '_SP.mat'];
     end
     file_save = fullfile(folder_name, file_name);
     save(file_save, 'SP', 'cov_sim')
end
