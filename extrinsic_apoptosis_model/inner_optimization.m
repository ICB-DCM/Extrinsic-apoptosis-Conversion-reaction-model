function inner_optimization(dataset, i_cell)
%% i_model index of dataset 1-8
%% i_cell index of cell in the dataset, 1-30 for dataset 1-4 and 1-10 for dataset 5-8.
addpath(genpath('../toolboxes/MEMOIR/models'))
addpath(genpath('project/models'))

warning off
rng(0);
str_model = num2str(dataset);
str_cell = num2str(i_cell);
filename = ['dataset_' str_model '_cell_' str_cell];
%% load model and data files
modelfile = ['ExpModel.mat'];
datafile = ['ExpDatamat'];
load(modelfile)
load(datafile)
%i_model = 1;
model = Model.exp{dataset};
data = Data{dataset};

%% estimated parameters
len_par = 8;
parameters_inner.min = -10 * ones(len_par, 1);
parameters_inner.max = 10 * ones(len_par, 1);
parameters_inner.number = len_par;

%% parameters
xi00 = [9.7168
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
   -2.3324
    ];
xi = xi00;
beta = model.beta(xi);
delta = model.delta(xi);
%i_cell = 1;
options_logL.plot = 0;
options_logL.rescaleSCTL = 1;
options_logL.estimate_sigma = 1;
options_logL.scalePA = 1;
options_logL.scaleSCSH = 1;
options_logL1.tau_update = 0;
options_logL1.plot = 1;
options_logL1.ms_iter = 10;
options_logL1.events = 1;
options_logL1.rescaleSCTL = 0;
options_logL1.optimal_sigma = 1;
options_logL = setdefault(options_logL, options_logL1);
options_logL.nderiv = 2;
options_logL.type_D = Model.type_D;
options_logL.integration = Model.integration;

%% other parameters
tmp = arrayfun(@(x) any(~isnan(data.SCTL.Y(:,:,x)),2),1:size(data.SCTL.Y,3),'UniformOutput',false);
data.SCTL.ind_y = false(size(data.SCTL.Y,1),size(data.SCTL.Y,3));
data.SCTL.ind_y(:,:) = [tmp{:}];
tmp = arrayfun(@(x) any(~isnan(data.SCTL.T(:,:,x)),2),1:size(data.SCTL.T,3),'UniformOutput',false);
data.SCTL.ind_t = false(size(data.SCTL.T,1),size(data.SCTL.T,3));
data.SCTL.ind_t(:,:) = [tmp{:}];

%% multistarts options
options = PestoOptions;
options.localOptimizerOptions = optimset('algorithm','trust-region-reflective',...
    'display', 'off', ...
    'GradObj','on',...
    'MaxIter',1000,... 
    'TolFun',0,...
    'TolX',1e-10,...
    'PrecondBandWidth', Inf, ...
    'Hessian','user-supplied');


options.n_starts = 500;
options.comp_type = 'sequential';
options.mode = 'text';
%options.start_index = k;
options.foldername = filename;
options.trace = true;
options.tempsave = true;
options.save = true;
options.obj_type = 'negative log-posterior';


%% multistarts
parameters_inner = getMultiStarts(parameters_inner,@(b) objective_SCTL_s1(model,data,beta,b,delta,dataset,i_cell,options_logL,2),options);

disp('now exiting')
exit;
end
