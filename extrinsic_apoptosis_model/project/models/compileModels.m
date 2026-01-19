[exdir,~,~]=fileparts(which('compileModels.m'));

% addpath(genpath('../../../matlab_toolbox/AMICI'))

amiwrap('model_C8S_A','model_C8S_A_syms',pwd,true)
amiwrap('model_C8S_A_PA','model_C8S_A_PA_syms',pwd,true)
amiwrap('model_C8S_A_PAt0','model_C8S_A_PAt0_syms',pwd,true)
amiwrap('model_C8S_A_FACS','model_C8S_A_FACS_syms',pwd,true)
amiwrap('model_C8S_H','model_C8S_H_syms',pwd,true)
amiwrap('model_C8S_H_PAt0','model_C8S_H_PAt0_syms',pwd,true)
amiwrap('model_C8S_H_FACS','model_C8S_H_FACS_syms',pwd,true)
