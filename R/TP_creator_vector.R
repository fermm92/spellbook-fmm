#' convert_hour_to_tp
#'
#' Obtains the TP membership from an hour list and a definition of time periods
#'
#' @param hour numeric vector of hours
#' @param tp_list a list of tp with the hours starting of the time periods
#' @keywords am,ip,pm, tp, hour
#' @export
#' @example
#' sf_object$tp <- convert_hour_to_tp(sf_object$hour, tp_list = list(AM = 7:9, IP = 10:15, PM = 16:18))

convert_hour_to_tp <- function(hour,  tp_list = list(AM = 7:9,	PM = 16:18,  IP = 10:15)){
  #hour column needs to be a vector

  tp <- rep_len("OP",length.out = NROW(hour))

  for (i in seq_along(tp_list)) {
    tp[hour %in% tp_list[[i]]] <- names(tp_list)[i]
  }
  return(tp)
}

