library(shiny)
source("choroMedicareClaimsByState.R") 
source("ODTreatmeantAdminsCT.R")
source("ODByOpioidType.R")
source("ODLocationBarGraph.R")

shinyUI(
  fluidPage(
    #plotOutput("medicareClaimsByState")
    #plotOutput("CTODTreatmentComparison")
    #plotOutput("drugComparisons")
    plotOutput("CTODLocations")
  ))