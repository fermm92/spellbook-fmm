#' default_bins
#'
#' It gives you some default bins using jenks breaks and a midpoint of 0
#'
#' @param df a dataframe with only numeric columns or a vector
#' @param midpoint 0 by efault but can be changed
#' @param round_to round the bins to their ceiling (absolute)by default hundreds (100)
#' @param n_breaks Number of breaks to each side of the midpoint by default 3
#' @keywords geometry, coordinates, directions, nb,sb,eb,wb
#' @importFrom magrittr %>%
#' @export


default_bins <- function(df, midpoint = 0, round_to = 100, n_breaks = 3){
  # Gets a dataframe or vector and gives you some good looking bins with a midpoint
  # Get Jenks Natural breaks
  a <- df %>%
    unlist()
  b <- a[a> midpoint]
  b <- b %>% BAMMtools::getJenksBreaks(k = n_breaks)

  a <- a[a< midpoint]
  a <- (-(-a %>% BAMMtools::getJenksBreaks(k = n_breaks)))
  # see which ones are negative
  a <- sort(c(a, midpoint ,b))
  negs <- a < 0
  # apply ceiling for the abs of the vector to the nearest round_to
  a <- ceiling(abs(a)/round_to)*round_to
  # reconvert to negative
  a[negs] <- a[negs] *-1

  return(a)
}
