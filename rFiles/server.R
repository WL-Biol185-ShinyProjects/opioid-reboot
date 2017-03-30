library(shiny)

shinyServer(function(input, output){
  
  output$medClaimsByState <- renderPlot()
  
  
  
})
