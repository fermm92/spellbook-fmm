#' save html widget in any folder
#'
#' Holla
#'
#' @param m a map object obtained from leaflet
#' @param path path to save the map
#' @keywords map ,save, htmlwidget
#' @export

savemaphtml <- function(m,path){
  name <- basename(path)
  setwd(dirname(path))
  htmlwidgets::saveWidget(m,name,selfcontained = TRUE)
}
