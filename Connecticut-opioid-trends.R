library(shiny)
library(shinydashboard)
library(shinythemes)
connecticutTab <- fluidRow(
  plotOutput("CTODLocations"),
  plotOutput("CTODTreatmentComparison"),
  
  box(
    title = "Controls",
    sliderInput("slider", "Number of observations:", 1, 100, 50)
  ))