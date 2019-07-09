#' @title List Neurocnductor releases
#' @description Retrieves the full list of Neuroconductor releases
#' @param verbose If TRUE, list all files from all releases
#'
#' @importFrom jsonlite fromJSON
#' @importFrom RCurl getURL
#'
#' @return Data.frame of all releases
#' @export
list_releases = function()
{
  url <- "https://neuroconductor.org/api/releases"
  neuroc_releases <- fromJSON(getURL(url))
  neuroc_releases <- data.frame(neuroc_releases)
  colnames(neuroc_releases) <- c("Path")
  return(neuroc_releases)
}
