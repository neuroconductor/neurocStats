test_that("get_package_list", {

  testthat::expect_is(get_package_list(),"data.frame")
  testthat::expect_is(get_package_list(error = TRUE),"data.frame")
})
