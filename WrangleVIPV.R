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
library(INLA)
library(rnaturalearth)
library(rnaturalearthdata)

### Read in Violent Conflict Data
v <- read.csv("C:/Users/markj/Dropbox/work/projects/janko/violence_ipv/data/ged201-csv/ged201.csv")

### Filter v to countries of interest: Burundi, DR Congo, Rwanda, South Sudan, Sudan, Uganda
v <- v %>% filter(country %in% c("Angola","Burundi","Central African Republic","Congo","DR Congo (Zaire)","Rwanda","South Sudan","Sudan","Tanzania","Uganda","Zambia"))
v <- v %>% filter (year>=2000)

world <- ne_countries(scale="medium",returnclass="sf")

countries <- world %>% filter(name %in% c("Angola","Burundi","Central African Rep.","Congo","Dem. Rep. Congo","Rwanda","S. Sudan","Sudan","Tanzania","Uganda","Zambia"))

### Map Violent Conflicts
gg_v <- ggplot()+
          geom_sf(data=world)+
          coord_sf(xlim = c(10,40), ylim = c(-20,10), expand = FALSE)+
          geom_point(data=v,aes(x=longitude,y=latitude,colour=best))+
          scale_colour_viridis_c(option = "plasma", trans = "sqrt")+
          theme_bw()
gg_v
