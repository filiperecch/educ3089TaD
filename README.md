# EDUC 3089: Text as Data (Support Package)

This package manages the computational environment for the **EDUC 3089 Text as Data** course at the University of Pittsburgh School of Education. It automatically installs necessary dependencies (like `tidyverse`, `quanteda`, and `janitor`) and provides helper functions for project management.

## PART A: One-Time Computer Setup
*Perform these steps only once at the beginning of the semester.*

### 1. Installation

To set up your computer, open RStudio and run the following commands in the Console:

```r
# 1. Install devtools if you don't have it
if (!require("devtools")) install.packages("devtools")

# 2. Install the course package
# This will automatically install all course dependencies.
devtools::install_github("filiperecch/educ3089TaD")
```

*Note: If asked to update packages, you can select `1` (All). If asked to compile packages from source, you can typically type "No".*

### 2. Setup Course Snippets

To save time typing standard headers, we will use RStudio Snippets. Follow these steps to add the course templates to your RStudio:

1. In RStudio, go to **Tools** > **Global Options**.
2. Click the **Code** tab (on the left), then click the **Edit Snippets** button (at the bottom).
3. Scroll to the very bottom of the file.
4. **Copy and paste** the code block below exactly as it appears:

```text
snippet educ_preamble
	# -------------------------------------------------------------------------
	# Lab: ${1:Lab Number}
	# Date: `r Sys.Date()`
	# Author: ${2:Student Name}
	# -------------------------------------------------------------------------

	# 1. Setup ----------------------------------------------------------------
	library(educ3089TaD) # Configures environment & helper functions
	library(conflicted)  # Ensures explicit package management

	# Load Main Data Management Packages
	library(janitor)
	library(tidyverse)

	# 2. Load Paths -----------------------------------------------------------
	load_paths()

	$0

snippet block_new
	# -------------------------------------------------------------------------
	# PART ${1:1}: ${2:SECTION TITLE}
	# -------------------------------------------------------------------------
	$0
```

5. Click **Save**, then click **OK**.

---

## The Lab Workflow
*Follow these steps every time you start a new assignment.*

### Step 1: Create a New Project
Always start a new lab by creating a dedicated R Project.
1. Go to **File** > **New Project...**
2. Select **New Directory** > **New Project**.
3. Name the directory (e.g., `Lab-01-Hello-World`) and choose where to save it.
4. Click **Create Project**.

> **⚠️ Attention:** Look at the top-right corner of your RStudio window. It should show the name of your project (e.g., `Lab-01...`). If it says `Project: (None)`, you are NOT in a project, and your code will likely fail.


### Step 2: Initialize the Project Folders
Once inside your new project, use the Console (bottom-left) and run the following to set up your folder structure:

```r
# Create folder structure and the file_paths.R:
educ3089TaD::create_project_directories()
```

### Step 3: Start a New Script
1. Go to **File** > **New File** > **R Script**.
2. Type `educ_preamble` and hit **Enter** (or select it from the popup menu).
3. This will automatically generate your file header, load the necessary libraries, and source the file paths you just created.

### Step 4: Keep Your Code Organized
As you work through the lab, keep your code organized by using section breaks.
* Type `block_new` and hit **Enter** to insert a clean section divider.
