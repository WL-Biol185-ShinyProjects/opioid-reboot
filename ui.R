library(shiny)
source("dash.R")
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
    #Creates dashboard
    dashboardPage(title ="Local Factors Contributing to Opioid Overdoses in Connecticut", skin = "black",
                  header, sidebar, body)
    
      #CHORO MEDICARE CLAIMS BY STATE START
      #mainPanel(
        #plotOutput("CTODLocations") on CT tab 
        #plotOutput("CTODTreatmentComparison") on CT tab
        #plotOutput("racialDemographics") on demographics tab
        #plotOutput("CTODTreatmentComparison") on contributing factors tab
      #plotOutput("prescribersByState") on national tab
        #plotOutput("claimsByState")  on national tab
        #leafletOutput("choroClaims")
       #leafletOutput("choroOD")
        #Drug comparisons is not working
        #plotOutput("drugComparisons")
     # )
      #CHOROR MEDICARE CLAIMS BY STATE END
  )
  

