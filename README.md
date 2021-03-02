
<!-- README.md is generated from README.Rmd. Please edit that file -->

# coauthors

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/Bisaloo/coauthors/workflows/R-CMD-check/badge.svg)](https://github.com/Bisaloo/coauthors/actions)
<!-- badges: end -->

## Installation

You can the latest version of this package from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("bisaloo/coauthors")
```

## Usage

``` r
library(coauthors)
```

You can get the list of co-authors for a given person (e.g., Hugo Gruson
here) by running:

``` r
get_coauthors("Hugo Gruson")
```

You can add an additional filter on your ORCiD. This is useful is the
person of interest has a lot of homonyms but it might result in the
omission of some co-authors if the ORCiD is absent from some
publications:

``` r
get_coauthors("Hugo Gruson", orcid = "0000-0002-4094-1476")
```
