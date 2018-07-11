#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param package PARAM_DESCRIPTION
#' @param uri PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @rdname find_children
#' @export
#' @importFrom utils download.file untar
#' @import dplyr
find_children <- function(package,uri){

  td <- file.path(tempdir(),'_pkgs/src/contrib')

  if(!dir.exists(td))
    dir.create(td,recursive = TRUE)

  tf <- file.path(td,basename(uri))

  if(package%in%gsub('_(.*?)$','',list.files(td)))
    return(dplyr::data_frame())

  utils::download.file(uri,destfile = tf)

  on.exit(unlink(file.path(tempdir(),package),recursive = TRUE,force = TRUE),add = TRUE)

  utils::untar(tf,exdir = file.path(tempdir()))

  DESC_PATH <- file.path(tempdir(),package,'DESCRIPTION')

  if(!file.exists(DESC_PATH))
    return(dplyr::data_frame())

  DESC <- read.dcf(DESC_PATH)

  idx <- intersect(c('Depends','Imports','Suggests'),colnames(DESC))

  xx <- unlist(lapply(strsplit(
    paste0(DESC[,idx],collapse = ','),
    ','),
    gsub,
    pattern = '^\\s+|\\s+$',
    replacement = ''),
    use.names = FALSE)

  dplyr::data_frame(raw = xx)%>%
    dplyr::mutate(
      parent = package,
      package = gsub('\\s+(.*?)$','',raw),
      version = ifelse(grepl('\\s',raw),
                       gsub('^(.*?)\\s+','',raw),NA),
      version = gsub('[^0-9.]','',version)
    )%>%
    dplyr::filter(!grepl('^R$',package))%>%
    dplyr::select( - raw)
}
