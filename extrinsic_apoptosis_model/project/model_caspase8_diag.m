function [Model,parameters] = model_C8S_diag(xi)
    
    % Parameter mixture
   
    % Parameter struct (for optimization)
    lenxi = length(xi);
    %                 ks,x0                           tBID_thd   sfs                      covariances
    parameters.min = [log(1e-5 * ones(lenxi - 14, 1)); log(1e-4); log(1e-5 * ones(2, 1)); log(1e-4 * ones(11, 1))];
    parameters.max = [log(1e5 * ones(lenxi - 14, 1)); log(1); log(1e5 * ones(2, 1)); log(ones(11, 1))];
    parameters.number = length(parameters.max);
    
    % Covariance parametrisation
    Model.type_D = 'diag-matrix-logarithm';
    
    Model.param = {'KDR' 'KDL' 'kon_FADD' 'koff_FADD' 'kon_p55' 'kpd_cis' 'ked_tr_p55'...
        'ked_tr_p43' 'kp18i' 'kBID' 'kprobes_s_C8' 'CD95_0A' 'CD95_0H' 'FADD_0' 'p55_0'...
        'BID_0' 'PrERF1_0A' 'PrERF1_0H' 'PrNESF2_0A' 'PrNESF2_0H' 'volume_0' 'tBID_tapt' 's_GFP' 's_mCh'};
    Model.fixed_effect = [ones(1,24)];
    %                      ks          x0         sfs
    Model.random_effect = [zeros(1,11) ones(1,11) zeros(1,2)];% ks x0 sfs

    Model = make_model(Model);
    
    for j = 1:lenxi
        parameters.name{j} = ['log(' char(Model.sym.xi(j)) ')'];
    end
    
end