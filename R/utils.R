#' Load Project Paths
#'
#' Sources the 'file_paths.R' file if it exists. If not, it provides an
#' error message instructing the student to set up their project.
#'
#' @export
load_paths <- function() {
  # Check if the file exists in the current working directory
  if (file.exists("file_paths.R")) {

    # Source the file into the Global Environment so students can use the variables
    source("file_paths.R", local = .GlobalEnv)

    # Optional: Print a subtle success message
    message("\u2714 Paths loaded successfully.")

  } else {
    # Stop execution with a clear, actionable error
    stop(
      "\n\n\u274C CRITICAL ERROR: 'file_paths.R' not found.\n",
      "--------------------------------------------------------\n",
      "It looks like you haven't set up your project folder yet.\n",
      "Please run the following command in your Console:\n\n",
      "    educ3089TaD::create_project_directories()\n\n",
      "Then try running this script again.",
      call. = FALSE
    )
  }
}

#' Install Extra Course Packages
#'
#' Installs heavy or system-dependent packages (like pdftools, tesseract, text).
#' Run this function if you need PDF processing, OCR, or Python-based text models.
#'
#' @export
install_extra_packages <- function() {

  # List of suggested packages (must match Suggests in DESCRIPTION)
  pkgs <- c("mall", "pdftools", "tesseract", "text")

  # Filter to only those NOT already installed
  new_pkgs <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]

  if(length(new_pkgs)) {
    message("The following extra packages will be installed: ", paste(new_pkgs, collapse = ", "))
    message("Note: Some of these (like pdftools/tesseract) may require external system libraries.")
    install.packages(new_pkgs)
  } else {
    message("All extra packages are already installed!")
  }
}
