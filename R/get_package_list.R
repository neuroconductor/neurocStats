#' @title Retrieve Neuroconductor package list
#' @description Retrieves the complete list of Neuroconductor packages
#' @param error Should function error if httr::GET failed
#'
#' @return DataFrame of Neuroconductor packages
#' @importFrom RCurl getURL
#' @importFrom jsonlite fromJSON
#' @export
get_package_list  = function(error = FALSE)
{
  url <- "https://neuroconductor.org/api/packages"

  package_list <- fromJSON(getURL(url))
  package_list <- data.frame(package_list)

  return(package_list)
}
