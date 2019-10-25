
#' Get bank holidays for the UK
#'
#' @return a vector of Date Class with bank holidays until from 1998 to 2100
#' @export
#'
get_bank_holidaysUK <- function(){
  httr::GET("https://www.dmo.gov.uk/media/15008/ukbankholidays.xls",
            httr::write_disk(tf <- tempfile(fileext = ".xls")))
  x <- readxl::read_xls(tf)
  as.Date(na.omit(x[[1]]))
}
