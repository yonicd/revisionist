
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

> Disclaimer: this is experimental, use deliberately and with caution.

# revisionist

base `R` `install.packages` is a greedy version installer. This is great
for working on the tip of the CRAN repository, but not great in an
enterprise work environment, where packages and script need to work
regardless of present CRAN status.

`{revisionist}` populates a local src directory with conservative
package version logic.

## Installation

``` r
remotes::install_github('yonicd/revisionist')
```

## Usage

``` r
x <- revisionist::build_map('slickR','0.1.0')
knitr::kable(x)
```

| date       | parent      | parent\_version | child       | child\_version |
| :--------- | :---------- | :-------------- | :---------- | :------------- |
| 2017-04-01 | slickR      | 0.1.0           | htmlwidgets | NA             |
| 2017-04-01 | slickR      | 0.1.0           | tools       | NA             |
| 2017-04-01 | slickR      | 0.1.0           | utils       | NA             |
| 2017-04-01 | slickR      | 0.1.0           | base64enc   | NA             |
| 2017-04-01 | slickR      | 0.1.0           | xml2        | NA             |
| 2016-11-09 | htmlwidgets | 0.8             | htmltools   | 0.3            |
| 2016-11-09 | htmlwidgets | 0.8             | jsonlite    | 0.9.16         |
| 2016-11-09 | htmlwidgets | 0.8             | yaml        | NA             |
| 2017-01-24 | xml2        | 1.1.1           | Rcpp        | NA             |
| 2015-12-29 | htmltools   | 0.3             | utils       | NA             |
| 2015-12-29 | htmltools   | 0.3             | digest      | NA             |
| 2014-03-26 | jsonlite    | 0.9.16          | methods     | NA             |
| 2017-03-19 | Rcpp        | 0.12.10         | methods     | NA             |
| 2017-03-19 | Rcpp        | 0.12.10         | utils       | NA             |

``` r
knitr::kable(revisionist::prune_map(x))
```

| date       | package     | version |
| :--------- | :---------- | :------ |
| 2017-04-01 | slickR      | 0.1.0   |
| 2016-11-09 | htmlwidgets | 0.8     |
| 2017-01-24 | xml2        | 1.1.1   |
| 2015-12-29 | htmltools   | 0.3     |
| 2014-03-26 | jsonlite    | 0.9.16  |
| 2017-03-19 | Rcpp        | 0.12.10 |

## Details

The user supplies the target package and either:

  - target package version, then the archiving date is located on
    [CRAN](https://cran.r-project.org/src/contrib/Archive)
  - target package upper limit archive date to from which to download
    the package

`{revisionist}` then uses github api to find what package version are
needed under the constraints defined.
