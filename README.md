
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nio

<!-- badges: start -->
<!-- badges: end -->

## Installation

You can install the development version of nio from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("psadil/nio")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(nio)
to_tbl(system.file("extdata", "example_4d.nii.gz", package="RNifti")) 
```
