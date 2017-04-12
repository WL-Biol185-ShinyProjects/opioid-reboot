
library(shiny)
library(shinydashboard)
library(shinythemes)
#source("national-opioid-trends.R")
# source("tabs.R")

#fluidPage(
#titlePanel("Local Factors Contributing to Opioid Overdoses in Connecticut"),

header <- dashboardHeader(title= "Menu")
sidebar<- dashboardSidebar(    
  sidebarMenu(
    #menuItem("About", tabName = "about", icon = icon("book"), badgeColor = "maroon"),  
    #menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"), badgeColor = "maroon" ),
    menuItem("National Opioid Trends", tabName = "national", icon = icon("arrow-right"), badgeColor = "maroon"),
    menuItem("Connecticut Opioid Trends", tabName = "Connecticut", icon = icon("arrow-right"), badgeColor = "maroon"),
    menuItem("Demographics", tabName = "demographics", icon = icon("pencil"), badgeColor = "maroon"),
    menuItem("Opiods", tabName = "factors", icon = icon("th"), badgeColor = "maroon")
  ))

body <- dashboardBody(tabItems( tabItem(tabName = "national", 
                                        h2("National Opioid Trends"),
                                        fluidRow(plotOutput("claimsByState", height = 250, width = 1000),
                                                 plotOutput("prescribersByState", height = 250, width = 1000)
                                                )
                                        ),
                                tabItem(tabName = "Connecticut",
                                        h2("Connecticut Opioid Trends"),
                                        fluidRow(plotOutput("CTODLocations"),
                                                  plotOutput("CTODTreatmentComparison")
                                        )),
                                tabItem(tabName = "demographics", h2("Demographics"),
                                        fluidRow(plotOutput("racialDemographics")
                                                 )
                              ),
                              tabItem(tabName = "factors", h2("Opioid Comparisons"), fluidRow(plotOutput("drugComparisons")
                                                                                            )) 
                                              
                     
))

