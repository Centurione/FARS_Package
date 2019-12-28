#' fars_summarize_years
#'
#' \code{fars_summarize_years}
#' aggregates the the data into a tibble of the number of autocollisions in each month
#' spread across the span of years
#'
#' @param years the numeric vector of years which are being search for.
#'
#' @return returns  tibble of the number of autocollisions in each month over the span
#' of years
#'
#' @example fars_summarize_years(years)
#'
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
