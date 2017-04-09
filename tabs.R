library(shiny)
library(shinydashboard)
library(shinythemes)
source("national-opioid-trends.R")
source("Connecticut-opioid-trends.R")
source("demographics-and-drugs.R")
source("contributing-factors.R")

tabs <- # First tab content
  tabItems(
    # tabItem(tabName = "dashboard",
    #       fluidRow(
    #         mainPanel(
    #           tabsetPanel(type = "tabs", 
    #                       tabPanel("Plot", plotOutput("plot")), 
    #                       tabPanel("Summary", verbatimTextOutput("summary")), 
    #                       tabPanel("Table", tableOutput("table"))
    #                       
    #                       # box(plotOutput("plot1", height = 250)),
    #                       # box(
    #                       #   title = "Controls",
    #                       #   sliderInput("slider", "Number of observations:", 1, 100, 50)
    #                       # ))
    #            )))),
    
    #National Tab
    # tabItem(tabName = "national", h2("National Opioid Trends"),
    #         fluidRow(
    #           box(plotOutput("data", height = 250)),
    #           box(
    #             title = "Controls",
    #             radioButtons("plot_type", "Filters",
    #                          c("Average Part D Prescribers", "Average Opioid Claims")
    #              )))),
    tabItem(tabName = "national", h2("National Opioid Trends"),
            nationalTab),
    
    #Connecticut Tab
    tabItem(tabName = "Connecticut", h2("Connecticut Opioid Trends"),
            connecticutTab),
    
    #Demographics and Drugs Tab
    tabItem(tabName = "demographics", h2("Demographics and Drugs"),
    demographicsTab),
    #Contributing Factors Tab
    tabItem(tabName = "factors",fluidRow(
      mainPanel(
        tabsetPanel(type = "tabs", 
                    tabPanel("Addiction Treatment Admissions", plotOutput("plot")), 
                    tabPanel("Pharmacies with Naloxone Available", verbatimTextOutput("summary")), 
                    tabPanel("Pharmacies with Naloxone and CT Overdose Locations", tableOutput("table")),
                    
                    #box(plotOutput("plot1", height = 250)),
                    #box(
                    #  title = "Controls",
                    #  sliderInput("slider", "Number of observations:", 1, 100, 50)
                    #))
       
 h2("Conributing Factors"), factorsTab))
    )))
