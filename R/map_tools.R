#' save html widget in any folder
#'
#' Wrapper around saveWidgethtml that saves the map in an arbitrary folder using setwd().
#'
#' @param m a map object obtained from leaflet
#' @param path path to save the map
#' @keywords map ,save, htmlwidget
#' @export

savemaphtml <- function(m,path, ...){
  original <- getwd()
  name <- basename(path)
  setwd(dirname(path))
  htmlwidgets::saveWidget(m,name,selfcontained = TRUE, ...)
  setwd(original)
}



