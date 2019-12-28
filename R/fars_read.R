#'  fars_read()
#'
#'  \code{fars_read} reads FARS data .csv and converts it to tibble i.e. dplyr::tbl_df(). it used with
#'  \code{\link{fars_summarize_years}}, \code{\link{fars_read_years}}, \code{\link{make_filename}}
#'   and \code{\link{fars_map_state}}.
#'
#'@param make_filename A string of characters located in WD
#'
#'@return This function returns a tibble of FARS data. As a side
#'     side effect, it also prints the tibble.
#'
#'
#'@example fars_read("accident_2015.csv.bz2")
#'
#'@note if filename is not in WD than it returns an error
#'
#'@export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
