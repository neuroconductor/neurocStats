test_that("list releases", {

  testthat::expect_is(list_releases(),"data.frame")
})
