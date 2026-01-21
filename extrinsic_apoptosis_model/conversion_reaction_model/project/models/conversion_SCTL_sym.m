function [model] = conversion_SCTL_sym()
    
    model.param = 'log';
    
    %% STATES
    syms x1 x2
    x = [x1 x2];
    
    %% PARAMETERS
    syms theta1 theta2 scaling x2_cut

    % optimized parameters
    p = [theta1 theta2 scaling x2_cut];
    
    %% INPUT
    u = sym.empty(0,0);
    
    %% SYSTEM EQUATIONS
    xdot = sym(zeros(size(x)));
    % DISC assembly
    xdot(1) = theta2 * x2 - theta1 * x1;%x1
    xdot(2) = theta1 * x1 - theta2 * x2;%x2
    %% INITIAL CONDITIONS
    x0 = sym(zeros(2, 1));
    x0(1) = theta1 / (theta1 + theta2);
    x0(2) = theta2 / (theta1 + theta2);
    %% OBSERVABLES
    y = sym(zeros(1,1));
    % single cell
    y(1) = scaling * x2;
    %% EVENTS
    syms t
    model.event(1) = amievent(scaling * x2-(theta1 / (theta1 + theta2)) * x2_cut,0,t);      
    %% SYSTEM STRUCT
    model.sym.x = x;
    model.sym.u = u;
    model.sym.xdot = xdot;
    model.sym.p = p;
    model.sym.x0 = x0;
    model.sym.y = y;
end