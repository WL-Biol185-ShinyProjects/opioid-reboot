library(shiny)
source("choroMedicareClaimsByState.R") 
source("ODTreatmeantAdminsCT.R")
source("ODByOpioidType.R")
source("ODLocationBarGraph.R")

shinyServer(function(input, output){
  #output$medicareClaimsByState <- renderPlot({medicareClaimsByState}) 
  #output$CTODTreatmentComparison <- renderPlot({CTODTreatmentComparison})
  #output$drugComparisons <- renderPlot({drugComparisons})
  output$CTODLocations <- renderPlot({CTODLocations})
})

