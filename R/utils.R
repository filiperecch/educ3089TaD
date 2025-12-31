#' Load Project Paths
#' @export
load_paths <- function() {
  if (file.exists("file_paths.R")) {
    source("file_paths.R", local = .GlobalEnv)
    message("\u2714 Paths loaded successfully.")
  } else {
    stop(
      "\n\u274C ERROR: 'file_paths.R' not found.\n",
      "Please, confirm you are working within a project and run:
      crumbsTADeduc3089::create_project_directories()",
      call. = FALSE
    )
  }
}
