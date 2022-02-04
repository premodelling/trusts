# Title     : InstallPackages.R
# Objective : TODO
# Created by: greyhypotheses
# Created on: 26/01/2022


InstallPackages <- function (){

  packages <- c('tidyverse', 'data.table', 'ggplot2', 'rmarkdown', 'rstatix', 'latex2exp', 'tufte', 'equatiomatic')

  # Install
  .install <- function(x){
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      if (x == 'rmarkdown') {tinytex::install_tinytex()}
    }
  }
  lapply(packages, .install)

  # Activate
  .activate <- function (x){
    library(x, character.only = TRUE)
    if (x == 'rmarkdown') {library(tinytex)}
  }
  lapply(packages[!(packages %in% c('tidyverse'))], .activate)

  # Active libraries
  sessionInfo()

}
