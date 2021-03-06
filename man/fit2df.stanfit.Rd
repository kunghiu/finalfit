% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit2df_stanfit.R
\name{fit2df.stanfit}
\alias{fit2df.stanfit}
\title{Extract \code{stanfit} model fit results to dataframe: \code{finalfit} model
extracters}
\usage{
\method{fit2df}{stanfit}(.data, condense = TRUE, metrics = FALSE,
  remove_intercept = TRUE, explanatory_name = "explanatory",
  estimate_name = "OR", estimate_suffix = "", p_name = "p",
  digits = c(2, 2, 3), confint_sep = "-", ...)
}
\arguments{
\item{.data}{Output from \code{finalfit} model wrappers.}

\item{condense}{Logical: when true, effect estimates, confidence intervals
and p-values are pasted conveniently together in single cell.}

\item{metrics}{Logical: when true, useful model metrics are extracted.}

\item{remove_intercept}{Logical: remove the results for the intercept term.}

\item{explanatory_name}{Name for this column in output}

\item{estimate_name}{Name for this column in output}

\item{estimate_suffix}{Appeneded to estimate name}

\item{p_name}{Name given to p-value estimate}

\item{digits}{Number of digits to round to (1) estimate, (2) confidence
interval limits, (3) p-value.}

\item{confint_sep}{String to separate confidence intervals, typically "-" or
" to ".}

\item{...}{Other arguments: `X` Design matrix from stanfit modelling. Details
documented else where.}
}
\value{
A dataframe of model parameters. When \code{metrics=TRUE} output is a
  list of two dataframes, one is model parameters, one is model metrics.
}
\description{
Takes output from \code{rstan} model and extracts to a dataframe, convenient
for further processing in preparation for final results table.
}
\details{
\code{fit2df.stanfit} is the model extract method for our standard Bayesian
hierarchical binomial logistic regression models. These models will be fully
documented separately. However this should work for a single or multilevel
Bayesian logistic regression done in Stan, as long as the fixed effects are
specified in the parameters block as a vector named \code{beta}, of length
\code{P}, where \code{P} is the number of fixed effect parameters. e.g.
parameters{ vector[P] beta; }
}
\seealso{
Other \code{finalfit} model extractors: \code{\link{fit2df.coxphlist}},
  \code{\link{fit2df.coxph}},
  \code{\link{fit2df.glmerMod}},
  \code{\link{fit2df.glmlist}},
  \code{\link{fit2df.lmerMod}},
  \code{\link{fit2df.lmlist}}, \code{\link{fit2df.lm}},
  \code{\link{fit2df}}
}
