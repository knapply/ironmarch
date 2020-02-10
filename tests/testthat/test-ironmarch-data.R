test_that("data loads", {
  expect_true(
    all(vapply(im_core_dfs, is.data.frame, logical(1L)))
  )
  
  expect_true(
    all(vapply(im_orig_dfs, is.data.frame, logical(1L)))
  )
  
  expect_true(
    all(vapply(im_forums_dfs, is.data.frame, logical(1L)))
  )
  
  expect_true(
    all(vapply(im_other_dfs, is.data.frame, logical(1L)))
  )
})
