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

  x <- purrr::map2_df(pkg,version,get_archive, date)

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
    dplyr::select(date,package = parent,version=parent_version)%>%
    dplyr::distinct()
}
