context("Errors")

test_that("Throws errors", {
  throws_error(fars_summarize_years(2000))
  throws_error(fars_read_years(2000))
  throws_error(make_filename("Two Thousand"))
  throws_error(fars_map_state(3, 2000))
  throws_error(fars_map_state(36, 2000))
})


