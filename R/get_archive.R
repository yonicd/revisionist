#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param package PARAM_DESCRIPTION
#' @param min_version PARAM_DESCRIPTION, Default: NA
#' @param min_date PARAM_DESCRIPTION, Default: NA
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @rdname get_archive_old
#' @export
#' @import httr
#' @importFrom rvest html_table
#' @importFrom purrr flatten_df set_names
#' @import dplyr
get_archive_old <- function(package, min_version = NA, min_date = NA){

  cran_uri <- sprintf('https://cran.r-project.org/src/contrib/Archive/%s/',package)

  if(httr::http_error(cran_uri))
    return(NULL)

  ret <- httr::GET(cran_uri)%>%
    httr::content()%>%
    rvest::html_table()%>%
    purrr::flatten_df()%>%
    purrr::set_names(sprintf('V%s',1:5))%>%
    dplyr::select(file = V2,date = V3)%>%
    dplyr::mutate(package = gsub('\\_(.*?)$','',file),
                  version = gsub('^(.*?)\\_|\\.tar(.*?)$','',file),
                  version = dplyr::if_else(lengths(regmatches(version, gregexpr("\\.", version)))<2,
                                           sprintf('%s.0',version),version))%>%
    dplyr::mutate_all(function(x)ifelse(nzchar(x),x,NA))%>%
    dplyr::filter(complete.cases(.))%>%
    dplyr::mutate(date = as.Date(date),
                  src = 'https://cran.r-project.org/src/contrib/Archive',
                  uri = file.path(src,package,file))

  if(!is.na(min_version)){

    ret <- ret%>%
      dplyr::filter(
        version==min_version
      )

    return(ret)
  }

  if(!is.na(min_date)){

    if(ret$date[1]>min_date){
      ret <- ret%>%
        dplyr::slice(1)
    }else{
      ret <- ret%>%
        dplyr::filter(
          date<=min_date
        )
    }
  }

  ret%>%
    dplyr::filter(date==max(date))

}
