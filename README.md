## Water Quality Analysis of Puerto Rico Streams 
This repository contains code used for a final project done in August of 2025. It's goal is to plot the moving average of chemical concentrations in four Puerto Rican streams between the years 1988 and 1994. The purpose of this project is to create an analytical workflow to replicate Figure 3 of the study by Schaefer et al. (2000). This workflow applies the basic principles of a reproducible data analysis workflow (Lowndes et al. 2017). 

# Process Flow
![Flow Chart](https://github.com/willrmull/eds-214-water-quality/blob/687059c7fa60ac55554d9b1635ac3d2d6dad7a05/outputs/figs/flow_chart.png)

In order to replicate the visualizations produced by Schaefer et al. (2000), the data is read in and filtered to contain only measurements between 1988 and 1994. After that, each of the four datasets have a column added containing the number of weeks which had passed since the inital observation. Using this week information, the moving average of five columns is taken in 9 week intervals across the entire dataset. After that, the week column is converted back to standard dates, and the four datasets are merged. Each variable is graphed seperatly and later combined into a stacked plot which is output to the user.  

# Contents 
<table>
    <tr>
      <td width="50%">
        Data Files
      </td>
      <td width="50%">
        Raw data files are located in the data folder of the repository. \n The cleaned data used in the scripts can be found in the "outputs" folder
      </td>
     </tr>
    </tr>
        <td width="50%">
        Analysis Script
      </td>
      <td width="50%">
        The analysis script is titled "paper.qmd" and can be found in the folder titled "paper"
      </td>
    </tr>
    </tr>
        <td width="50%">
        Supporting Code
      </td>
      <td width="50%">
        The functions as well as the script used to read in data are located in the "R" folder
      </td>
    </tr>
    </tr>
        <td width="50%">
        Outputs
      </td>
      <td width="50%">
        The figure of the five graphs is output into the "figs" folder located in "outputs"
      </td>
    </tr>
  </table>

# Data Source
  > McDowell, W. and International Institute of Tropical Forestry(IITF), 
  > USDA Forest Service.. 2024. Chemistry of stream water from the 
  > Luquillo Mountains ver 4923064. Environmental Data       
  > Initiative. https://doi.org/10.6073/pasta/f31349bebdc304f758718f4798d25458 
  > (Accessed 2025-08-26)
<<<<<<< HEAD
<img src="outputs/figs/merged_plot.jpg" alt="hi" class="inline"/> 
=======

![Grqph output by the paper.qmd file](https://github.com/willrmull/eds-214-water-quality/blob/80c9bfb6f3f32111297221b491ecfbc2619f195d/outputs/figs/merged_plots.jpg)
>>>>>>> 3892ed1520a4dca7edfcbd1c40cd1b7705238cb4
