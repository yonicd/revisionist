[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

# revisionist

base `R` `install.packages` is a greedy version installer. This is great for working on the tip of the CRAN repository, but not great in an enterprise work environment, where packages and script need to work regardless of present CRAN status. 

`{revisionist}` populates a local src directory with conservative package version logic.

> Disclaimer: this is experimental, use deliberately and with caution.

## Installation

``` r
remotes::install_github('yonicd/revisionist')
```

## Details

The user supplies the target package and either: 

  - target package version, then the archiving date is located on [CRAN](https://cran.r-project.org/src/contrib/Archive)
  - target package upper limit archive date to from which to download the package
  
  `{revisionist}` then only downloads from [CRAN](https://cran.r-project.org/src/contrib/Archive) the relevant packages that meet the date constraints.
  
  A recursive routine is applied to each package, in which the src file is downloaded and the DESCRIPTION file is read, if a version constraint is defined in the packages listed in either the `Depends, Imports, Suggests` then it will supersede the target package upper bound date.
  
  