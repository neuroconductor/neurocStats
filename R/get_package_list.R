#' @title Retrieve Neuroconductor package list
#' @description Retrieves the complete list of Neuroconductor packages
#' @param error Should function error if httr::GET failed
#'
#' @return DataFrame of Neuroconductor packages
#' @importFrom httr content GET stop_for_status
#' @importFrom dplyr bind_rows
#' @export
get_package_list  = function(error = FALSE)
{
  args = list(
    url = "https://neuroconductor.org/api/list-packages"
  )
  ret <- do.call("GET", args)

  if (error) {
    stop_for_status(ret)
  }

  neuroc_packages <- content(ret)
  neuroc_packages <- bind_rows(lapply(neuroc_packages$packages, as.data.frame, stringsAsFactors = FALSE))

  return(neuroc_packages)
}
