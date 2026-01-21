# Extrinsic apoptosis & Conversion reaction model

This repository provides the reproducible code accompanying the manuscript "Nonlinear Mixed-Effect Models and Tailored Parameterization Schemes Enable Integration of Single-Cell and Bulk Data," encompassing both the extrinsic apoptosis and conversion reaction models.

<img src="./img/conception.png"  />

### Requirements
MATLAB version tested : R2017a and R2017b
Required MathWorks toolboxes: Optimization, Statistics

### Dependencies

The reproducible code depends on MATLAB toolboxes, which you can find in the folder "./toolboxes":
* **AMICI:** MATLAB and C++ interface for the SUNDIALS solvers CVODES (for ordinary differential equations) and IDAS (for algebraic differential equations).
* **MEMOIR:** MATLAB toolbox for Mixed Effect Model InfeRence.
* **PESTO:** Parameter EStimation TOolbox.
* **SPToolbox:** MATLAB toolbox allows for different Dirac mixture distribution methods to approximate Gaussian distributions.

### Setup

You can either clone the Extrinsic-apoptosis-Conversion-reaction-model repository via git clone git@github.com:ICB-DCM/Extrinsic-apoptosis-Conversion-reaction-model.git, or download the repository. 

Add the toolboxes to the MATLAB search path:
```shell
addpath(genpath('./toolboxes/AMICI'))
addpath(genpath('./toolboxes/MEMOIR'))
addpath(genpath('./toolboxes/PESTO'))
addpath(genpath('./toolboxes/SPToolbox'))
```

### Project structure

conversion_reaction_model

|   check_gradient.m

|   generateDataFiles.m

|   generateModelFiles.m

|   generate_artificial_PAdata.m

|   generate_artificial_SCTLdata.m

|   generate_SPcomparison.m

|   generate_SP_approximation.m

|   getPlotSetting.m

|   gradient_computation_time.m

|   optimize_conversion.m

|   PA_syn.mat

|   SCTL_syn.mat

|   SynData.mat

|   

+---check_gradient

+---project

|   |   model_conversion.m

|   |   syn_conversion.m

|   |   

|   \---models

|           compileModels.m

|           conversion_PA_sym.m

|           conversion_SCTL_sym.m

|           

\---singleCellParameters

extrinsic_apoptosis_model

|   check_gradient.m

|   ExpData.mat

|   ExpModel.mat

|   generateModelFiles.m

|   generate_SPcomparison.m

|   generate_SP_approximation.m

|   getHessianOpt.m

|   getPlotSetting.m

|   getSCTLSetting.m

|   getSingleCellPar.m

|   gradient_computation_time.m

|   inner_optimization.m

|   model_output_SP.m

|   optimize_C8S.m

|   PAt0_C8_post_processing.m

|   PA_C8_post_processing.m

|   

+---check_gradient

+---project

|   |   experiments_caspase8.m

|   |   model_caspase8_diag.m

|   |   

|   \---models

|           compileModels.m

|           model_C8S_A_FACS_syms.m

|           model_C8S_A_PAt0_syms.m

|           model_C8S_A_PA_syms.m

|           model_C8S_A_syms.m

|           model_C8S_H_FACS_syms.m

|           model_C8S_H_PAt0_syms.m

|           model_C8S_H_syms.m

|           

\---singleCellParameters

toolboxes

+---AMICI

+---MEMOIR

+---PESTO

+---SPToolbox


### Reproducing the manuscript results
**Reproducing parameter estimation**

**Reproducing result analysis only**


### Input description

### Output description

### Troubleshooting

### License

Distributed under the [MIT](https://opensource.org/licenses/MIT) License. See `LICENSE` file for more information.

### How to cite

Related zenodo repository:  https://doi.org/10.5281/zenodo.18028185