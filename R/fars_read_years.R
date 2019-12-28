#' fars_read_years
#'
#' \code{fars_read_years} produces a set of two columned tibbles (MONTH , year), indiced by
#' year for each year in the FARS data. year <- c(2013, 2014, 2015), or, year <- c(2000:2020), etc.
#' Returns a warning if the
#'  year is not in the data. It is used in conjunction with \code{\link{fars_summarize_years}}.
#'
#'@param fars_summarize_years years: A vector of the years which exist in the data, or which are
#'    being searched for. Created un the global environment but passed from the summarize function.
#'
#'@return The object returned is set of two-columned tibbles indiced by year where each
#'   element of the tibble is an instance of a fatal autocollision during that month
#'   and year.
#'
#'
#'@example fars_read_years(years)
#'
#'@note if 'years' vector has not been created in the global environment then it return  an
#'   error
#'
#'@note if year[i] isnt an element of years, it returns an error: "invalid year".
#'
#'@export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
