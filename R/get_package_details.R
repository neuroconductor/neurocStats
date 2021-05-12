#' @title Retrieve Neuroconductor package details
#' @description Retrieves the details for a Neuroconductor package
#' @param package Name of the package
#' @param error Should function error if httr::GET failed
#'
#' @return the package details
#' @importFrom httr content GET stop_for_status
#' @importFrom jsonlite fromJSON
#' @export
get_package_details = function(package,
                                   error = FALSE)
{
  url <- paste0("https://neuroconductor.org/api/package/",package)

  package_details <- fromJSON(url)
  #package_details <- data.frame(package_details)

  return(package_details)
}

