library(shiny)
source("choroMedicareClaimsByState.R") 

shinyUI(
  fluidPage(
  plotOutput("medicareClaimsByState")
))