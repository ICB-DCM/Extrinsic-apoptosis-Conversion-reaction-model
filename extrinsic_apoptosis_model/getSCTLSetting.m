function [data_idata, P] = getSCTLSetting(data_idata, Data, par, model_idata)
for s = 1:length(Data)
    P{s}.n_store = 0;
    P{s}.xi = zeros(size(par));
    if isfield(Data{s},'SCTL')
        P{s}.SCTL.bhat = zeros(length(model_idata.ind_b),size(Data{s}.SCTL.Y,3));
        P{s}.SCTL.dbdxi = zeros(length(model_idata.ind_b),length(par),size(Data{s}.SCTL.Y,3));
    end
end

tmp = arrayfun(@(x) any(~isnan(data_idata.SCTL.Y(:,:,x)),2),1:size(data_idata.SCTL.Y,3),'UniformOutput',false);
data_idata.SCTL.ind_y = false(size(data_idata.SCTL.Y,1),size(data_idata.SCTL.Y,3));
data_idata.SCTL.ind_y(:,:) = [tmp{:}];
tmp = arrayfun(@(x) any(~isnan(data_idata.SCTL.T(:,:,x)),2),1:size(data_idata.SCTL.T,3),'UniformOutput',false);
data_idata.SCTL.ind_t = false(size(data_idata.SCTL.T,1),size(data_idata.SCTL.T,3));
data_idata.SCTL.ind_t(:,:) = [tmp{:}];
end