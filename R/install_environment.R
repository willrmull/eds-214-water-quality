#Install Environemnt
install.packages("here")
install.packages("janitor")
install.packages("tidyverse")
install.packages("lubridate")
install.packages("patchwork")
install.packages("hrbrthemes")
install.packages("viridis")
install.packages("paletteer")
install.packages("knitr")
install.packages("kableExtra")
candidates <- c( Sys.getenv("R_PROFILE"),
                 file.path(Sys.getenv("R_HOME"), "etc", "Rprofile.site"),
                 Sys.getenv("R_PROFILE_USER"),
                 file.path(getwd(), ".Rprofile"),
                 file.path(Sys.getenv("HOME"), ".Rprofile"))
candidates <- c( Sys.getenv("R_PROFILE"),
                 file.path(Sys.getenv("R_HOME"), "etc", "Rprofile.site"),
                 Sys.getenv("R_PROFILE_USER"),
                 file.path(getwd(), ".Rprofile"),
                 file.path(Sys.getenv("HOME"), ".Rprofile"))