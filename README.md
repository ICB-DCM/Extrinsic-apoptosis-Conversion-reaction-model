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

For reproducing codes in the manuscript, you would first need to add the toolboxes to the MATLAB search path:
```shell
addpath(genpath('./toolboxes/AMICI'))
addpath(genpath('./toolboxes/MEMOIR'))
addpath(genpath('./toolboxes/PESTO'))
addpath(genpath('./toolboxes/SPToolbox'))
```


### Reproducing the manuscript results

### Input description

### Output description

### Troubleshooting

### License

Distributed under the [MIT](https://opensource.org/licenses/MIT) License. See `LICENSE` file for more information.

### How to cite

Relaste zenodo repository:  https://doi.org/10.5281/zenodo.18028185