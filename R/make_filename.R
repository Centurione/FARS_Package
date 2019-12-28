#' make_filename
#'
#' \code{make_file_name} Take as input the year and returns a character string
#'    that's a filename in the working directory. Used in conjunction with
#'    \code{\link{fars_summarize_year}} and \code{\link{fars_map_state}}.
#'
#'@param fars_summarize_years year: an interger value for the year in
#' the FARS data sourced from the fars_summarize_years function
#'
#'@param fars_map_state year: an integer value for year in the FARS data sourced from the mapping
#' function.
#'
#'@return A character string identical to the filename of the corresponding year in the
#'     WD
#'
#'@example make_filename(2015)
#'
#'@export
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
