library(shiny)
source("choroMedicareClaimsByState.R") 

shinyServer(function(input, output){
  output$medicareClaimsByState <- renderPlot({medicareClaimsByState}) 
  #output$medClaimsByState <- renderPlot()
  #SHINY INPUT HERE
})
#shinyServer(function(output) { 
  
  #output$distPlot <- renderPlot({plotHandler(input)}) 
  #   output$distPlot <- renderPlot({ggplot(tidyCBS, aes(State_Abbreviation, input$plot_type, fill = Avg_Opioid_Prescribing_Rate)) +  
  #     geom_bar(stat = 'identity') +  
  #     theme(axis.text.x = element_text(angle = 60, hjust = 1))}) 
  #output$v1 <- renderPlot({v1}) 
  #output$v2 <- renderPlot({v2}) 
  
#})

