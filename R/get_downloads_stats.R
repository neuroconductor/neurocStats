#' @title Get Neuroconductor download stats
#' @description Retrieve a compact or verbose list of downloads for one or all Neuroconductor packages
#' @param package Retrieve download stats for this package, if null return stats for all packages
#' @param verbose Get a compact or a detailed listing of downloads
#' @param error Should function error if httr::GET failed
#'
#' @return DataFrame with the download stats
#' @importFrom RCurl getURL
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr count
#' @export
get_download_stats = function(package = NULL,
                              verbose = FALSE,
                              error = FALSE)
{
  url <- "https://neuroconductor.org/api/downloads"

  download_stats <- fromJSON(getURL(url))
  download_stats <- data.frame(download_stats)

  if(is.null(package) && verbose == TRUE)
  {
    return(download_stats)
  }
  if(!is.null(package) && verbose == TRUE)
  {
    download_stats <- download_stats[download_stats$name==package,]
    rownames(download_stats) <- NULL
    return(download_stats)
  }
  download_stats <- data.frame(count(download_stats,download_stats$name))
  names(download_stats) <- c("package","downloads")

  if(is.null(package) && verbose == FALSE)
  {
    return(download_stats)
  }
  if(!is.null(package) && verbose == FALSE)
  {
    download_stats <- download_stats[download_stats$package==package,]$downloads
    rownames(download_stats) <- NULL
    return(download_stats)
  }
}
