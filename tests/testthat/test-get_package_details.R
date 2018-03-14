test_that("get_package_details works", {

  testthat::expect_is(get_package_details('fslr'),"list")
  testthat::expect_is(get_package_details('fslr', error = TRUE),"list")
})
