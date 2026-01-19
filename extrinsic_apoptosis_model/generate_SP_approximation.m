function generate_SP_approximation(nsamples, approx)
%% n_samples = 50000;
%% approx = 'samples'
[par, Data, Model, ~, optionmu, foldername] = getPlotSetting(1);
%% PA approximation
for is = 9 :14
    if is < 13
        model_is = Model.exp{is};
        model_out = @(phi) model_output_SP(phi, Model, Data, is, optionmu);
        op_SP.nderiv = 0;
        op_SP.req = [1,1,0,0,0,1,0]; % [1,1,0,0,0,1,0];
        op_SP.type_D = Model.type_D;
        op_SP.approx = approx;
        op_SP.nsamples = nsamples;
        SP = getSigmaPointApp(model_out,par,model_is,op_SP);
        mean_sim = SP.my;
        dm_sim = zeros(size(mean_sim, 1), size(mean_sim, 2), size(par, 1));
        [mean_sim, ~] = model_is.PA_post_processing(mean_sim, dm_sim);

        folder_name = 'comparison_SP_MC';
        if strcmp(approx, 'samples')
            file_name = ['PA_' num2str(is) '_samples' num2str(nsamples) '.mat'];
        else
            file_name = ['PA_' num2str(is) '_SP.mat'];
        end
        file_save = fullfile(folder_name, file_name);
        save(file_save, 'SP', 'mean_sim')
    % end
    else
    %% SCSH approximation
        optionsSim.approx = approx;
        optionsSim.nderiv = 0;
        optionsSim.req = [1,1,0,0,0,1,0];
        optionsSim.type_D = Model.type_D;
        optionsSim.approx = approx;
        optionsSim.nsamples = nsamples;
        [SP,~,cov_sim] = getSimulationSCSH(par, Model, Data, is, optionsSim);
        cov_sim = diag(permute(cov_sim, [2,3,1]))';
        folder_name = 'comparison_SP_MC';
        if strcmp(approx, 'samples')
            file_name = ['SCSH_' num2str(is) '_samples' num2str(nsamples) '.mat'];
        else
            file_name = ['SCSH_' num2str(is) '_SP.mat'];
        
        file_save = fullfile(folder_name, file_name);
        save(file_save, 'SP', 'cov_sim')
    end
end
