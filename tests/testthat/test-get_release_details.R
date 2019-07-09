test_that("get release details", {

  testthat::expect_message(get_release_details("releases/2017/oct"),"Invalid Neuroconductor Release")
  testthat::expect_is(get_release_details("releases/2017/nov"),"data.frame")
  testthat::expect_is(get_release_details(year = "2017", month = "nov"),"data.frame")
  testthat::expect_is(get_release_details(year = "2017", month = "nov", os = "osx"),"data.frame")
  testthat::expect_equal(nrow(get_release_details(year = "2017", month = "nov", os = "osx")), 55)
})
