library(ggplot2)
library(dplyr)
library(tidyverse)
library(readr)

odCT<- read_csv("~/opioid-reboot/odCT.csv")

CTODLocations <- odCT %>%
  filter(Heroin == "Y") %>%
  filter(Location == "Residence" | Location == "Hospital" | Location == "Other") %>%
  ggplot(aes(Location)) + geom_bar()
