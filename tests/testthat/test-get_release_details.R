test_that("get release details", {

  testthat::expect_message(get_release_details("releases/2017/oct"),"Invalid Neuroconductor Release")
  testthat::expect_is(get_release_details("releases/2017/11"),"data.frame")
  testthat::expect_is(get_release_details(year = "2017", month = "11"),"data.frame")
  testthat::expect_is(get_release_details(year = "2017", month = "11", os = "osx"),"data.frame")
  testthat::expect_equal(nrow(get_release_details(year = "2017", month = "11", os = "osx")), 55)
})
