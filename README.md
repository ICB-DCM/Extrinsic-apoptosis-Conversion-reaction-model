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
|   check_gradient.m, This is a function to compute the gradient use both analytical and finite difference methods
|   generateDataFiles.m
|   generateModelFiles.m, This is a function generates the 'SynModel.mat' file, which contains the information of the model used in MEMOIR.
|   generate_artificial_PAdata.m
|   generate_artificial_SCTLdata.m
|   generate_SPcomparison.m, This is a function compute the difference between approximated PA and SCSH and the 'true values'.
|   generate_SP_approximation.m, This is a function generates the approximation of PA and SCSH data using SP method and sampling methods with different sample sizes.
|   getPlotSetting.m, This is an auxiliary function to load models, data and parameters, which is used in many of other functions.
|   gradient_computation_time.m, This is a function to generate the computation time of gradient.
|   optimize_conversion.m, This is the main function used for parameter estimation using the joint likelihood.
|   PA_syn.mat
|   SCTL_syn.mat
|   SynData.mat, This contains the data used for parameter estimation.
|   SynModel.mat, This contains information of the model. It can be generated using 'generateModelFiles.m'.
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
|   check_gradient.m, This is a function to compute the gradient use both analytical and finite difference methods
|   ExpData.mat, This contains the data used for parameter estimation.
|   ExpModel.mat, This contains information of the model. It can be generated using 'generateModelFiles.m'.
|   generateModelFiles.m, This is a function generates the 'ExpModel.mat' file, which contains the information of the model used in MEMOIR.
|   generate_SPcomparison.m, This is a function compute the difference between approximated PA and SCSH and the 'true values'.
|   generate_SP_approximation.m, This is a function generates the approximation of PA and SCSH data using SP method and sampling methods with different sample sizes.
|   getHessianOpt.m, This is a function to compute the Hessian using the estimated parameters.
|   getPlotSetting.m, This is an auxiliary function to load models, data and parameters, which is used in many of other functions.
|   getSCTLSetting.m, Same as 'getPlotSetting.m'
|   getSingleCellPar.m, This is a function to compute the single cell parameters for SCTL data.
|   gradient_computation_time.m, This is a function to generate the computation time of gradient.
|   inner_optimization.m, This is a function to estimate single cell parameters in the inner optimization part.
|   model_output_SP.m, This is an auxiliary function used when approximate the PA and SCSH data using SP and sampling methods with differen sample sizes.
|   optimize_C8S.m, This is the main function used for parameter estimation using the joint likelihood.
|   PAt0_C8_post_processing.m, This is the function used for PAt0 data post processing.
|   PA_C8_post_processing.m, This is the function used for PA data post processing.
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