#' fars_map_state
#'
#' \code{fars_map_state} returns a plot of the coordinates of each fatal collision by the
#'  state and year in which they occured
#'
#' @param state.num An integer value which identifies a state in the FARS dataset
#' @param year An integer value which for one of the years in the FARS dataset
#'
#' @return A plot of the states map with the coordinates of each fatality that year in
#'      that state plotted as a point
#'
#'
#'
#'@example fars_map_state(12, 2013); returns a map Florida with auto fatality points
#'
#'@note if the state number isnt included in the dataset STATE column, it returns an error
#'
#'@export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to  plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}

