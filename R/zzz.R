.onAttach <- function(libname, pkgname) {
  packageStartupMessage("\nWelcome to EDUC 3089: Text as Data")

  # Set Conflict Rules (filter, select, lag)
  if (requireNamespace("conflicted", quietly = TRUE)) {
    conflicted::conflict_prefer("filter", "dplyr", quiet = TRUE)
    conflicted::conflict_prefer("select", "dplyr", quiet = TRUE)
    conflicted::conflict_prefer("lag",    "dplyr", quiet = TRUE)
  }

}
