#' @import dplyr
#' @importFrom purrr map2_df
recurse <- function(x,child,DATE){

  new_x <- purrr::map2_df(child$package,child$version, get_archive, min_date = DATE)%>%
    dplyr::distinct()

  if(nrow(new_x)>0){

    new_child <- purrr::map2_df(new_x$package, new_x$uri, find_children)

    recurse(new_x, new_child, DATE)
  }

}
