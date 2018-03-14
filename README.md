# neurocStats: Package that retrieves Neuroconductor stats
[![Travis build status](https://travis-ci.org/adigherman/neurocStats.svg?branch=master)](https://travis-ci.org/adigherman/neurocStats)
[![AppVeyor Build Status](https://ci.appveyor.com/adigherman/neurocStats)](https://ci.appveyor.com/api/projects/status/github//adigherman/neurocStats/?branch=master&svg=true)
[![Coverage status](https://codecov.io/gh/adigherman/neurocStats/branch/master/graph/badge.svg)](https://codecov.io/github/adigherman/neurocStats?branch=master)

## Installing the neurocStats package

You can install `neurocStats` from github with:

``` {r}
# install.packages("devtools")
devtools::install_github("adigherman/neurocStats")
```

## Listing all Neuroconductor packages

To get a full list of Neuroconductor packages, the function `get_package_list()` can be used:

``` {r}
neuroconductor_packages <- get_package_list()
```

``` {r}
> head(neuroconductor_packages)
       name                                                                            title
1     afnir             Wrapper Functions for 'AFNI' (Analysis of Functional 'NeuroImages') 
2     ANTsR                           ANTs in R: Quantification Tools for Biomedical Images 
3 ANTsRCore                                          Core Software Infrastructure for ANTsR 
4    brainR               Helper Functions to 'misc3d' and 'rgl' Packages for Brain Imaging 
5     cifti Toolbox for Connectivity Informatics Technology Initiative ('CIFTI')      Files 
6  dcemriS4                     A Package for Image Analysis of DCE-MRI (S4 Implementation) 
```

## Retrieve Neuroconductor package details

To get a the details for a specific Neuroconductor package we'll use the `get_package_details()` function:

``` {r}
fslr_details <- get_package_details('fslr')
```

``` {r}
> fslr_details
$name
[1] "fslr"

$title
[1] "Wrapper Functions for FSL ('FMRIB' Software Library) from Functional MRI     of the Brain ('FMRIB') "

$description
[1] "Wrapper functions that interface with 'FSL'      , a powerful and commonly-used 'neuroimaging'     software, using system commands. The goal is to be able to interface with 'FSL'     completely in R, where you pass R objects of class 'nifti', implemented by     package 'oro.nifti', and the function executes an 'FSL' command and returns an R     object of class 'nifti' if desired. "

$submitted_on
[1] "9:19am on Sunday 8th October 2017"

$authors
[1] "John Muschelli"

$maintainer
[1] "John Muschelli"
```

