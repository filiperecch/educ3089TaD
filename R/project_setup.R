#' Creates the standard set of subdirectories for the EDUC 3089 Course
#'
#' This function sets up the data, script, analysis, and output folders,
#' and generates the necessary helper files (README, file_paths.R, .gitignore).
#'
#' @export
create_project_directories <- function() {

  # 1. Define Standard Folders
  folders <- c(
    "data",
    "script",
    "analysis",
    "R",
    "presentations",
    "support_files",
    fs::path("script", "R_script"),
    fs::path("script", "stata_do"),
    fs::path("script", "python"),
    fs::path("analysis", "tables"),
    fs::path("analysis", "figures"),
    fs::path("analysis", "pdfs"),
    fs::path("analysis", "reports"),
    fs::path("data", "raw")
  )

  # 2. Create Folders
  # showWarnings = FALSE prevents "file already exists" warnings
  purrr::walk(folders, dir.create, showWarnings = FALSE)

  # 3. Create Helper Files
  add_file_paths()
  add_readme()
  add_gitignore()

  message("\n\u2728 Project setup complete! folders created.")
}

#' Adds a standardized file_paths.R project root directory
#' @export
add_file_paths <- function(dir_R = here::here()){

  file_names_template <- glue::glue('
# -------------------------------------------------------------------------
# Standard Project Paths
# -------------------------------------------------------------------------
library(fs)
library(here)

path_root               <- fs::path(here::here())
path_data_root          <- fs::path(here::here("data"))
path_data_raw           <- fs::path(path_data_root, "raw")

path_analysis_root      <- fs::path(here::here("analysis"))
path_figures_folder     <- fs::path(path_analysis_root, "figures")
path_tables_folder      <- fs::path(path_analysis_root, "tables")
path_pdfs_folder        <- fs::path(path_analysis_root, "pdfs")
path_reports_folder     <- fs::path(path_analysis_root, "reports")

path_script_root        <- fs::path(here::here("script"))
path_script_R           <- fs::path(path_script_root, "R_script")
path_script_python      <- fs::path(path_script_root, "python")
path_script_stata       <- fs::path(path_script_root, "stata_do")

path_presentations_root <- fs::path(here::here("presentations"))
path_r_objects          <- fs::path(here::here("R"))
path_support_files      <- fs::path(here::here("support_files"))

message("✔ Paths loaded successfully.")
')
  writeLines(file_names_template, fs::path(dir_R, "file_paths.R"))
  message("✔ Created file_paths.R")
}

#' Adds a standardized README file
#' @export
add_readme <- function(dir_proj = here::here()){

  readme_text <- "
# Project Name

**Course:** EDUC 3089: Text as Data
**Author:** **Date:** ## Overview
This project follows the standardized directory structure for EDUC 3089.
It organizes course materials to facilitate reproducible research, focusing on efficient
workflow management and increasing the retrievability of code and insights.

## Structure
- `data/`: Raw and processed data.
- `script/`: R scripts for analysis.
- `analysis/`: Output tables, figures, and reports.
"

  writeLines(readme_text, fs::path(dir_proj, "README.md"))
  message("✔ Created README.md")
}

#' Adds a standardized gitignore file
#' @export
add_gitignore <- function(path = here::here()){
  content <- ".Rproj.user\n.Rhistory\n.RData\n.httr-oauth\n.DS_Store\n"
  writeLines(content, fs::path(path, ".gitignore"))
  message("✔ Created .gitignore")
}
