
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
to_tbl(system.file("extdata", "example_4d.nii.gz", package="RNifti")) |>
  print()
#> # A tibble: 1,658,880 × 5
#>        x     y     z     t value
#>    <int> <int> <int> <int> <int>
#>  1     1     1     1     1     1
#>  2     2     1     1     1     2
#>  3     3     1     1     1     3
#>  4     4     1     1     1     4
#>  5     5     1     1     1     5
#>  6     6     1     1     1     6
#>  7     7     1     1     1     7
#>  8     8     1     1     1     8
#>  9     9     1     1     1     9
#> 10    10     1     1     1    10
#> # … with 1,658,870 more rows
```
