#' save html widget in any folder
#'
#' Wrapper around saveWidgethtml that saves the map in an arbitrary folder using setwd().
#'
#' @param m a map object obtained from leaflet
#' @param path path to save the map
#' @keywords map ,save, htmlwidget
#' @export

savemaphtml <- function(m,path){
  original <- getwd()
  name <- basename(path)
  setwd(dirname(path))
  htmlwidgets::saveWidget(m,name,selfcontained = TRUE)
  setwd(original)
}


#' Add Aecom Logo
#'
#' Adds aecom logo to leaflet maps.
#'
#' @param map map for the pipe to work
#' @param position logo position parameter see addLogo from mapview for options.
#' @keywords map ,save, htmlwidget
#' @export

addAecomLogo <- function(map,position = "bottomleft"){
  mapview::addLogo(map = map,
                   img = "https://www.aecom.com/wp-content/themes/aecom/images/aecom-logo.svg",
                   position = position,
                   url = "https://www.aecom.com")
}
