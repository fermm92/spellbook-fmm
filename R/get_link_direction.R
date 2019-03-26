#' get_directions
#'
#' From a set of geometry it calculates the main direction between the first and last points
#' aka directionaliser
#'
#' @param geometry The geometry column of an sf object
#' @param minor Logical. If true gives the minor direction of the coordinate pair. FALSE by default.
#' @keywords geometry, coordinates, directions, nb,sb,eb,wb
#' @export
#' @example
#' sf_object$direction <- get_directions(sf_object$geometry)

get_directions <- function(geometry, minor = FALSE) {
  coords <- lapply(geometry,st_coordinates)
  coords <- lapply(coords, function(x) data.frame((x)))
  coords <- lapply(coords, function(x) {
    x1 <- x$X[1]
    x2 <- x$X[nrow(x)]
    y1 <- x$Y[1]
    y2 <- x$Y[nrow(x)]
    return(data.frame(x1,x2,y1,y2))
  })
  coords <- dplyr::bind_rows(coords) # to change to base if possible
  coords$i <- coords$x2 - coords$x1
  coords$j <- coords$y2 - coords$y1
  coords$d <- sqrt((coords$x2-coords$x1)^2 + (coords$y2-coords$y1)^2)
  coords[,c("i","j")] <- coords[,c("i","j")]/coords$d
  coords$direction <- abs(coords$i) > abs(coords$j)
  if (minor) {
    coords$direction <- abs(coords$i) < abs(coords$j)
  }
  coords$direction[coords$direction == TRUE  & coords$i>0] <- "EB"
  coords$direction[coords$direction == TRUE  & coords$i<0] <- "WB"
  coords$direction[coords$direction == FALSE & coords$j>0] <- "NB"
  coords$direction[coords$direction == FALSE & coords$j<0] <- "SB"

  return(coords$direction)
}
