clear all;
%% data folder

SP_folder = 'comparison_SP_MC';
%% load model
s = 1:14;
[par, Data, Model, ~, optionmu, foldername] = getPlotSetting(1);
%% sample numbers
sample_num_all = [100, 1000, 10000, 50000];
true_sample_num = 100000;
true_sample_str = num2str(true_sample_num);
%% load true mean
for is = 9:10
    is_str = num2str(is);
    model_is = Model.exp{is};
    filename_true = ['PA_' is_str '_samples' true_sample_str '.mat'];
    file_load_true = fullfile(SP_folder, filename_true);
    load(file_load_true)
    mean_true = mean_sim;
    SP_true = SP;
    cov_sim = SP_true.Cy;
    cov_true = cov_sim;
%% loop over sample number
    for i_sample = 1:5
        if i_sample > 1
            average_num = 100;
            sample_num = sample_num_all(i_sample-1);
            sample_num_str = num2str(sample_num);
            error_my_total = 0;
            error_Cy_total = 0;
            for i_ind = 1:average_num
                ind = randi([1, true_sample_num], [1, sample_num]);
                Y_sample = SP_true.Y(:, :, ind);
                mean = sum(Y_sample, 3) / sample_num;
                dm = zeros(size(mean, 1), size(mean, 2), size(par, 1));
                [mean_pos, ~] = model_is.PA_post_processing(mean, dm);
                error_my = sum(sum(abs(mean_pos - mean_true)))/sum(sum(mean_true));
                error_my_total = error_my_total + error_my;
                % compute cy
                w_c = 1/((size(Y_sample,3))-1)*ones(size(Y_sample,3),1);
                DeltaY = bsxfun(@minus,Y_sample,mean);
                cov_sim = sum(bsxfun(@times,permute(w_c,[4,3,2,1]),...
                    bsxfun(@times,permute(DeltaY,[1,2,4,3]),permute(DeltaY,[1,4,2,3]))),4);
                error_Cy = sum(sum(sum(abs(cov_sim - cov_true))))/sum(sum(sum(cov_true)));
                error_Cy_total = error_Cy_total + error_Cy;
            end
        else
            filename_SP = ['PA_' is_str '_SP.mat'];
            file_load = fullfile(SP_folder, filename_SP);
            load(file_load)
            error_my_total = sum(sum(abs(mean_sim - mean_true)))/sum(sum(mean_true));
            cov_sim = SP.Cy;
            error_Cy_total = sum(sum(sum(abs(cov_sim - cov_true))))/sum(sum(sum(cov_true)));
            average_num = 1;
        end
        error_my_cas(1, i_sample) = error_my_total / average_num;
        error_Cy_cas(1, i_sample) = error_Cy_total / average_num;
    end
    filename = ['PA_' is_str '_average.mat'];
    filesave = fullfile(SP_folder, filename);
    save(filesave, 'error_my_cas', 'error_Cy_cas')
end