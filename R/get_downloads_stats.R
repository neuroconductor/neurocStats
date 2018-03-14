#' @title Get Neuroconductor download stats
#' @description Retrieve a compact or verbose list of downloads for one or all Neuroconductor packages
#' @param package Retrieve download stats for this package, if null return stats for all packages
#' @param verbose Get a compact or a detailed listing of downloads
#' @param error Should function error if httr::GET failed
#'
#' @return DataFrame with the download stats
#' @importFrom httr content GET stop_for_status
#' @importFrom dplyr bind_rows
#' @export
get_download_stats = function(package = NULL,
                              verbose = FALSE,
                              error = FALSE)
{
  url <- "https://neuroconductor.org/api/downloads"
  if(verbose){
    url <- paste0(url,"/verbose")
  }
  if(is.null(package)){
    package <- 'all'
  }
  url <- paste0(url,"/",package)

  args = list(
    url <- url
  )
  ret <- do.call("GET", args)

  if (error) {
    stop_for_status(ret)
  }

  download_stats <- content(ret)

  if(!is.null(package) && verbose == FALSE && package != "all")
  {
    message('here')
    return(data.frame(download_stats))
  }

  download_stats <- bind_rows(lapply(download_stats, as.data.frame, stringsAsFactors = FALSE))

  return(download_stats)
}
