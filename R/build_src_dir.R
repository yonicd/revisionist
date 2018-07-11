#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param pkg PARAM_DESCRIPTION
#' @param version PARAM_DESCRIPTION, Default: NA
#' @param date PARAM_DESCRIPTION, Default: NA
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @rdname build_src_dir
#' @export
#' @importFrom purrr map2_df
#' @importFrom tools write_PACKAGES
build_src_dir <- function(pkg,version = NA, date = NA){

  pkgs <- file.path(tempdir(),'_pkgs')

  on.exit(tools::write_PACKAGES(file.path(pkgs,'src/contrib')),add = TRUE)

  x <- purrr::map2_df(pkg,version,get_archive, date)

  child <- purrr::map2_df(x$package,x$uri,find_children)

  recurse(x,child,x$date)

  pkgs
}
