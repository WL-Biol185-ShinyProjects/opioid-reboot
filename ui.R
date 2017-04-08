library(shiny)
#source("choroMedicareClaimsByState.R") 
#source("ODTreatmeantAdminsCT.R")
#source("ODByOpioidType.R")
#source("ODLocationBarGraph.R")
#source("testHistPlot.R")
 
#shinyUI(
  fluidPage(
    #plotOutput("medicareClaimsByState")
    #plotOutput("CTODTreatmentComparison")
    #plotOutput("drugComparisons")
    #plotOutput("CTODLocations")
    # Sidebar with a slider input for number of bins 
    #TEST HIST PLOT START
    #sidebarLayout(
    #  sidebarPanel(
     #   sliderInput("bins",
     #               "Number of bins:",
     #               min = 1,
     #               max = 300,
     #               value = 30)
     # ),
      # Show a plot of the generated distribution
      #mainPanel(
      #  plotOutput("histPlot")
     # )
      #TEST HIST PLOT END
      
      #CHORO MEDICARE CLAIMS BY STATE START
      mainPanel(
        #plotOutput("CTODLocations")
        #plotOutput("CTODTreatmentComparison")
        #plotOutput("racialDemographics")
        #plotOutput("CTODTreatmentComparison")
      #plotOutput("prescribersByState")
        #plotOutput("claimsByState")
        leafletOutput("choroClaims")
        #Drug comparisons is not working
        #plotOutput("drugComparisons")
      )
      #CHOROR MEDICARE CLAIMS BY STATE END
  )