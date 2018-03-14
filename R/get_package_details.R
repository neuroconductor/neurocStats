#' @title Retrieve Neuroconductor package details
#' @description Retrieves the full details for a Neuroconductor package
#' @param package Name of the package we need details for
#' @param error Should function error if httr::GET failed
#'
#' @return DataFrame of Neuroconductor package details
#' @importFrom httr content GET stop_for_status
#' @export
get_package_details = function(package,
                               error = FALSE) {
  args = list(
    url = paste0("https://neuroconductor.org/api/package/",package)
  )
  ret <- do.call("GET", args)

  if (error) {
    stop_for_status(ret)
  }

  package_details <- content(ret)

  return(package_details)
}
