#' @title Retrieve release details
#' @description Get full list of packages for a specific release
#' @param release One of the releases listed by the `list_releases()` function
#'  defaults to the latest stable release
#' @param latest Get the release details for the latest release (can be stable or current)
#' @param year Specify the year for the queries release
#' @param month Specify the month of the release (first 3 letters of the month, lower cap)
#' @param os Get the release details just for this OS (can be win, osx, unix)
#'
#' @return Content of the PACKAGES file associated with a specific release
#' @export
get_release_details = function(release = NULL,
                               latest = NULL,
                               year = NULL,
                               month = NULL,
                               os = "unix")
{
  os_list = c("osx" = "/bin/macosx/el-capitan/contrib/3.4/", "win" = "/bin/windows/contrib/", "unix" = "/src/contrib/")
  latest_list = c("stable" = "releases/latest/stable", "current" = "releases/latest/current")

  if(is.null(release)){
    if(!is.null(latest)) {
      if(latest %in% names(latest_list)){
        release <- latest_list[latest]
      }
    }
    else if(!is.null(year) && !is.null(month)){
      release <- paste0("releases/",year,"/",month)
    }
    else {
      message("Defaulting to latest stable release")
      release <- "releases/latest/stable"
    }
  }

  if(!is.null(release) && release != "") {

    current_releases <- list_releases()

    if (!(release %in% current_releases$Path)){
      return(message("Invalid Neuroconductor Release"))
    }

    if(!is.null(os)) {
      if(os %in% names(os_list)) {
        release <- paste0(release,os_list[os])
      }
    }
    release <- paste0("https://neuroconductor.org/",release,"PACKAGES")
    con <- url(release)
    release_details <- read.dcf(con, all = TRUE)
    close(con)

    return(release_details)
    #return(message(release))
  }


}
