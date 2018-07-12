#' @import dplyr
#' @importFrom purrr map2_df
recurse <- function(x,DATE,X = NULL){

  new_x <- purrr::map2_df(x$child,x$child_version,get_archive, date = DATE)

  X <- bind_rows(X,new_x)
  
  if(nrow(new_x)>0){

    recurse(new_x, DATE, X)
    
  }else{
    
    X
    
  }

}
