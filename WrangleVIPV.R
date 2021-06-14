#######################################################
#
# Name: WrangleVIPV.R
#
# Description: Wrangle Violent Conflict and IPV data
#
# Date Created: 12 June 2021
#
#######################################################

### Housekeeping
set.seed(467)
setwd("C:/Users/markj/Dropbox/work/projects/janko/violence_ipv")

### Load Necessary Libraries
library(tidyverse)
library(sf)
library(spNNGP)

### Read in Violent Conflict Data
v <- read.csv("C:/Users/markj/Dropbox/work/projects/janko/violence_ipv/data/ged201-csv/ged201.csv")

### Filter v to countries of interest: Burundi, DR Congo, Rwanda, South Sudan, Sudan, Uganda
v <- v %>% filter(country %in% c("Burundi","DR Congo (Zaire)","Rwanda","South Sudan","Sudan","Uganda"))
