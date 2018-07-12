description_commits <- function(pkg, min_version = NA, min_date = NA, pat = Sys.getenv('GITHUB_PAT')){
  
  if(pkg%in%rownames(installed.packages(priority = 'base')))
    return(NULL)
  
  x <- jsonlite::read_json(sprintf('https://api.github.com/repos/cran/%s/commits?path=DESCRIPTION&access_token=%s',pkg,pat))
  
  DESCS <- dplyr::data_frame(
    package = pkg,
    version = gsub('version ','',sapply(x,function(y) y$commit$message)),
    date    = as.Date(sapply(x,function(y) y$commit$author$date)),
    sha     = sapply(x,function(y) basename(y$url))
  )%>%
    dplyr::arrange(date)
  
  if(!is.na(min_version)){
    
    DESCS <- DESCS%>%
      dplyr::filter(
        version==min_version
      )
    
    return(DESCS)
  }
  
  if(!is.na(min_date)){
    
    if(DESCS$date[1]>min_date){
      DESCS <- DESCS%>%
        dplyr::slice(1)
    }else{
      DESCS <- DESCS%>%
        dplyr::filter(
          date<=min_date
        )
    }
  }
  
  DESCS%>%
    dplyr::filter(date==max(date))

}

description_get <- function(x,outdir = tempdir()){
  
  td <- file.path(tempdir(),'DESCRIPTIONS')
  if(!dir.exists(td))
    dir.create(td)
  
  FILE <- sprintf('DESCRIPTION_%s_%s',x$package,x$version)
  
  utils::download.file(sprintf('https://raw.githubusercontent.com/cran/%s/%s/DESCRIPTION',x$package,x$sha),
                       file.path(td,FILE))
  
  invisible(FILE)
}

description_parse <- function(file,fields = c('Depends','Imports'),date){
  
  DESC <- read.dcf(file.path(tempdir(),'DESCRIPTIONS',file))
  
  idx <- intersect(fields,colnames(DESC))
  
  xx <- unlist(lapply(strsplit(
    paste0(DESC[,idx],collapse = ','),
    ','),
    gsub,
    pattern = '^\\s+|\\s+$',
    replacement = ''),
    use.names = FALSE)
  
  dplyr::data_frame(raw = xx)%>%
    dplyr::mutate(
      date = date,
      parent = as.character(DESC[,'Package']),
      parent_version = as.character(DESC[,'Version']),
      child = gsub('\\s+(.*?)$','',raw),
      child_version = ifelse(grepl('\\s',raw),
                       gsub('^(.*?)\\s+','',raw),NA),
      child_version = gsub('[^0-9.]','',child_version)
    )%>%
    dplyr::filter(!grepl('^R$',child))%>%
    dplyr::select( - raw)
}

#' @export
get_archive <- function(package, version, date = NA){
  
  x <- description_commits(package,version,date)
  
  if(is.null(x))
    return(dplyr::tibble())
 
  x%>%description_get()%>%description_parse(date = x$date)
}