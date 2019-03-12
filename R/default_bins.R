#' default_bins
#'
#' It gives you some default bins using jenks breaks and a midpoint of 0
#'
#' @param df a dataframe with only numeric columns or a vector
#' @param midpoint 0 by efault but can be changed
#' @keywords geometry, coordinates, directions, nb,sb,eb,wb
#' @export


default_bins <- function(df, midpoint = 0){
  # Gets a dataframe or vector and gives you some good looking bins with a midpoint
  # Get Jenks Natural breaks
  a <- df %>%
    unlist()
  b <- a[a> midpoint]
  b <- b %>% BAMMtools::getJenksBreaks(k = 3)

  a <- a[a< midpoint]
  a <- (-(-a %>% BAMMtools::getJenksBreaks(k = 3)))
  # see which ones are negative
  a <- sort(c(a, midpoint ,b))
  negs <- a < 0
  # apply ceiling for the abs of the vector to the nearest 100
  a <- ceiling(abs(a)/100000)*100
  # reconvert to negative
  a[negs] <- a[negs] *-1

  return(a)
}
