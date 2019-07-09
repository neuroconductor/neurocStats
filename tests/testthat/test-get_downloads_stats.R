test_that("get_download_stats works", {

  testthat::expect_is(get_download_stats(), "data.frame")
  testthat::expect_is(get_download_stats('fslr'), "integer")
  testthat::expect_is(get_download_stats('fslr', verbose=TRUE), "data.frame")
  testthat::expect_is(get_download_stats(verbose = TRUE, error = TRUE), "data.frame")
})
