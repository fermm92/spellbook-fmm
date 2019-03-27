#' read_emme
#'
#' Read a emme mat file as a list of the individual matrices
#'
#' @param file file with emme mat format
#' @param rbind_output Logical. If true binds the optput into one list.
#' @keywords read, emme
#' @export
#' @example
#' read_emme("path_to_emme_file.mat", rbind_output = FALSE)


read_emme <- function(file, rbind_output = "FALSE"){
  emme <- readLines(file)

  mat_header1 <- stringr::str_detect(emme, regex("^d.*", ignore_case = TRUE))
  emme <- emme[!mat_header1]

  mat_header <- stringr::str_detect(emme, "^a.*")
  # We want to add an end of file header to the index for the loop
  mat_index <- c(which(mat_header == TRUE), length(emme) + 1)

  mat_names <- emme[mat_header]
  mat_names <- stringr::str_split(mat_names, pattern = " ")
  mat_names <-
    do.call(rbind, mat_names) %>% as.data.frame() %>% .$V5 %>% as.character()

  output <- list()

  for (i in 1:(NROW(mat_index)-1)) {
    # we read the data between two titles
    a <- emme[c((mat_index[i] + 1):(mat_index[i + 1] - 1))]
    a <- stringr::str_split(a, pattern = " ")
    a <- as.data.frame(do.call(rbind, a), stringsAsFactors = FALSE)
    a$V1 <- NULL
    names(a) <- c("origin", "destination", "trips")
    a$trips <- as.numeric(a$trips)
    a$matrix_title <- mat_names[i]
    output[[mat_names[i]]] <- a
  }
  if (rbind_output) {
    output <- do.call(rbind, output)
    row.names(output) <- c()
  }
  return(output)
}

# file = "./data/2031_HIFDW_TripEndModel_(28-01-2019)/2031_HIFDW_HBEB_TripEnds.mat"
# HBEB <- read_emme(file, rbind_output = TRUE)
