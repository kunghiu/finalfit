% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/finalfit_internal_functions.R
\name{extract_fit.lm}
\alias{extract_fit.lm}
\title{Extract model output to dataframe}
\usage{
\method{extract_fit}{lm}(.data, explanatory_name = "explanatory",
  estimate_name = "Coefficient", estimate_suffix = "", p_name = "p",
  digits = c(2, 2, 3), ...)
}
\arguments{
\item{.data}{Model output.}

\item{explanatory_name}{Name for this column in output.}

\item{estimate_name}{Name for this column in output.}

\item{estimate_suffix}{Appeneded to estimate name.}

\item{p_name}{Name given to p-value estimate.}

\item{digits}{Number of digits to round to (1) estimate, (2) confidence
interval limits, (3) p-value.}

\item{...}{Other arguments.}
}
\description{
Internal function, not called directly.
}
\keyword{internal}
