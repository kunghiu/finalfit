#' Extract \code{glmerMod} model fit results to dataframe: \code{finalfit} model
#' extracters
#'
#' Takes output from \code{lme4::\link[lme4]{glmer}} and extracts to a
#' dataframe, convenient for further processing in preparation for final results
#' table.
#'
#' \code{fit2df.glmerMod} is the model extract method for standard
#' \code{lme4::\link[lme4]{glmer}} models and for the
#' \code{finalfit::\link{glmmixed}} model wrapper.
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
#' @return A dataframe of model parameters. When \code{metrics=TRUE} output is a
#'   list of two dataframes, one is model parameters, one is model metrics.
#'
#' @family \code{finalfit} model extractors
#'
#' @examples
#' library(finalfit)
#' library(dplyr)
#'
#' explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
#' random_effect = "hospital"
#' dependent = "mort_5yr"
#'
#' colon_s %>%
#'   glmmixed(dependent, explanatory, random_effect) %>%
#' 	 fit2df(estimate_suffix=" (multilevel")
#'
fit2df.glmerMod = function(.data, condense=TRUE, metrics=FALSE, remove_intercept=TRUE,
                           explanatory_name = "explanatory",
                           estimate_name = "OR",
                           estimate_suffix = "",
                           p_name = "p",
                           digits=c(2,2,3), confint_sep = "-", ...){

  df.out = extract_fit(.data=.data, explanatory_name=explanatory_name,
                       estimate_name=estimate_name, estimate_suffix=estimate_suffix,
                       p_name=p_name, digits=digits)

  if (condense==TRUE){
    df.out = condense_fit(df.out, explanatory_name=explanatory_name,
                          estimate_name=estimate_name, estimate_suffix=estimate_suffix,
                          p_name=p_name, digits=digits, confint_sep=confint_sep)
  }

  if (remove_intercept==TRUE){
    df.out = remove_intercept(df.out)
  }


  # Extract model metrics
  if (metrics==TRUE){
    x = .data
    n_model = length(x@resp$mu)
    n_groups = summary(x)$ngrps
    aic = round(summary(x)$AICtab[[1]], 1)
    auc = round(pROC::roc(x@resp$y, x@resp$mu)$auc[1], 3)
    metrics.out = paste0(
      "Number in model = ", n_model,
      ", Number of groups = ", paste(n_groups, collapse="/"),
      ", AIC = ", aic,
      ", C-statistic = ", auc)
  }

  if (metrics==TRUE){
    return(list(df.out, metrics.out))
  } else {
    return(df.out)
  }
}
