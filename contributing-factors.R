library(shiny)
library(shinydashboard)
library(shinythemes)

factorsTab <-fluidRow(sidebarLayout(
  sidebarPanel(
    sliderInput("bins",
                "Number of bins:",
                min = 1,
                max = 50,
                value = 30)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("CTODTreatmentComparison") #DRUG GRAPH WITH ISSUES I THINK? NOT SHOWING UP 
  ))
)