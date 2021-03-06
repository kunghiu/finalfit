% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/label.R
\name{label}
\alias{label}
\title{Label variable names}
\usage{
label(x) = "Variable label"
}
\description{
This restates \code{Hmisc::\link[Hmisc]{label}} which is used to format
variable labels. All \code{finalfit} functions recognise this.
}
\examples{

library(Hmisc)
label(colon_s$age.factor) = "Age"

}
