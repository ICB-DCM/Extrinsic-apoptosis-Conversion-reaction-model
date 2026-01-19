function getSingleCellPar(scenario)
% this is a function to plot the fitting of single cells using estimated parameters, in this manuscript, we computed the single cell script for only scenario 1, but you can do it also for other scienarios using this script.
% scenario: int, scenario number according to the manuscript
% bound: boundary used for fitting
%        0 for same boundary
%        'orgB' for original boundary used by Fabi
%        'new' for new boundary provided by Stefan
%% number of simulated single cells
num_samples = 1000;
%% get settings
[par, Data, Model, options, optionmu] = getPlotSetting(scenario);
%% SCTL data
for idata = 1:8
    %% get model and data
    model_idata = Model.exp{idata};
    data_idata = Data{idata};
    beta = model_idata.beta(par);
    %% get experimental data and time
    y_exp = data_idata.SCTL.Y;
    n_cell = size(y_exp, 3);
    %% values needed for opitimization
    [data_idata, P] = getSCTLSetting(data_idata, Data, par, model_idata);
    %% matrix for simulated data
    phi_sim = zeros(21, 1, num_cell);
    bhat_sim = zeros(8, 1, num_cell);
    logL = zeros(n_cell, 1);
    for icell = 1:n_cell
        [logLsc, bhat, ~] = logL_SCTL_si(par, model_idata, data_idata, idata, options, P, icell);
        bhat_sim(:, :, icell) = bhat.val;
        phi_sim(:, :, icell) = model_idata.phi(beta, bhat.val);
        logL(icell) = logLsc.val;
    end

        switch(scenario)
        case 1
            foldername = 'caspase_SCTL_PA_SCSH';
        case 2
            foldername = 'caspase_PA_SCSH';
        case 3
            foldername = 'caspase_SCTL_SCSH';
        case 4
            foldername = 'caspase_SCTL_PA';
        case 5
            foldername = 'caspase_SCTL_PA_SCSH_CD95_Hela';
        end
    folder_save = fullfile('singleCellParameters', foldername);
    phi_file = ['phi' num2str(idata) '.mat'];
    bhat_file = ['bhat' num2str(idata) '.mat'];
    log_file = ['logL' num2str(idata) '.mat'];
    save(fullfile(folder_save, phi_file), 'phi_sim')
    save(fullfile(folder_save, bhat_file), 'bhat_sim')
    save(fullfile(folder_save, log_file), 'logL')
end

