function Model = syn_conversion(Model,S)
    
    b  = Model.sym.b;
    beta = Model.sym.beta;
    
    s = 0;
%% SCTL
    % Experiment 1
    if ismember(1,S)
        s = s + 1;
        Model.exp{s}.N = 30;
        Model.exp{s}.noise_on=0;
        Model.exp{s}.t = repmat([0:0.4:3]',1,Model.exp{s}.N);
        
        Model.exp{s}.ind_phi = [1:4];
        Model.exp{s}.sym.phi = [[beta(1:2) + b(1:2)]; beta(3); beta(4) + b(3)];
        % for sigma, values around 10% of the observable values were chosen 
        Model.exp{s}.sym.sigma_noise = sym([0.06]);
        Model.exp{s}.sym.sigma_time = sym([0.06]);
        Model.exp{s}.sym.sigma_mean = [];
        Model.exp{s}.sym.sigma_cov = [];
        
        Model.exp{s}.noise_model = 'normal';
        Model.exp{s}.parameter_model = 'normal';
        Model.exp{s}.time_model = 'normal';
        
        Model.exp{s}.model = @(t,phi,kappa,options) simulate_conversion_SCTL(t,phi,kappa,[],options);
        
        Model.exp{s}.title = 'SCTL, toy_model, conversion';
        op_plot.title = Model.exp{s}.title;
        Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh);
    end
    
        % Experiment 2
    if ismember(2,S)
        s = s + 1;
        Model.exp{s}.N = 30;
        Model.exp{s}.noise_on=0;
        Model.exp{s}.t = repmat([0:0.4:3]',1,Model.exp{s}.N);
        
        Model.exp{s}.ind_phi = [1:4];
        Model.exp{s}.sym.phi = [[beta(1:2) + b(1:2)]; beta(3); beta(4) + b(3)];
        % for sigma, values around 10% of the observable values were chosen 
        Model.exp{s}.sym.sigma_noise = sym([0.06]);
        Model.exp{s}.sym.sigma_time = sym([0]);
        Model.exp{s}.sym.sigma_mean = [];
        Model.exp{s}.sym.sigma_cov = [];
        
        Model.exp{s}.noise_model = 'normal';
        Model.exp{s}.parameter_model = 'normal';
        Model.exp{s}.time_model = 'normal';
        
        Model.exp{s}.model = @(t,phi,kappa,options) simulate_conversion_SCTL(t,phi,kappa,[],options);
        
        Model.exp{s}.title = 'SCTL, toy_model, conversion';
        op_plot.title = Model.exp{s}.title;
        Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh);
    end
    
    % Experiment 3
    if ismember(3,S)
        s = s + 1;
        Model.exp{s}.N = 30;
        Model.exp{s}.noise_on=0;
        Model.exp{s}.t = repmat([0:0.2:3]',1,Model.exp{s}.N);
        
        Model.exp{s}.ind_phi = [1:4];
        Model.exp{s}.sym.phi = [[beta(1:2) + b(1:2)]; beta(3); beta(4) + b(3)];
        % for sigma, values around 10% of the observable values were chosen 
        Model.exp{s}.sym.sigma_noise = sym([0.06]);
        Model.exp{s}.sym.sigma_time = sym([0.06]);
        Model.exp{s}.sym.sigma_mean = [];
        Model.exp{s}.sym.sigma_cov = [];
        
        Model.exp{s}.noise_model = 'normal';
        Model.exp{s}.parameter_model = 'normal';
        Model.exp{s}.time_model = 'normal';
        
        Model.exp{s}.model = @(t,phi,kappa,options) simulate_conversion_SCTL(t,phi,kappa,[],options);
        
        Model.exp{s}.title = 'SCTL, toy_model, conversion';
        op_plot.title = Model.exp{s}.title;
        Model.exp{s}.plot = @(Data,Sim,fh) plotSCTL(Data,Sim,fh);
    end
        %% PA
    
    % Experiment 4
    if ismember(4,S)
        s = s + 1;
        Model.exp{s}.N = 100;
        Model.exp{s}.noise_on=0;
        Model.exp{s}.t = [0:0.4:3]';
        Model.exp{s}.SPapprox = 'samples';
        Model.exp{s}.samples = mvnrnd(zeros(2,1),eye(2),10000);
        
        Model.exp{s}.ind_phi = [1:2];
        Model.exp{s}.sym.phi = [beta(1:2) + b(1:2)];
        Model.exp{s}.sym.sigma_noise = sym(0.06);
        Model.exp{s}.sym.sigma_mean = sym(0.03);
        Model.exp{s}.sym.sigma_cov = [];
        Model.exp{s}.estimate_sigma = 0;
        Model.exp{s}.sym.sigma_time = sym.empty(0,1);

        Model.exp{s}.noise_model = 'normal';
        Model.exp{s}.parameter_model = 'normal';
        
        Model.exp{s}.model = @(t,phi,kappa,options) simulate_conversion_PA(t,phi,kappa,[],options);
        
        Model.exp{s}.title = 'PA, toy_model, conversion';
        op_plot.title = Model.exp{s}.title;
        Model.exp{s}.plot = @(Data,Sim,fh) plotPA(Data,Sim,fh,op_plot);
        Model.exp{s}.scale = 'lin';
    end
    
    % Experiment 5
    if ismember(5,S)
        s = s + 1;
        Model.exp{s}.N = 100;
        Model.exp{s}.noise_on=0;
        Model.exp{s}.t = [0:0.2:3]';
        Model.exp{s}.SPapprox = 'samples';
        Model.exp{s}.samples = mvnrnd(zeros(2,1),eye(2),10000);
        
        Model.exp{s}.ind_phi = [1:2];
        Model.exp{s}.sym.phi = [beta(1:2) + b(1:2)];
        Model.exp{s}.sym.sigma_noise = sym(0.06);
        Model.exp{s}.sym.sigma_mean = sym(0.03);
        Model.exp{s}.sym.sigma_cov = [];
        Model.exp{s}.estimate_sigma = 0;
        Model.exp{s}.sym.sigma_time = sym.empty(0,1);

        Model.exp{s}.noise_model = 'normal';
        Model.exp{s}.parameter_model = 'normal';
        
        Model.exp{s}.model = @(t,phi,kappa,options) simulate_conversion_PA(t,phi,kappa,[],options);
        
        Model.exp{s}.title = 'PA, toy_model, conversion';
        op_plot.title = Model.exp{s}.title;
        Model.exp{s}.plot = @(Data,Sim,fh) plotPA(Data,Sim,fh,op_plot);
        Model.exp{s}.scale = 'lin';
    end
    
    % Experiment 6
    if ismember(6,S)
        s = s + 1;
        Model.exp{s}.N = 100;
        Model.exp{s}.noise_on=0;
        Model.exp{s}.t = 0;
        Model.exp{s}.SPapprox = 'samples';
        Model.exp{s}.samples = mvnrnd(zeros(2,1),eye(2),10000);
        
        Model.exp{s}.ind_phi = [1:2];
        Model.exp{s}.sym.phi = [beta(1:2) + b(1:2)];
        Model.exp{s}.sym.sigma_noise = sym(0.06);
        Model.exp{s}.sym.sigma_mean = sym(0.03);
        Model.exp{s}.sym.sigma_cov = [];
        Model.exp{s}.estimate_sigma = 0;
        Model.exp{s}.sym.sigma_time = sym.empty(0,1);

        Model.exp{s}.noise_model = 'normal';
        Model.exp{s}.parameter_model = 'normal';
        
        Model.exp{s}.model = @(t,phi,kappa,options) simulate_conversion_PA(t,phi,kappa,[],options);
        
        Model.exp{s}.title = 'PA, toy_model, conversion';
        op_plot.title = Model.exp{s}.title;
        Model.exp{s}.plot = @(Data,Sim,fh) plotPA(Data,Sim,fh,op_plot);
        Model.exp{s}.scale = 'lin';
    end

       %% SCSH 
    % Experiment 7
    if ismember(7,S)
        s = s + 1;
        Model.exp{s}.N = 100;
        Model.exp{s}.noise_on=0;
        Model.exp{s}.t = [0:0.4:3]';
        Model.exp{s}.approx = 'samples';%%%
        Model.exp{s}.samples = mvnrnd(zeros(2,1),eye(2),10000);%%%
        
        Model.exp{s}.ind_phi = [1:2];
        Model.exp{s}.sym.phi = [beta(1:2) + b(1:2)];
        Model.exp{s}.sym.sigma_noise = sym(0.06);
        Model.exp{s}.sym.sigma_mean = sym(0);%%%
        Model.exp{s}.sym.sigma_cov = sym(0.001);
        Model.exp{s}.estimate_sigma = 1;
        Model.exp{s}.sym.sigma_time = sym.empty(0,1);
        
        Model.exp{s}.noise_model = 'normal';
        Model.exp{s}.variance_noise_model = 'normal';
        Model.exp{s}.parameter_model = 'normal';
        
        Model.exp{s}.model = @(t,phi,kappa,options) simulate_conversion_PA(t,phi,kappa,[],options);
        
        Model.exp{s}.title = 'SCSH; toy_model, conversion';
        Model.exp{s}.plot = @(Data,Sim,fh) plotSCSH(Data,Sim,fh);
        Model.exp{s}.scale = 'lin';
    end
    
    % Experiment 8
    if ismember(8,S)
        s = s + 1;
        Model.exp{s}.N = 100;
        Model.exp{s}.noise_on=0;
        Model.exp{s}.t = [0:0.2:3]';
        Model.exp{s}.approx = 'samples';%%%
        Model.exp{s}.samples = mvnrnd(zeros(2,1),eye(2),10000);%%%
        
        Model.exp{s}.ind_phi = [1:2];
        Model.exp{s}.sym.phi = [beta(1:2) + b(1:2)];
        Model.exp{s}.sym.sigma_noise = sym(0.06);
        Model.exp{s}.sym.sigma_mean = sym(0);%%%
        Model.exp{s}.sym.sigma_cov = sym(0.001);
        Model.exp{s}.estimate_sigma = 1;
        Model.exp{s}.sym.sigma_time = sym.empty(0,1);
        
        Model.exp{s}.noise_model = 'normal';
        Model.exp{s}.variance_noise_model = 'normal';
        Model.exp{s}.parameter_model = 'normal';
        
        Model.exp{s}.model = @(t,phi,kappa,options) simulate_conversion_PA(t,phi,kappa,[],options);
        
        Model.exp{s}.title = 'SCSH; toy_model, conversion';
        Model.exp{s}.plot = @(Data,Sim,fh) plotSCSH(Data,Sim,fh);
        Model.exp{s}.scale = 'lin';
    end
    
    % Experiment 9
    if ismember(9,S)
        s = s + 1;
        Model.exp{s}.N = 100;
        Model.exp{s}.noise_on=0;
        Model.exp{s}.t = 0;
        Model.exp{s}.approx = 'samples';%%%
        Model.exp{s}.samples = mvnrnd(zeros(2,1),eye(2),10000);%%%
        
        Model.exp{s}.ind_phi = [1:2];
        Model.exp{s}.sym.phi = beta(1:2)+b(1:2);
        Model.exp{s}.sym.sigma_noise = sym(0.06);
        Model.exp{s}.sym.sigma_mean = sym(0);%%%
        Model.exp{s}.sym.sigma_cov = sym(0.001);
        Model.exp{s}.estimate_sigma = 1;
        Model.exp{s}.sym.sigma_time = sym.empty(0,1);
        
        Model.exp{s}.noise_model = 'normal';
        Model.exp{s}.variance_noise_model = 'normal';
        Model.exp{s}.parameter_model = 'normal';
        
        Model.exp{s}.model = @(t,phi,kappa,options) simulate_conversion_PA(t,phi,kappa,[],options);
        
        Model.exp{s}.title = 'SCSH; toy_model, conversion';
        Model.exp{s}.plot = @(Data,Sim,fh) plotSCSH(Data,Sim,fh);
        Model.exp{s}.scale = 'lin';
    end