% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/documents.R
\name{fars_read_years}
\alias{fars_read_years}
\title{fars_read_years}
\usage{
fars_read_years(years)
}
\arguments{
\item{fars_summarize_years}{years: A vector of the years which exist in the data, or which are
being searched for. Created un the global environment but passed from the summarize function.}
}
\value{
The object returned is set of two-columned tibbles indiced by year where each
  element of the tibble is an instance of a fatal autocollision during that month
  and year.
}
\description{
\code{fars_read_years} produces a set of two columned tibbles (MONTH , year), indiced by
year for each year in the FARS data. year <- c(2013, 2014, 2015), or, year <- c(2000:2020), etc.
Returns a warning if the
 year is not in the data. It is used in conjunction with \code{\link{fars_summarize_years}}.
}
\note{
if 'years' vector has not been created in the global environment then it return  an
  error

if year[i] isnt an element of years, it returns an error: "invalid year".
}
\examples{
fars_read_years(2013:2015)

}
