library(ggplot2)
library(dplyr)
library(tidyverse)
library(readr)

#odCT<- read_csv("~/opioid-reboot/odCT.csv")

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

# View(HeroinCount)
# View(FentCount)
# View(OxyCount)
# View(MethadCount)
# View(MorphineCount)

ODbyDrug <- read_csv("~/opioid-reboot/ODbyDrug.csv")
drugComparisons <- ODbyDrug %>% 
  ggplot(aes(Drug, Odnumber)) + geom_bar(stat='identity')

