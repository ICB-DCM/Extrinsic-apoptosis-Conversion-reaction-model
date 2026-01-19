function [model] = model_caspase8_syms()
    
    model.param = 'log';
    
    %% STATES
    syms CD95act FADD DISC p55 DISCp55 p30 p43 p18 p18i BID tBID PrERF1 PrER PrNESF2 PrNES
    x = [CD95act FADD DISC p55 DISCp55 p30 p43 p18 p18i BID tBID PrERF1 PrER PrNESF2 PrNES];
    
    %% PARAMETERS
    syms KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8
    syms CD95_0A CD95_0H FADD_0 p55_0 BID_0 PrERF1_0 PrNESF2_0 volume_0 tBID_tapt
    syms s_GFP s_mCh CD95L
    % syms s_GFP s_mCh s_FC8 s_FB CD95L
    % optimized parameters
    p = [KDR KDL kon_FADD koff_FADD kon_p55 kpd_cis ked_tr_p55 ked_tr_p43 kp18i kBID kprobes_s_C8...
        CD95_0A FADD_0 p55_0 BID_0 PrERF1_0 PrNESF2_0 volume_0 tBID_tapt...
        s_GFP s_mCh];
    % fixed parameters
    k = [CD95L];
    
    %% INPUT
    u = sym.empty(0,0);
    
    %% SYSTEM EQUATIONS
    xdot = sym(zeros(size(x)));
    % DISC assembly
    xdot(1) = 0;%CD95act
    xdot(2) = - kon_FADD*CD95act*FADD + koff_FADD*DISC;%FADD
    xdot(3) = kon_FADD*CD95act*FADD - koff_FADD*DISC -kon_p55*DISC*p55 + kpd_cis*p43 + ked_tr_p55*(DISCp55+p30)*p30 + ked_tr_p43*p43*p30;%DISC
    xdot(4) = -kon_p55*DISC*p55;%p55
    % caspase-8 cleavage
    xdot(5) = kon_p55*DISC*p55 - kpd_cis*DISCp55 - ked_tr_p55*(DISCp55+p30)*DISCp55 - ked_tr_p43*p43*DISCp55;%DISCp55
    xdot(6) = kpd_cis*DISCp55 - ked_tr_p55*(DISCp55+p30)*p30 - ked_tr_p43*p43*p30;%p30
    xdot(7) = ked_tr_p55*(DISCp55+p30)*DISCp55 + ked_tr_p43*p43*DISCp55 - kpd_cis*p43;%p43
    xdot(8) = kpd_cis*p43 + ked_tr_p55*(DISCp55+p30)*p30 + ked_tr_p43*p43*p30 - kp18i*p18;%p18
    xdot(9) = kp18i*p18;%p18i
    % BID and probe cleavage
    xdot(10) = -kBID*(p43 + p18)*BID;%BID
    xdot(11) = kBID*(p43 + p18)*BID;%tBID
    xdot(12) = -kprobes_s_C8*p18*PrERF1;%PrERmGFP
    xdot(13) = kprobes_s_C8*p18*PrERF1;%PrER
    xdot(14) = -kprobes_s_C8*(p18+p43)*PrNESF2;%PrNESmCh
    xdot(15) = kprobes_s_C8*(p18+p43)*PrNESF2;%PrNES
    %% INITIAL CONDITIONS
    x0 = sym(zeros(15,1));
    x0(1) = KDL^2*CD95L*CD95_0A^3/((CD95L+KDL)*(KDL^2*CD95_0A^2+KDR*CD95L^2+2*KDR*KDL*CD95L+KDR*KDL^2));
    x0(2) = FADD_0;
    x0(4) = p55_0;
    x0(10) = BID_0;
    x0(12) = PrERF1_0;
    x0(14) = PrNESF2_0;
    %% OBSERVABLES
    y = sym(zeros(6,1));
    % single cell
    y(1) = kprobes_s_C8*p18;
    y(2) = kprobes_s_C8*p43;
    y(3) = s_GFP*PrERF1;
    y(4) = s_mCh*PrNESF2;
    y(5) = volume_0;
    y(6) = tBID-BID_0*tBID_tapt;
    
    %% EVENTS
    syms t
    model.event(1) = amievent(tBID-BID_0*tBID_tapt,0,t);
    
    %% SYSTEM STRUCT
    model.sym.x = x;
    model.sym.u = u;
    model.sym.xdot = xdot;
    model.sym.p = p;
    model.sym.k = k;
    model.sym.x0 = x0;
    model.sym.y = y;
end