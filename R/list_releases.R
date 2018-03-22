#' @title List Neurocnductor releases
#' @description Retrieves the full list of Neuroconductor releases
#' @param verbose If TRUE, list all files from all releases
#'
#' @return Data.frame of all releases
#' @export
list_releases = function(verbose = FALSE)
{
  url <- "https://neuroconductor.org/api/releases"
  if(verbose){
    url <- paste0(url,"/verbose")
  }
  neuroc_releases <- read.table(url)
  colnames(neuroc_releases) <- c("Path")
  return(neuroc_releases)
}
