test_that("get_package_description works", {

  testthat::expect_is(get_package_description('fslr'),"description")
  testthat::expect_is(get_package_description('fslr', error = TRUE),"description")
})
