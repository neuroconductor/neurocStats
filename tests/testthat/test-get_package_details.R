test_that("get_package_details works", {

  testthat::expect_is(get_package_details('fslr'),"description")
  testthat::expect_is(get_package_details('fslr', error = TRUE),"description")
})
