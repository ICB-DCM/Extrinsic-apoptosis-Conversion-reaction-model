function [Model,parameters] = model_conversion(xi)
    
    % Parameter mixture
   
    % Parameter struct (for optimization)
    lenxi = length(xi);
    %                 ks,x0                           tBID_thd   sfs                      covariances
    parameters.min = [log(1e-5 * ones(lenxi, 1))];
    parameters.max = [log(1e3 * ones(lenxi-3, 1)); log(ones(3, 1))];
    parameters.number = length(parameters.max);
    
    % Covariance parametrisation
    Model.type_D = 'diag-matrix-logarithm';
    
    Model.param = {'theta1' 'theta2' 'scaling' 'x2_cut'};
    Model.fixed_effect = [ones(1, 4)];
    %                      ks          x0         sfs
    Model.random_effect = [ones(1, 2), 0, 1];% ks x0 sfs

    Model = make_model(Model);
    
    for j = 1:lenxi
        parameters.name{j} = ['log(' char(Model.sym.xi(j)) ')'];
    end
    
end