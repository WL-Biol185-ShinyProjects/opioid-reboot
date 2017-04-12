library(shiny)
library(shinydashboard)
library(shinythemes)
library(tidyverse)
library(readxl)
library(dplyr)
library(ggplot2)



demographicsTab<- fluidPage(
  #changeByState <- read_excel("~/opiod-abuse/Data_sets/changeByState.xlsx"),
  
  #newCBS <-mutate(changeByState, Avg_Part_D_Prescribers = (Part_D_Prescribers_2013 + Part_D_Prescribers_2014)/2) ,
  
  #nCBS <-mutate(newCBS, Avg_Opioid_Claims = (Opioid_Claims_2013 + Opioid_Claims_2014)/2),
  
  #tidyCBS <-mutate(nCBS, Avg_Opioid_Prescribing_Rate = (Opioid_Prescribing_Rate_2013 + Opioid_Prescribing_Rate_2014)/2),
  #write.table(tidyCBS, file = "tidyCBS.csv"),
  
  # Application title
  titlePanel("Racial Factors"),
  #box(plotOutput("distPlot"), height = 500, width = 500),
  box(title = "Controls",
    # radioButtons("plot_type", "Filters", 
    #              choices = list("Average Part D Prescribers" = tidyCBS$Avg_Part_D_Prescribers, "Average Opioid Claims" = tidyCBS$Avg_Opioid_Claims)
    #              , selected="Average Part D Prescribers")), 
  box(plotOutput("racialDemographics"),height = 500, width = 1000)))
  
# 
#     mainPanel(
#       box(      sliderInput("bins",
#                             "Number of bins:",
#                             min = 1,
#                             max = 50,
#                             value = 30)),
#       box(plotOutput("distPlot"),height = 250)
#     )
#   )

