# Exceeds spec 
  ### At least one piece of functionality has been re factored into a function in its own file
    The task of making graphs, converting of dates to week, the converting of weeks to dates, and the rolling
    mean have all been put into their own functions.
    I'd like for you to specifically look at my rolling mean function as I created it by myself and feel that it       exceeds the expectations of the course. 
  ### The analysis produces the expected output
    The graph created by my function is very close to the one we tried to replicate. All of the limits,
    axis-breaks, axis labels, and more are close to and/or the same as Figure 3.
    
# Collaboration
    I feel that peer feedback went okay, but I found that it did not help me much overall as my project was pretty     close to done. I struggled to give feedback as my partner did not have an up to date version of their project     on github which made most of the feedback I gave obsolete. I did give them in person feedback which I think       helped, such as letting them know that the date range they were using was wrong.

    Issues
    
    https://github.com/willrmull/eds-214-water-quality/issues/10
    https://github.com/willrmull/eds-214-water-quality/issues/9
    https://github.com/willrmull/eds-214-water-quality/issues/8
    
    Merge Conflict
    https://github.com/willrmull/eds-214-water-quality/commit/a4008a5c29a42af4e0e71d2d4000441ae317e563

# Instructor feedback

## Automate

[M] **Running the entire analysis requires rendering one Quarto document**

[M] The analysis runs without errors

[NY] **The analysis produces the expected output**
- Missing `geom_vline()` to denote when Hurricane hugo occured in `ggplot()` object

I met this criteria now

[M] **Data import/cleaning is handled in its own script(s)**

## Organize

[M] Raw data is contained in its own folder

[M] Intermediate outputs are created and saved to a separate folder from raw data

[E] **At least one piece of functionality has been refactored into a function in its own file**

## Document

[M] The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

[M] **The README includes a flowchart and text explaining how the analysis works**

[M] **The code is appropriately commented**

[M] **Variable and function names are descriptive and follow a consistent naming convention**

## Scale

After cloning the repo on Workbench:

[M] Running the environment initialization script installs all required packages

[M] The analysis script runs without errors

## Collaborate

[M] **The student has provided attentive, constructive feedback in a peer review**

[M] **The student has contributed to a peer's repo by opening an issue and creating a pull request**

[M] The repo has at least three closed GitHub issues

[M] The commit history includes at least one merged branch and a resolved merge conflict

[M] The rendered analysis is accessible via GitHub Pages
