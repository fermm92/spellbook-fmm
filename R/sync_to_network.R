#' syncto network
#'
#' Copy project files to another folder and overwrite if the ones you have are newer.
#'
#' @param folder destination folder
#' @keywords copy, sync
#' @export
#' @example
#' sync_to_network("path/to.folder")

sync_to_network <- function(net_folder){
  command = paste0('XCOPY "." "', net_folder, '" /D /I /S /Y')
  system(command)
}

