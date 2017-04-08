library(ggplot2)
library(dplyr)
library(leaflet)
library(rgdal)
library(readr)


#natlClaims <- read_csv("~/opioid-reboot/natlClaims.csv")
#stateAbbrev <- read_csv("~/opioid-reboot/stateAbbrev.csv")

#natlClaims <- readr::read_csv("natlClaims.csv")
#stateAbbrev <- readr::read_csv("stateAbbrev.csv")
#View(natlClaims)
#View(stateAbbrev)
OpiClaimsbyState <- natlClaims %>%
   group_by(ProviderState) %>%
   summarise(TotalClaims = sum(TotalClaimCount))
TotalClaims <-select(OpiClaimsbyState,TotalClaims)
names(OpiClaimsbyState)[names(OpiClaimsbyState) == 'ProviderState'] <- 'X1'
OpiState <- left_join(OpiClaimsbyState, stateAbbrev, by = "X1")
write.table(OpiState, file = "ClaimsbyState.txt")
names(OpiState)[names(OpiState) == 'State'] <- 'NAME'
#map  <- rgdal::readOGR("gz_2010_us_040_00_5m.json", "OGRGeoJSON")
#data <- read.table("ClaimsbyState.txt", stringsAsFactors = FALSE)
# 
# # where issue is
merged   <- left_join(map@data, data, by = c("NAME" = "State"))
map@data <- merged
bins <- c(0,100000,500000,1000000,1500000,2500000,5000000,Inf)
pal  <- colorBin("YlOrRd", map@data$TotalClaims, bins=bins)


medicareClaimsByState<- leaflet(data = map) %>%
  setView(-96, 37.8, 4) %>%
  addTiles()        %>%
  addPolygons(
    fillColor = ~pal(TotalClaims),
    weight = 2,
    opacity = 1,
    color = "white",
    dashArray = "3",
    fillOpacity = 0.7)


