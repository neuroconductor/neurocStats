#' @title Retrieve Neuroconductor package DESCRIPTION file
#' @description Retrieves the DESCRIPTION file for a Neuroconductor package
#' @param package Name of the package
#' @param error Should function error if httr::GET failed
#'
#' @return content of the DESCRIPTION file
#' @importFrom httr content GET stop_for_status
#' @importFrom desc description
#' @export
get_package_description = function(package,
                               error = FALSE) {
  args = list(
    url = paste0("https://raw.githubusercontent.com/neuroconductor/",package,"/master/DESCRIPTION")
  )
  ret <- do.call("GET", args)

  if (error) {
    stop_for_status(ret)
  }

  package_details <- content(ret)
  package_details <- description$new(text = package_details)

  return(package_details)
}
