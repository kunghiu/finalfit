#' Extract \code{coxphuni} and \code{coxphmulti} model fit results to dataframe: \code{finalfit} model extracters
#'
#' Takes output from \code{finalfit} model wrappers and extracts to a dataframe,
#' convenient for further processing in preparation for final results table.
#'
#' \code{fit2df.coxphlist} is the model extract method for \code{coxphuni} and \code{coxphmulti}.
#'
#' @param .data Output from \code{finalfit} model wrappers.
#' @param condense Logical: when true, effect estimates, confidence intervals and p-values
#'   are pasted conveniently together in single cell.
#' @param metrics Logical: when true, useful model metrics are extracted.
#' @param remove_intercept Logical: remove the results for the intercept term.
#' @param explanatory_name Name for this column in output
#' @param estimate_name Name for this column in output
#' @param estimate_suffix Appeneded to estimate name
#' @param p_name Name given to p-value estimate
#' @param digits Number of digits to round to (1) estimate, (2) confidence
#'   interval limits, (3) p-value.
#' @param confint_sep String to separate confidence intervals, typically "-" or
#'   " to ".
#' @param ... Other arguments (not used).
#' @return A dataframe of model parameters. When \code{metrics=TRUE} output is a list of two dataframes,
#'   one is model parameters, one is model metrics. length two
#'
#' @family \code{finalfit} model extractors
#'
#' @examples
#' library(finalfit)
#' library(dplyr)
#'
#' explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
#' dependent = "Surv(time, status)"
#'
#' colon_s %>%
#' 	coxphuni(dependent, explanatory) %>%
#' 	fit2df(estimate_suffix=" (univariable)")
#'
#' colon_s %>%
#' 	coxphmulti(dependent, explanatory) %>%
#' 	fit2df(estimate_suffix=" (multivariable)")

fit2df.coxphlist <- function(.data, condense=TRUE, metrics=FALSE, remove_intercept=TRUE,
                             explanatory_name = "explanatory",
                             estimate_name = "HR",
                             estimate_suffix = "",
                             p_name = "p",
                             digits=c(2,2,3), confint_sep = "-", ...){
  if(metrics==TRUE) warning("Metrics not currently available for this model")

  df.out = plyr::ldply(.data, .id = NULL, extract_fit, explanatory_name=explanatory_name,
                       estimate_name=estimate_name, estimate_suffix=estimate_suffix,
                       p_name=p_name, digits=digits)

  if (condense==TRUE){
    df.out = condense_fit(.data=df.out, explanatory_name=explanatory_name,
                          estimate_name=estimate_name, estimate_suffix=estimate_suffix,
                          p_name=p_name, digits=digits, confint_sep=confint_sep)
  }
  return(df.out)
}
