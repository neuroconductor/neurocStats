# neurocStats: Package that retrieves Neuroconductor stats
[![Travis build status](https://travis-ci.org/adigherman/neurocStats.svg?branch=master)](https://travis-ci.org/adigherman/neurocStats)
[![Build status](https://ci.appveyor.com/api/projects/status/1tjf5b78sd2osdlk?svg=true)](https://ci.appveyor.com/project/adigherman/neurocstats)
[![Coverage status](https://codecov.io/gh/adigherman/neurocStats/branch/master/graph/badge.svg)](https://codecov.io/github/adigherman/neurocStats?branch=master)

## Installing the neurocStats package

You can install `neurocStats` from github with:

``` {r}
# install.packages("devtools")
> devtools::install_github("adigherman/neurocStats")
```

## Listing all Neuroconductor packages

To get a full list of Neuroconductor packages, the function `get_package_list()` can be used:

``` {r}
> neuroconductor_packages <- get_package_list()
```

``` {r}
> head(neuroconductor_packages)
       name                                                                                   title      maintainer     type
1       aal                                               Automated Anatomical Labeling (AAL) Atlas  John Muschelli standard
2     afnir                          Wrapper Functions for AFNI (Analysis of FunctionalNeuroImages)  John Muschelli standard
3     ANTsR                                   ANTs in R: Quantification Tools for Biomedical Images Brian B. Avants standard
4 ANTsRCore                                                  Core Software Infrastructure for ANTsR Brian B. Avants standard
5   bftools                                                                        BioFormats Tools  John Muschelli standard
6 brainKCCA Region-level Connectivity Network Construction via KernelCanonical Correlation Analysis       Jian Kang standard
```

## Retrieve Neuroconductor package description

To get the DESCRIPTION file content for a specific Neuroconductor package we'll use the `get_package_description()` function:

``` {r}
> fslr_description <- get_package_description('fslr')
```

``` {r}
> fslr_details
Type: Package
Package: fslr
Title: Wrapper Functions for FSL ('FMRIB' Software Library) from
    Functional MRI of the Brain ('FMRIB')
Version: 2.17.3
Authors@R (parsed):
    * John Muschelli <muschellij2@gmail.com> [aut, cre]
Maintainer: John Muschelli <muschellij2@gmail.com>
Description: Wrapper functions that interface with 'FSL'
    <http://fsl.fmrib.ox.ac.uk/fsl/fslwiki/>, a powerful and commonly-used
    'neuroimaging' software, using system commands. The goal is to be able
    to interface with 'FSL' completely in R, where you pass R objects of
    class 'nifti', implemented by package 'oro.nifti', and the function
    executes an 'FSL' command and returns an R object of class 'nifti' if
    desired.
License: GPL-3
BugReports: https://github.com/muschellij2/fslr/issues
Depends:
    oro.nifti (>= 0.5.0),
    neurobase,
    R (>= 3.2.0)
Imports:
    methods,
    matrixStats,
    R.utils,
    graphics,
    grDevices,
    stats,
    utils
Suggests:
    knitr,
    rmarkdown,
    covr
VignetteBuilder: knitr
biocViews:
Encoding: UTF-8
Remotes:
    neuroconductor/oro.nifti@b2b5e408785973e074bdf2f520720a79c23b6ffa,
    neuroconductor/neurobase@a8c7908b98784ee2373508c5d4212659e7b90a9a
RoxygenNote: 6.0.1.9000
SystemRequirements: FSL
```

## Retrieve Neuroconductor package description

To get the full package details for a specific Neuroconductor package

``` {r}
> fslr_details <- get_package_details('fslr')
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
> Rxnat_downloads_verbose <- get_download_stats('Rxnat', verbose = TRUE)
> head(Rxnat_downloads_verbose)
   name package_version country os_type r_version   timestamp
1 Rxnat      0.0.0.9005      FR     src             2019-03-22 10:23:38
2 Rxnat      0.0.0.9005      FR     osx       3.5   2019-04-08 01:25:18
3 Rxnat      0.0.0.9005      FI     src             2019-04-26 07:41:12
4 Rxnat      0.0.0.9005      US     win       3.5   2019-04-26 13:36:29
5 Rxnat      0.0.0.9005      DE     osx       3.5   2019-04-26 17:32:54
6 Rxnat      0.0.0.9005      FR     osx       3.5   2019-06-02 00:13:34
```

## List available Neuroconductor releases

To get a list with all available Neuroconductor releases, we'll use the `list_releases()` function. 

``` {r}
> list_releases()
           release folder
1       releases/2017/nov
2       releases/2018/feb
3 releases/latest/current
4  releases/latest/stable
```

## Get release details

To get a comprehensive list of package details for a specific release we'll use the `get_release_details()` function.

``` {r}
> release_details <- get_release_details(year = "2017", month = "nov", os = "osx")
> head(release_details,1)
  Package Version                       Imports Suggests License                           MD5sum Depends LinkingTo Archs Enhances
1   afnir   0.4.4 methods, oro.nifti, neurobase     covr   GPL-2 389bac94bd7e8a677c946c2349ebd070    <NA>      <NA>  <NA>     <NA>
```
