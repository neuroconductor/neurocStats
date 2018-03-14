# neurocStats: Package that retrieves Neuroconductor stats
[![Travis build status](https://travis-ci.org/adigherman/neurocStats.svg?branch=master)](https://travis-ci.org/adigherman/neurocStats)
[![Build status](https://ci.appveyor.com/api/projects/status/1tjf5b78sd2osdlk?svg=true)](https://ci.appveyor.com/project/adigherman/neurocstats)
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

## Get download statistics

The get download statistics we can use the `get_download_stats()` function. The function accepts the following parameters: `package` indicating the name of the package for which we need download counts. If `package` is missing or NULL, the download counts for all Neuroconductor packages are returned. The second argument is `verbose` which will provide a compact result (when `verbose` is missing / FALSE) (total number of downloads) versus a detailed list of downloads that will include the package name, version, type of download (for which platform), country from where the download was initiated and the timestamp for the request.

``` {r}
> total_downloads <- get_download_stats()
> head(total_downloads)
    package downloads
1     afnir         7
2     ANTsR        80
3 ANTsRCore        75
4    brainR         3
5     cifti       112
6  dcemriS4         3
```

``` {r}
> afnir_downloads_verbose <- get_download_stats('afnir', verbose = TRUE)
> head(afnir_downloads_verbose)
  package version country OS.type           timestamp
1   afnir   0.4.4      US     osx 2017-12-05 13:52:57
2   afnir   0.4.4      US     src 2017-12-08 18:59:25
3   afnir   0.4.4      US     src 2017-12-08 19:07:35
4   afnir   0.4.4      US     src 2018-01-27 16:57:05
5   afnir   0.4.4      US     src 2018-01-28 22:22:40
6   afnir   0.4.4      US     src 2018-01-29 13:18:00
```
