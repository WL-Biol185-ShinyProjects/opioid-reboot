library(shiny)
library(shinydashboard)
library(shinythemes)
# 
# nationalTab <-tabItem(tabName = "national", h2("National Opioid Trends"),
#                       fluidRow(
#                         box(plotOutput("data", height = 250)),
#                         box(
#                           title = "Controls",
#                           radioButtons("plot_type", "Filters",
#                                        c("Average Part D Prescribers", "Average Opioid Claims")
#                           ))))
nationalTab <- fluidRow(
  #fluidRow(
   # mainPanel(
     # tabsetPanel(type = "tabs", 
    #              tabPanel("Addiction Treatment Admissions", plotOutput("plot")), 
     #             tabPanel("Pharmacies with Naloxone Available", verbatimTextOutput("summary")), 
    #              tabPanel("Pharmacies with Naloxone and CT Overdose Locations", tableOutput("table")),
       
 plotOutput("claimsByState", height = 250, width = 1000),
plotOutput("prescribersByState", height = 250, width = 1000))
  #box(
  #  title = "Controls",
  #  radioButtons("plot_type", "Filters",
  #               c("Average Part D Prescribers", "Average Opioid Claims")
  
