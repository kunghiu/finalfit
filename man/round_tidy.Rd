% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/finalfit_internal_functions.R
\name{round_tidy}
\alias{round_tidy}
\title{Round values but keep trailing zeros}
\usage{
round_tidy(x, digits)
}
\arguments{
\item{x}{Numeric vector of values to round}

\item{digits}{Integer of length one: value to round to.}
}
\value{
Vector of strings.
}
\description{
Internal function, not called directly
}
\details{
e.g. for 3 decimal places I want 1.200, not 1.2.
}
\keyword{internal}
