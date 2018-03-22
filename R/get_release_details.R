#' @title Retrieve release details
#' @description Get full list of packages for a specific release
#'
#' @return Content of the PACKAGES file associated with a specific release
#' @export
get_release_details = function(release = "releases/latest/stable", os = "src")
{
  #https://neuroconductor.org/releases/latest/stable/src/contrib/PACKAGES
  con <- url("https://neuroconductor.org/releases/latest/current/bin/macosx/el-capitan/contrib/3.4/PACKAGES")
  release_details <- read.dcf(con, all = TRUE)
  close(con)

  return(release_details)
}
