---
title: "peer-assessment"
output: html_document
---

# Automate
## [Meets spec] *Running the entire analysis requires rendering one Quarto document*

The analysis is in .qmd format. The one Quarto document renders the analysis successfully. 

## [Meets spec] The analysis runs without errors

Running the entire analysis at once does not show any errors. All objects are saved to the Environment with no issues, and the resulting code along with narration and visualization runs without any errors in the Console.

## [Not yet] *The analysis produces the expected output*

The analysis produces the plot successfully, but the output for the rest of the analysis contains a lot of warnings.  

## [Meets spec] *Data import/cleaning is handled in its own script(s)*

Data cleaning and import are in a separate R scripts. 

# Organize
# [Meets spec] Raw data is contained in its own folder

Raw data is stored in a stand-alone folder called /raw_data. 

## [Meets spec] Intermediate outputs are created and saved to a separate folder from raw data

Processed/cleaned data is saved in a stand-alone folder. 

## [Meets spec] *At least one piece of functionality has been refactored into a function in its own file*

# Document
## [Not yet] The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

The repo has a README explaining where to find the data, the analysis script, the supporting code, and outputs in a Repository Structure section.

## [Not yet] *The README includes a flowchart and text explaining how the analysis works*

The README includes a flowchart. It does not contain text explaining how the analysis works. 

## [Meets spec] *The code is appropriately commented*

I think so, but it's possible that there could be improvements to be made.

## [Meets spec] *Variable and function names are descriptive and follow a consistent naming convention*

The variable names accurately describe the variable. The function names accurately describe the action that the funtion carries out.

# Scale
After cloning the repo on Workbench:

## [Not yet] Running the environment initialization script installs all required packages

Initialization script is inside the first chunk of the .qmd file. There is no separate script to source that yet. 

## [Meets spec] The analysis script runs without errors

When the analysis script is ran in the repository, no errors appear in the Console.

# Collaborate

## [Meets spec] *The student has provided attentive, constructive feedback in a peer review*

## [Not yet] *The student has contributed to a peer’s repo by opening an issue and creating a pull request*


## [Not yet] The repo has at least three closed GitHub issues

 
## [Meets spec] The commit history includes at least one merged branch and a resolved merge conflict

There is one merged branch in the commit history from the interactive sessions. 

## [Meets spec] The rendered analysis is accessible via GitHub Pages

The Quarto document renders properly but does deploys in a funky format in GitHub pages. 