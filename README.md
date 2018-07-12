
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

| date       | parent      | parent\_version | parent\_sha                              | child       | child\_version |
| :--------- | :---------- | :-------------- | :--------------------------------------- | :---------- | :------------- |
| 2017-04-01 | slickR      | 0.1.0           | 59fbc8bc3ad5bb70cbff309fcc502271d79d40ab | htmlwidgets | NA             |
| 2017-04-01 | slickR      | 0.1.0           | 59fbc8bc3ad5bb70cbff309fcc502271d79d40ab | tools       | NA             |
| 2017-04-01 | slickR      | 0.1.0           | 59fbc8bc3ad5bb70cbff309fcc502271d79d40ab | utils       | NA             |
| 2017-04-01 | slickR      | 0.1.0           | 59fbc8bc3ad5bb70cbff309fcc502271d79d40ab | base64enc   | NA             |
| 2017-04-01 | slickR      | 0.1.0           | 59fbc8bc3ad5bb70cbff309fcc502271d79d40ab | xml2        | NA             |
| 2017-04-01 | slickR      | 0.1.0           | 59fbc8bc3ad5bb70cbff309fcc502271d79d40ab | shiny       | NA             |
| 2017-04-01 | slickR      | 0.1.0           | 59fbc8bc3ad5bb70cbff309fcc502271d79d40ab | rmarkdown   | NA             |
| 2016-11-09 | htmlwidgets | 0.8             | a94e6dc3db952d2e3b600e55e866ee9300b37519 | htmltools   | 0.3            |
| 2016-11-09 | htmlwidgets | 0.8             | a94e6dc3db952d2e3b600e55e866ee9300b37519 | jsonlite    | 0.9.16         |
| 2016-11-09 | htmlwidgets | 0.8             | a94e6dc3db952d2e3b600e55e866ee9300b37519 | yaml        | NA             |
| 2017-01-24 | xml2        | 1.1.1           | 68d9ee9cf7d9e6e136355fb1b3fb4bf4cce94bb7 | Rcpp        | NA             |
| 2017-04-01 | shiny       | 1.0.1           | d277717979385d8036218970833775f28eadc933 | methods     | NA             |
| 2017-04-01 | shiny       | 1.0.1           | d277717979385d8036218970833775f28eadc933 | utils       | NA             |
| 2017-04-01 | shiny       | 1.0.1           | d277717979385d8036218970833775f28eadc933 | httpuv      | 1.3.3          |
| 2017-04-01 | shiny       | 1.0.1           | d277717979385d8036218970833775f28eadc933 | mime        | 0.3            |
| 2017-04-01 | shiny       | 1.0.1           | d277717979385d8036218970833775f28eadc933 | jsonlite    | 0.9.16         |
| 2017-04-01 | shiny       | 1.0.1           | d277717979385d8036218970833775f28eadc933 | xtable      | NA             |
| 2017-04-01 | shiny       | 1.0.1           | d277717979385d8036218970833775f28eadc933 | digest      | NA             |
| 2017-04-01 | shiny       | 1.0.1           | d277717979385d8036218970833775f28eadc933 | htmltools   | 0.3.5          |
| 2017-04-01 | shiny       | 1.0.1           | d277717979385d8036218970833775f28eadc933 | R6          | 2.0            |
| 2017-04-01 | shiny       | 1.0.1           | d277717979385d8036218970833775f28eadc933 | sourcetools | NA             |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | tools       | NA             |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | utils       | NA             |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | knitr       | 1.14           |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | yaml        | 2.1.5          |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | htmltools   | 0.3.5          |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | caTools     | NA             |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | evaluate    | 0.8            |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | base64enc   | NA             |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | jsonlite    | NA             |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | rprojroot   | NA             |
| 2017-03-24 | rmarkdown   | 1.4             | 18448d209fbe620beb42441f890200469cbe7377 | methods     | NA             |
| 2015-12-29 | htmltools   | 0.3             | 4527e5ac801161e359857d13f5636287d5592dc1 | utils       | NA             |
| 2015-12-29 | htmltools   | 0.3             | 4527e5ac801161e359857d13f5636287d5592dc1 | digest      | NA             |
| 2014-03-26 | jsonlite    | 0.9.16          | 2a37d6b9bf3b6ad45413f7a4f3b19e34f54ea6af | methods     | NA             |
| 2017-03-19 | Rcpp        | 0.12.10         | b495acd4f58831481943bc3ba455a60ce66bb30b | methods     | NA             |
| 2017-03-19 | Rcpp        | 0.12.10         | b495acd4f58831481943bc3ba455a60ce66bb30b | utils       | NA             |
| 2015-08-03 | httpuv      | 1.3.3           | 06626a3999cd163a8bb89d315a75b60f6ed30c4a | methods     | NA             |
| 2015-08-03 | httpuv      | 1.3.3           | 06626a3999cd163a8bb89d315a75b60f6ed30c4a | Rcpp        | 0.11.0         |
| 2015-08-03 | httpuv      | 1.3.3           | 06626a3999cd163a8bb89d315a75b60f6ed30c4a | utils       | NA             |
| 2015-03-29 | mime        | 0.3             | 35dfceae47083477241b4ace01b41ab4d52a4df3 | tools       | NA             |
| 2014-03-26 | jsonlite    | 0.9.16          | 2a37d6b9bf3b6ad45413f7a4f3b19e34f54ea6af | methods     | NA             |
| 2016-02-05 | xtable      | 1.8-2           | d2161904474544167c6ee9dce42e521ce63fcb28 | stats       | NA             |
| 2016-02-05 | xtable      | 1.8-2           | d2161904474544167c6ee9dce42e521ce63fcb28 | utils       | NA             |
| 2016-03-21 | htmltools   | 0.3.5           | 5acee1a9cfa5c9db62c254e126244fe6cdfdf27d | utils       | NA             |
| 2016-03-21 | htmltools   | 0.3.5           | 5acee1a9cfa5c9db62c254e126244fe6cdfdf27d | digest      | NA             |
| 2016-03-21 | htmltools   | 0.3.5           | 5acee1a9cfa5c9db62c254e126244fe6cdfdf27d | Rcpp        | NA             |
| 2016-08-13 | knitr       | 1.14            | e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f | evaluate    | 0.8            |
| 2016-08-13 | knitr       | 1.14            | e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f | digest      | NA             |
| 2016-08-13 | knitr       | 1.14            | e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f | formatR     | NA             |
| 2016-08-13 | knitr       | 1.14            | e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f | highr       | NA             |
| 2016-08-13 | knitr       | 1.14            | e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f | markdown    | NA             |
| 2016-08-13 | knitr       | 1.14            | e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f | stringr     | 0.6            |
| 2016-08-13 | knitr       | 1.14            | e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f | yaml        | 2.1.5          |
| 2016-08-13 | knitr       | 1.14            | e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f | methods     | NA             |
| 2016-08-13 | knitr       | 1.14            | e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f | tools       | NA             |
| 2016-03-21 | htmltools   | 0.3.5           | 5acee1a9cfa5c9db62c254e126244fe6cdfdf27d | utils       | NA             |
| 2016-03-21 | htmltools   | 0.3.5           | 5acee1a9cfa5c9db62c254e126244fe6cdfdf27d | digest      | NA             |
| 2016-03-21 | htmltools   | 0.3.5           | 5acee1a9cfa5c9db62c254e126244fe6cdfdf27d | Rcpp        | NA             |
| 2014-04-21 | caTools     | 1.17.1          | 9c9d1210ba864caefa723d187ef7911ce9ee2d1e | bitops      | NA             |
| 2015-09-18 | evaluate    | 0.8             | c4dd9888e8a9dad56b13b60202feafbd662df0a8 | methods     | NA             |
| 2015-09-18 | evaluate    | 0.8             | c4dd9888e8a9dad56b13b60202feafbd662df0a8 | stringr     | 0.6.2          |
| 2017-02-28 | jsonlite    | 1.3             | 8573756682e38b0d0f879265c385c5141fc5a751 | methods     | NA             |
| 2017-01-16 | rprojroot   | 1.2             | af4b9c49cb2ad1556750e45e0076c9302c02f663 | backports   | NA             |
| 2014-02-03 | Rcpp        | 0.11.0          | a4f640890da8d282adbfdac8e5305bf5ab3ee2d8 | methods     | NA             |
| 2017-03-19 | Rcpp        | 0.12.10         | b495acd4f58831481943bc3ba455a60ce66bb30b | methods     | NA             |
| 2017-03-19 | Rcpp        | 0.12.10         | b495acd4f58831481943bc3ba455a60ce66bb30b | utils       | NA             |
| 2015-09-18 | evaluate    | 0.8             | c4dd9888e8a9dad56b13b60202feafbd662df0a8 | methods     | NA             |
| 2015-09-18 | evaluate    | 0.8             | c4dd9888e8a9dad56b13b60202feafbd662df0a8 | stringr     | 0.6.2          |
| 2015-04-23 | markdown    | 0.7.7           | 169ed863ba2fb50595b55138c5444634d57db8ee | mime        | 0.3            |
| 2011-12-07 | stringr     | 0.6             | e911a43fd5671a69038ad2797b1f324c94781753 | plyr        | NA             |
| 2017-03-19 | Rcpp        | 0.12.10         | b495acd4f58831481943bc3ba455a60ce66bb30b | methods     | NA             |
| 2017-03-19 | Rcpp        | 0.12.10         | b495acd4f58831481943bc3ba455a60ce66bb30b | utils       | NA             |
| 2017-01-18 | backports   | 1.0.5           | 55836d16e177136c355ddabfaa46154d86007e20 | utils       | NA             |
| 2015-03-29 | mime        | 0.3             | 35dfceae47083477241b4ace01b41ab4d52a4df3 | tools       | NA             |
| 2016-06-08 | plyr        | 1.8.4           | 12b7e1fdd934ca2b1c1f8fc37f18f3964bfc7d9b | Rcpp        | 0.11.0         |
| 2014-02-03 | Rcpp        | 0.11.0          | a4f640890da8d282adbfdac8e5305bf5ab3ee2d8 | methods     | NA             |

``` r
knitr::kable(revisionist::prune_map(x))
```

| date       | package     | version | sha                                      | github\_archive                                                                     | cran\_archive                                                                       |
| :--------- | :---------- | :------ | :--------------------------------------- | :---------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------- |
| 2017-04-01 | slickR      | 0.1.0   | 59fbc8bc3ad5bb70cbff309fcc502271d79d40ab | <https://github.com/cran/slickR/tree/59fbc8bc3ad5bb70cbff309fcc502271d79d40ab>      | <https://cran.r-project.org/src/contrib/Archive/slickR/slickR_0.1.0.tar.gz>         |
| 2016-11-09 | htmlwidgets | 0.8     | a94e6dc3db952d2e3b600e55e866ee9300b37519 | <https://github.com/cran/htmlwidgets/tree/a94e6dc3db952d2e3b600e55e866ee9300b37519> | <https://cran.r-project.org/src/contrib/Archive/htmlwidgets/htmlwidgets_0.8.tar.gz> |
| 2017-01-24 | xml2        | 1.1.1   | 68d9ee9cf7d9e6e136355fb1b3fb4bf4cce94bb7 | <https://github.com/cran/xml2/tree/68d9ee9cf7d9e6e136355fb1b3fb4bf4cce94bb7>        | <https://cran.r-project.org/src/contrib/Archive/xml2/xml2_1.1.1.tar.gz>             |
| 2017-04-01 | shiny       | 1.0.1   | d277717979385d8036218970833775f28eadc933 | <https://github.com/cran/shiny/tree/d277717979385d8036218970833775f28eadc933>       | <https://cran.r-project.org/src/contrib/Archive/shiny/shiny_1.0.1.tar.gz>           |
| 2017-03-24 | rmarkdown   | 1.4     | 18448d209fbe620beb42441f890200469cbe7377 | <https://github.com/cran/rmarkdown/tree/18448d209fbe620beb42441f890200469cbe7377>   | <https://cran.r-project.org/src/contrib/Archive/rmarkdown/rmarkdown_1.4.tar.gz>     |
| 2015-12-29 | htmltools   | 0.3     | 4527e5ac801161e359857d13f5636287d5592dc1 | <https://github.com/cran/htmltools/tree/4527e5ac801161e359857d13f5636287d5592dc1>   | <https://cran.r-project.org/src/contrib/Archive/htmltools/htmltools_0.3.tar.gz>     |
| 2014-03-26 | jsonlite    | 0.9.16  | 2a37d6b9bf3b6ad45413f7a4f3b19e34f54ea6af | <https://github.com/cran/jsonlite/tree/2a37d6b9bf3b6ad45413f7a4f3b19e34f54ea6af>    | <https://cran.r-project.org/src/contrib/Archive/jsonlite/jsonlite_0.9.16.tar.gz>    |
| 2017-03-19 | Rcpp        | 0.12.10 | b495acd4f58831481943bc3ba455a60ce66bb30b | <https://github.com/cran/Rcpp/tree/b495acd4f58831481943bc3ba455a60ce66bb30b>        | <https://cran.r-project.org/src/contrib/Archive/Rcpp/Rcpp_0.12.10.tar.gz>           |
| 2015-08-03 | httpuv      | 1.3.3   | 06626a3999cd163a8bb89d315a75b60f6ed30c4a | <https://github.com/cran/httpuv/tree/06626a3999cd163a8bb89d315a75b60f6ed30c4a>      | <https://cran.r-project.org/src/contrib/Archive/httpuv/httpuv_1.3.3.tar.gz>         |
| 2015-03-29 | mime        | 0.3     | 35dfceae47083477241b4ace01b41ab4d52a4df3 | <https://github.com/cran/mime/tree/35dfceae47083477241b4ace01b41ab4d52a4df3>        | <https://cran.r-project.org/src/contrib/Archive/mime/mime_0.3.tar.gz>               |
| 2016-02-05 | xtable      | 1.8-2   | d2161904474544167c6ee9dce42e521ce63fcb28 | <https://github.com/cran/xtable/tree/d2161904474544167c6ee9dce42e521ce63fcb28>      | <https://cran.r-project.org/src/contrib/Archive/xtable/xtable_1.8-2.tar.gz>         |
| 2016-03-21 | htmltools   | 0.3.5   | 5acee1a9cfa5c9db62c254e126244fe6cdfdf27d | <https://github.com/cran/htmltools/tree/5acee1a9cfa5c9db62c254e126244fe6cdfdf27d>   | <https://cran.r-project.org/src/contrib/Archive/htmltools/htmltools_0.3.5.tar.gz>   |
| 2016-08-13 | knitr       | 1.14    | e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f | <https://github.com/cran/knitr/tree/e3adb6f1d7b1ed4ae9c016c015c88e5a237f1d3f>       | <https://cran.r-project.org/src/contrib/Archive/knitr/knitr_1.14.tar.gz>            |
| 2014-04-21 | caTools     | 1.17.1  | 9c9d1210ba864caefa723d187ef7911ce9ee2d1e | <https://github.com/cran/caTools/tree/9c9d1210ba864caefa723d187ef7911ce9ee2d1e>     | <https://cran.r-project.org/src/contrib/Archive/caTools/caTools_1.17.1.tar.gz>      |
| 2015-09-18 | evaluate    | 0.8     | c4dd9888e8a9dad56b13b60202feafbd662df0a8 | <https://github.com/cran/evaluate/tree/c4dd9888e8a9dad56b13b60202feafbd662df0a8>    | <https://cran.r-project.org/src/contrib/Archive/evaluate/evaluate_0.8.tar.gz>       |
| 2017-02-28 | jsonlite    | 1.3     | 8573756682e38b0d0f879265c385c5141fc5a751 | <https://github.com/cran/jsonlite/tree/8573756682e38b0d0f879265c385c5141fc5a751>    | <https://cran.r-project.org/src/contrib/Archive/jsonlite/jsonlite_1.3.tar.gz>       |
| 2017-01-16 | rprojroot   | 1.2     | af4b9c49cb2ad1556750e45e0076c9302c02f663 | <https://github.com/cran/rprojroot/tree/af4b9c49cb2ad1556750e45e0076c9302c02f663>   | <https://cran.r-project.org/src/contrib/Archive/rprojroot/rprojroot_1.2.tar.gz>     |
| 2014-02-03 | Rcpp        | 0.11.0  | a4f640890da8d282adbfdac8e5305bf5ab3ee2d8 | <https://github.com/cran/Rcpp/tree/a4f640890da8d282adbfdac8e5305bf5ab3ee2d8>        | <https://cran.r-project.org/src/contrib/Archive/Rcpp/Rcpp_0.11.0.tar.gz>            |
| 2015-04-23 | markdown    | 0.7.7   | 169ed863ba2fb50595b55138c5444634d57db8ee | <https://github.com/cran/markdown/tree/169ed863ba2fb50595b55138c5444634d57db8ee>    | <https://cran.r-project.org/src/contrib/Archive/markdown/markdown_0.7.7.tar.gz>     |
| 2011-12-07 | stringr     | 0.6     | e911a43fd5671a69038ad2797b1f324c94781753 | <https://github.com/cran/stringr/tree/e911a43fd5671a69038ad2797b1f324c94781753>     | <https://cran.r-project.org/src/contrib/Archive/stringr/stringr_0.6.tar.gz>         |
| 2017-01-18 | backports   | 1.0.5   | 55836d16e177136c355ddabfaa46154d86007e20 | <https://github.com/cran/backports/tree/55836d16e177136c355ddabfaa46154d86007e20>   | <https://cran.r-project.org/src/contrib/Archive/backports/backports_1.0.5.tar.gz>   |
| 2016-06-08 | plyr        | 1.8.4   | 12b7e1fdd934ca2b1c1f8fc37f18f3964bfc7d9b | <https://github.com/cran/plyr/tree/12b7e1fdd934ca2b1c1f8fc37f18f3964bfc7d9b>        | <https://cran.r-project.org/src/contrib/Archive/plyr/plyr_1.8.4.tar.gz>             |

## Details

The user supplies the target package and either:

  - target package version, then the archiving date is located on
    [CRAN](https://cran.r-project.org/src/contrib/Archive)
  - target package upper limit archive date to from which to download
    the package

`{revisionist}` then uses github api to find what package version are
needed under the constraints defined.
