library(shiny)
library(leaflet)
library(ggplot2)
library(dplyr)
library(rgdal)
library(readr)
library(tidyverse)

#source("choroMedicareClaimsByState.R") 
#source("ODTreatmeantAdminsCT.R")
#source("ODByOpioidType.R")
##source("ODLocationBarGraph.R")
#source("testHistPlot.R")
#natlClaims <- read.csv("~/opioid-reboot/natlClaims.csv")
#stateAbbrev <- read.csv("~/opioid-reboot/stateAbbrev.csv")
#odCT<- read.csv("~/opioid-reboot/odCT.csv")
#TreatmentCT <- read.csv("~/opioid-reboot/TreatmentCT.csv")
ODbyDrug <- read_csv("~/opioid-reboot/ODbyDrug.csv")
#Building important things for choro 
# OpiClaimsbyState <- natlClaims %>%
#   group_by(ProviderState) %>%
#   summarise(TotalClaims = sum(TotalClaimCount))
# TotalClaims <-select(OpiClaimsbyState,TotalClaims)
# names(OpiClaimsbyState)[names(OpiClaimsbyState) == 'ProviderState'] <- 'X1'
# OpiState <- left_join(OpiClaimsbyState, stateAbbrev, by = "X1")
# write.table(OpiState, file = "ClaimsbyState.txt")
# names(OpiState)[names(OpiState) == 'State'] <- 'NAME'
# map  <- rgdal::readOGR("gz_2010_us_040_00_5m.json", "OGRGeoJSON")
# data <- read.table("ClaimsbyState.txt", stringsAsFactors = FALSE)
# END OF BUILDING IMPORTANT THINGGS FOR MEDICARE CLAIMS BY STATE CHORO

#BEGINING OF IMPORTANT THINGS OF IMPORTANT ODTREATMEANTADMINSCT

AdmissionsbyTown <- TreatmentCT %>%
  group_by(Town) %>%
  summarise(SumAdmissions = sum(Admissions))


ODbyCity <- odCT %>%
  group_by(deathCity) %>%
  count(deathCity)


# ODbyCity = dataframe
# old.var.name = deathCity
# new.var.name = Town

names(ODbyCity)[names(ODbyCity) == 'deathCity'] <- 'Town'
#this changes the column name for deathCity so it matches the column name in AdmissionsbyTown


AbT <- mutate_each(AdmissionsbyTown, funs(toupper))
#This makes a version of AdmissionsbyTown that has all town names capitalized to match ODbyCity

TreatmentOD <- inner_join(AbT, ODbyCity, by = "Town")
#This puts the number of ODs and Treatment Admissions into the same table so that they can be correlated by town

names(TreatmentOD)[names(TreatmentOD) == 'n'] <- 'Overdoses'
names(TreatmentOD)[names(TreatmentOD) == 'SumAdmissions'] <- 'AddictionTreatmentAdmissions'
TreatmentOD$AddictionTreatmentAdmissions <-as.numeric(TreatmentOD$AddictionTreatmentAdmissions)


fit <- lm(Overdoses ~ AddictionTreatmentAdmissions, data = TreatmentOD)
#summary(fit)
coef(fit)

# END OF IMPORTANT THINGS REGARDING ODTREATMEANTADMINS CT

#BEGINNING OF IMPORTANT INFO REGARDING OD BY OPIOD TYPE
HeroinCount <- odCT %>%
  count(Heroin == "Y")

FentCount <- odCT %>%
  count(Fentanyl == "Y")

OxyCount <- odCT %>%
  count(Oxycodone == "Y")

MethadCount <- odCT %>%
  count(Methadone == "Y")

MorphineCount <- odCT %>%
  count(`Morphine (not heroin)` == "Y")
#END OF BEGINING OF INFO FOR OD BY OPIOD TYPE

#BEGINNING OF IMPORTANT INFO FOR RACIAL DEMOGRAPHIC

#END OF IMPORTANT INFO RACIAL DEMOGRAPHICS

shinyServer(function(input, output){
  #output$medicareClaimsByState <- renderPlot({medicareClaimsByState}) 
  #output$CTODTreatmentComparison <- renderPlot({CTODTreatmentComparison})
  #output$drugComparisons <- renderPlot({drugComparisons})
  #output$CTODLocations <- renderPlot({CTODLocations})
  
  #TEST HIST PLOT START
 # output$histPlot <- renderPlot({ 
   # x    <- faithful[, 2] 
   # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # draw the histogram with the specified number of bins
   # histPlot <- hist(x, breaks = bins, col = 'darkgray', border = 'white')
    #})
  #TEST HIST PLOT END
  #OD LOCATION BAR GRAPH START
  output$CTODLocations <- renderPlot({
  odCT %>%
    filter(Heroin == "Y") %>%
    filter(Location == "Residence" | Location == "Hospital" | Location == "Other") %>%
    ggplot(aes(Location)) + geom_bar() })
  #OD LOCATION BAR GRAPH END
  
  #ODTREATMEANTSADMINSTCT GRAPH START
  output$CTODTreatmentComparison <- renderPlot({
  TreatmentOD %>%
    filter(Overdoses > 10)%>%
    ggplot(aes(AddictionTreatmentAdmissions, Overdoses, color = Town)) + geom_point() +
    geom_abline(slope = coef(fit)[2], intercept = coef(fit)[1]) })
  #ODTREATMEANTSADMINSTCT GRAPH END
  
  #OD BY OPIOID TYPE GRAPH START
  output$drugComparisons <- renderPlot({
   ODbyDrug %>% 
    ggplot(aes(Drug, Odnumber)) + geom_bar(stat='identity')})
  #OD BY OPIOD TYPE GRAPH END
  
  #RACIAL DEMOGRAPHIC GRAPH START
  output$racialDemographics<- renderPlot({
    odCT %>%
      filter(Heroin == "Y" | AnyOpioid == "Y") %>%
      filter(Race == "Black" | Race == "Hispanic, White" | Race == "White") %>%
      ggplot(aes(Race)) + geom_bar()
  })
  #RACIAL DEMOGAPHIC GRAPH END
  
  #MEDICARE CLAIMS BY STATE CHORO START
  
   #
  # # where issue is?
 # merged   <- left_join(map@data, data, by = c("NAME" = "State"))
 #  map@data <- merged
 #  bins <- c(0,100000,500000,1000000,1500000,2500000,5000000,Inf)
 #  pal  <- colorBin("YlOrRd", map@data$TotalClaims, bins=bins)
 #  output$medicareClaimsByState <- renderLeaflet({ 
 # leaflet(data = map) %>%
 #    setView(-96, 37.8, 4) %>%
 #    addTiles()        %>%
 #    addPolygons(
 #      fillColor = ~pal(TotalClaims),
 #      weight = 2,
 #      opacity = 1,
 #      color = "white",
 #      dashArray = "3",
 #      fillOpacity = 0.7)
 #  })
  #MEDICARE CLAIMS BY STATE CHORO END
 })
  
  



