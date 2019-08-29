test_that("get_package_details works", {

  testthat::expect_is(get_package_details('fslr'),"data.frame")
  testthat::expect_is(get_package_details('fslr', error = TRUE),"data.frame")
})
