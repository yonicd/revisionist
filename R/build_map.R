#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param pkg PARAM_DESCRIPTION
#' @param version PARAM_DESCRIPTION, Default: NA
#' @param date PARAM_DESCRIPTION, Default: NA
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @rdname build_map
#' @export
#' @importFrom purrr map2_df
build_map <- function(pkg,version = NA, date = NA){

  x <- purrr::map2_df(pkg,version,get_archive, date,fields = c('Depends','Imports','Suggests'))

  pkg_map <- recurse(x,x$date[1],x)

}

#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param x PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @rdname prune_map
#' @export 
#' @import dplyr
prune_map <- function(x){
  x%>%
    dplyr::select(date, 
                  package = parent,
                  version = parent_version,
                  sha = parent_sha)%>%
    dplyr::distinct()%>%
    dplyr::mutate(
      github_archive = sprintf('https://github.com/cran/%s/tree/%s',package,sha),
      cran_archive = sprintf('https://cran.r-project.org/src/contrib/Archive/%s/%s_%s.tar.gz',
                        package,
                        package,
                        version)
    )
    
}
