# EDUC 3089: Text as Data (Support Package)

This package provides the computational environment, dependencies, and RStudio snippets for the **Text as Data** course at the University of Pittsburgh School of Education.

## 1. Installation

To set up your computer for the semester, open RStudio and run the following commands in the Console:

```r
# 1. Install devtools if you don't have it
if (!require("devtools")) install.packages("devtools")

# 2. Install the course package
# This will automatically install tidyverse, quanteda, and other course dependencies.
devtools::install_github("filiperecch/educ3089TaD")
