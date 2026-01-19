function Model = experiments_C8S_diag_30_new_sigma(Model, S, Data)

b  = Model.sym.b;
beta = Model.sym.beta;

s = 0;
% Experiment 1
if ismember(1,S)
    s = s + 1;
    Model.exp{s}.N = 30;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = repmat([0:5:200]',1,Model.exp{s}.N);
    
    Model.exp{s}.ind_phi = [1:21];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(12);beta(14:17);beta(19);beta(21:22)]+[b(1);b(3:6);b(8);b(10:11)]; % CD95_0A FADD_0 p55_0 BID_0 PrERF1_0A PrNESF2_0A volume_0 tBID_tapt
        beta(23:24)];%s_GFP s_mCh
    % for sigmas, values around 10% of the observable values were chosen
    % sigmas are normalized using the number of measured time points, so
    % that the other measurements are not weighted too strong compared to volume
    num_measure = sum(~isnan(Data{1}.SCTL.Y));
    sigma_noise = [.001 .005 3 5 300];
    Model.exp{s}.sym.sigma_noise = sym(bsxfun(@rdivide, sigma_noise, sqrt(num_measure)));
    Model.exp{s}.sym.sigma_mean = [];
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.sym.sigma_time = sym([5]);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    Model.exp{s}.time_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_A(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'SCTL, C8, CD95-HeLa, L=50ng/ml';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh,op_plot);
end

% Experiment 2
if ismember(2,S)
    s = s + 1;
    Model.exp{s}.N = 30;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = repmat([0:3:120]',1,Model.exp{s}.N);
    
    Model.exp{s}.ind_phi = [1:21];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(12);beta(14:17);beta(19);beta(21:22)]+[b(1);b(3:6);b(8);b(10:11)]; % CD95_0A FADD_0 p55_0 BID_0 PrERF1_0A PrNESF2_0A volume_0 tBID_tapt
        beta(23:24)];%s_GFP s_mCh
    num_measure = sum(~isnan(Data{2}.SCTL.Y));
    sigma_noise = [.001 .005 3 5 300];
    Model.exp{s}.sym.sigma_noise = sym(bsxfun(@rdivide, sigma_noise, sqrt(num_measure)));
    Model.exp{s}.sym.sigma_mean = [];
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.sym.sigma_time = sym([5]);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    Model.exp{s}.time_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_A(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'SCTL, C8, CD95-HeLa, L=500ng/ml';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh,op_plot);
end

% Experiment 3
if ismember(3,S)
    s = s + 1;
    Model.exp{s}.N = 30;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = repmat([0:3:120]',1,Model.exp{s}.N);
    
    Model.exp{s}.ind_phi = [1:21];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(12);beta(14:17);beta(19);beta(21:22)]+[b(1);b(3:6);b(8);b(10:11)]; % CD95_0A FADD_0 p55_0 BID_0 PrERF1_0A PrNESF2_0A volume_0 tBID_tapt
        beta(23:24)];%s_GFP s_mCh
    num_measure = sum(~isnan(Data{3}.SCTL.Y));
    sigma_noise = [.001 .005 3 5 300];
    Model.exp{s}.sym.sigma_noise = sym(bsxfun(@rdivide, sigma_noise, sqrt(num_measure)));
    Model.exp{s}.sym.sigma_mean = [];
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.sym.sigma_time = sym([5]);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    Model.exp{s}.time_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_A(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'SCTL, C8, CD95-HeLa, L=5000ng/ml';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh,op_plot);
end

% Experiment 4
if ismember(4,S)
    s = s + 1;
    Model.exp{s}.N = 30;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = repmat([0:3:120]',1,Model.exp{s}.N);
    
    Model.exp{s}.ind_phi = [1:21];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(12);beta(14:17);beta(19);beta(21:22)]+[b(1);b(3:6);b(8);b(10:11)]; % CD95_0A FADD_0 p55_0 BID_0 PrERF1_0A PrNESF2_0A volume_0 tBID_tapt
        beta(23:24)];%s_GFP s_mCh
    num_measure = sum(~isnan(Data{4}.SCTL.Y));
    sigma_noise = [.001 .005 3 5 300];
    Model.exp{s}.sym.sigma_noise = sym(bsxfun(@rdivide, sigma_noise, sqrt(num_measure)));
    Model.exp{s}.sym.sigma_mean = [];
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.sym.sigma_time = sym([5]);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    Model.exp{s}.time_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_A(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'SCTL, C8, CD95-HeLa, L=10000ng/ml';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh,op_plot);
end

% Experiment 5
if ismember(5,S)
    s = s + 1;
    Model.exp{s}.N = 30;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = repmat([0:10:400]',1,Model.exp{s}.N);
    
    Model.exp{s}.ind_phi = [1:21];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(13:16);beta(18);beta(20:22)]+[b(2:5);b(7);b(9:11)]; % CD95_0H FADD_0 p55_0 BID_0 PrERF1_0H PrNESF2_0H volume_0 tBID_tapt
        beta(23:24)];%s_GFP s_mCh
    num_measure = sum(~isnan(Data{5}.SCTL.Y));
    sigma_noise = [.001 .005 3 5 300];
    Model.exp{s}.sym.sigma_noise = sym(bsxfun(@rdivide, sigma_noise, sqrt(num_measure)));
    Model.exp{s}.sym.sigma_mean = [];
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.sym.sigma_time = sym([5]);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    Model.exp{s}.time_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_H(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'SCTL, C8, wt HeLa, L=500ng/ml';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh,op_plot);
end

% Experiment 6
if ismember(6,S)
    s = s + 1;
    Model.exp{s}.N = 30;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = repmat([0:10:400]',1,Model.exp{s}.N);
    
    Model.exp{s}.ind_phi = [1:21];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(13:16);beta(18);beta(20:22)]+[b(2:5);b(7);b(9:11)]; % CD95_0H FADD_0 p55_0 BID_0 PrERF1_0H PrNESF2_0H volume_0 tBID_tapt
        beta(23:24)];%s_GFP s_mCh
    num_measure = sum(~isnan(Data{6}.SCTL.Y));
    sigma_noise = [.001 .005 3 5 300];
    Model.exp{s}.sym.sigma_noise = sym(bsxfun(@rdivide, sigma_noise, sqrt(num_measure)));
    Model.exp{s}.sym.sigma_mean = [];
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.sym.sigma_time = sym([5]);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    Model.exp{s}.time_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_H(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'SCTL, C8, wt HeLa, L=2000ng/ml';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh,op_plot);
end

% Experiment 7
if ismember(7,S)
    s = s + 1;
    Model.exp{s}.N = 30;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = repmat([0:15:600]',1,Model.exp{s}.N);
    
    Model.exp{s}.ind_phi = [1:21];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(13:16);beta(18);beta(20:22)]+[b(2:5);b(7);b(9:11)]; % CD95_0H FADD_0 p55_0 BID_0 PrERF1_0H PrNESF2_0H volume_0 tBID_tapt
        beta(23:24)];%s_GFP s_mCh
    num_measure = sum(~isnan(Data{7}.SCTL.Y));
    sigma_noise = [.001 .005 3 5 300];
    Model.exp{s}.sym.sigma_noise = sym(bsxfun(@rdivide, sigma_noise, sqrt(num_measure)));
    Model.exp{s}.sym.sigma_mean = [];
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.sym.sigma_time = sym([5]);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    Model.exp{s}.time_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_H(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'SCTL, C8, wt HeLa, L=5000ng/ml';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh,op_plot);
end

% Experiment 8
if ismember(8,S)
    s = s + 1;
    Model.exp{s}.N = 30;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = repmat([0:15:600]',1,Model.exp{s}.N);
    
    Model.exp{s}.ind_phi = [1:21];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(13:16);beta(18);beta(20:22)]+[b(2:5);b(7);b(9:11)]; % CD95_0H FADD_0 p55_0 BID_0 PrERF1_0H PrNESF2_0H volume_0 tBID_tapt
        beta(23:24)];%s_GFP s_mCh
    num_measure = sum(~isnan(Data{8}.SCTL.Y));
    sigma_noise = [.001 .005 3 5 300];
    Model.exp{s}.sym.sigma_noise = sym(bsxfun(@rdivide, sigma_noise, sqrt(num_measure)));
    Model.exp{s}.sym.sigma_mean = [];
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.sym.sigma_time = sym([5]);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    Model.exp{s}.time_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_H(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'SCTL, C8, wt HeLa, L=10000ng/ml';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh,op_plot);
end

% Experiment 9
if ismember(9,S)
    s = s + 1;
    Model.exp{s}.N = 100;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = [0 30 60 70 80]';
    Model.exp{s}.PA_post_processing= @(m_SP,dm_SP) PA_C8_post_processing(m_SP,dm_SP);
    Model.exp{s}.approx = 'samples';
    Model.exp{s}.samples = mvnrnd(zeros(7,1),eye(7),10000);
    
    Model.exp{s}.ind_phi = [1:18];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(12);beta(14:17);beta(19);beta(21)]+[b(1);b(3:6);b(8);b(10)]]; % CD95_0A FADD_0 p55_0 BID_0 PrERF1_0A PrNESF2_0A volume_0    
    Model.exp{s}.sym.sigma_noise = sym(0);
    Model.exp{s}.sym.sigma_mean = Model.exp{s}.sym.sigma_noise;
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.estimate_sigma = 0;
    Model.exp{s}.sym.sigma_time = sym.empty(0,1);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_A_PA(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'PA, C8, CD95-HeLa, L=50ng/ml';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotPA(Data,Sim,fh,op_plot);
    Model.exp{s}.scale = 'lin';
end

% Experiment 10
if ismember(10,S)
    s = s + 1;
    Model.exp{s}.N = 100;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = [0 20 30 40 50]';
    Model.exp{s}.PA_post_processing= @(m_SP,dm_SP) PA_C8_post_processing(m_SP,dm_SP);
    Model.exp{s}.approx = 'samples';
    
    Model.exp{s}.ind_phi = [1:18];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(12);beta(14:17);beta(19);beta(21)]+[b(1);b(3:6);b(8);b(10)]]; % CD95_0A FADD_0 p55_0 BID_0 PrERF1_0A PrNESF2_0A volume_0    
    Model.exp{s}.sym.sigma_noise = sym(0);
    Model.exp{s}.sym.sigma_mean = Model.exp{s}.sym.sigma_noise;
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.estimate_sigma = 0;
    Model.exp{s}.sym.sigma_time = sym.empty(0,1);
    Model.exp{s}.samples = mvnrnd(zeros(7,1),eye(7),10000);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_A_PA(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'PA, C8, CD95-HeLa, L=500ng/ml';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotPA(Data,Sim,fh,op_plot);
    Model.exp{s}.scale = 'lin';
end

% Experiment 11
if ismember(11,S)
    s = s + 1;
    Model.exp{s}.N = 100;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = 0;
    Model.exp{s}.PA_post_processing= @(m_SP,dm_SP) PAt0_C8_post_processing(m_SP,dm_SP);
    Model.exp{s}.approx = 'samples';
    Model.exp{s}.samples = mvnrnd(zeros(7,1),eye(7),10000);
    
    Model.exp{s}.ind_phi = [1:18];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(12);beta(14:17);beta(19);beta(21)]+[b(1);b(3:6);b(8);b(10)]]; % CD95_0A FADD_0 p55_0 BID_0 PrERF1_0A PrNESF2_0A volume_0    
    Model.exp{s}.sym.sigma_noise = sym(0);
    Model.exp{s}.sym.sigma_mean = Model.exp{s}.sym.sigma_noise;
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.estimate_sigma = 0;
    Model.exp{s}.sym.sigma_time = sym.empty(0,1);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_A_PAt0(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'PA quant., C8, CD95-HeLa';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotPAt0(Data,Sim,fh,op_plot);
    Model.exp{s}.scale = 'lin';
end

% Experiment 12
if ismember(12,S)
    s = s + 1;
    Model.exp{s}.N = 100;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = 0;
    Model.exp{s}.PA_post_processing= @(m_SP,dm_SP) PAt0_C8_post_processing(m_SP,dm_SP);
    Model.exp{s}.approx = 'samples';
    Model.exp{s}.samples = mvnrnd(zeros(7,1),eye(7),10000);
    
    Model.exp{s}.ind_phi = [1:18];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(13:16);beta(18);beta(20:21)]+[b(2:5);b(7);b(9:10)]]; % CD95_0H FADD_0 p55_0 BID_0 PrERF1_0H PrNESF2_0H volume_0
    Model.exp{s}.sym.sigma_noise = sym(0);
    Model.exp{s}.sym.sigma_mean = Model.exp{s}.sym.sigma_noise;
    Model.exp{s}.sym.sigma_cov = [];
    Model.exp{s}.estimate_sigma = 0;
    Model.exp{s}.sym.sigma_time = sym.empty(0,1);
    
    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';
    
    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_H_PAt0(t,phi,kappa,[],options);
    
    Model.exp{s}.title = 'PA quant., C8, wt HeLa';
    op_plot.title = Model.exp{s}.title;
    Model.exp{s}.plot = @(Data,Sim,fh) plotPAt0(Data,Sim,fh,op_plot);
    Model.exp{s}.scale = 'lin';
end

% Experiment 13
if ismember(13,S)
    s = s + 1;
    Model.exp{s}.N = 100;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = 0;
    Model.exp{s}.approx = 'samples';%%%
    Model.exp{s}.samples = mvnrnd(zeros(7,1),eye(7),10000);%%%

    Model.exp{s}.ind_phi = [1:18];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(12);beta(14:17);beta(19);beta(21)]+[b(1);b(3:6);b(8);b(10)]]; % CD95_0A FADD_0 p55_0 BID_0 PrERF1_0A PrNESF2_0A volume_0    
    Model.exp{s}.sym.sigma_noise = sym(0);%%%
    Model.exp{s}.sym.sigma_mean = sym(0);%%%
    Model.exp{s}.sym.sigma_cov = sym(0.008327088);
    Model.exp{s}.estimate_sigma = 1;
    Model.exp{s}.sym.sigma_time = sym.empty(0,1);%%%

    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.variance_noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';

    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_A_FACS(t,phi,kappa,[],options);

    Model.exp{s}.title = 'SCSH; C8, CD95-Hela';
    Model.exp{s}.plot = @(Data,Sim,fh) plotSCSH(Data,Sim,fh);
    Model.exp{s}.scale = 'lin';
end

% Experiment 14
if ismember(14,S)
    s = s + 1;
    Model.exp{s}.N = 100;
    Model.exp{s}.noise_on=0;
    Model.exp{s}.t = 0;
    Model.exp{s}.approx = 'samples';%%%
    Model.exp{s}.samples = mvnrnd(zeros(7,1),eye(7),10000);%%%

    Model.exp{s}.ind_phi = [1:18];
    Model.exp{s}.sym.phi = [beta(1:11); % KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
        [beta(13:16);beta(18);beta(20:21)]+[b(2:5);b(7);b(9:10)]]; % CD95_0H FADD_0 p55_0 BID_0 PrERF1_0H PrNESF2_0H volume_0
    Model.exp{s}.sym.sigma_noise = sym(0);%%%
    Model.exp{s}.sym.sigma_mean = sym(0);%%%
    Model.exp{s}.sym.sigma_cov = sym(0.008327088);
    Model.exp{s}.estimate_sigma = 1;
    Model.exp{s}.sym.sigma_time = sym.empty(0,1);%%%

    Model.exp{s}.noise_model = 'normal';
    Model.exp{s}.variance_noise_model = 'normal';
    Model.exp{s}.parameter_model = 'normal';

    Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_H_FACS(t,phi,kappa,[],options);

    Model.exp{s}.title = 'SCSH; C8, wt HeLa';
    Model.exp{s}.plot = @(Data,Sim,fh) plotSCSH(Data,Sim,fh);
    Model.exp{s}.scale = 'lin';
end

% Experiment 14
% if ismember(14,S)
%     s = s + 1;
%     Model.exp{s}.N = 100;
%     Model.exp{s}.noise_on=0;
%     Model.exp{s}.t = [0:8:80]';
%     
%     Model.exp{s}.ind_phi = [1:25];
%     Model.exp{s}.sym.phi = [beta(1:11);
%         beta(12:20)+[b(1); 0; b(3:end)];
%         beta(21:end)];
%     Model.exp{s}.sym.sigma = sym(1);
%     
%     Model.exp{s}.noise_model = 'normal';
%     Model.exp{s}.parameter_model = 'normal';
%     
%     Model.exp{s}.model = @(t,phi,kappa,options) simulate_model_C8S_A(t,phi,kappa,[],options);
%     
%     Model.exp{s}.title = 'SCTLstat, C8, CD95-HeLa, L=50ng/ml';
%     Model.exp{s}.plot = @(Data,Sim,fh) plotSCTLstat(Data,Sim,fh);
% end