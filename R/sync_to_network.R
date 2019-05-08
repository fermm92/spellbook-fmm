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
  warning("Deprecated, use robocopy_pfolder() instead")
  command = paste0('XCOPY "." "', net_folder, '" /D /I /S /Y')
  system(command)
}

#' Robocopy project folder to network
#'
#' Copy project files to another folder and overwrite if the ones you have are newer. Deletes deleted files in the destination folder too. Windows only.
#'
#' @param dest_folder destination folder
#' @keywords copy, sync
#' @export
#' @example
#' robocopy_pfolder("path/to.folder")

robocopy_pfolder <- function(dest_folder){
  command = paste0('ROBOCOPY "." "', dest_folder, '" /MIR /XD .*')
  system(command)
}

