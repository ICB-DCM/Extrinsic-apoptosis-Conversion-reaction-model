function [y, dydpar] = model_output_SP(par, Model, Data, is, optionmu)
    model_is = Model.exp{is};
    data_is = Data{is};
    time = data_is.PA.time;
    time_sim = 0:1:max(time)+5;
    model = @(phi) model_is.model(time_sim,phi,data_is.condition,optionmu);
    sol = model(par);
    y = sol.y;
    dydpar = sol.sy;
end
    