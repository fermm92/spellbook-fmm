#' ----------
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
