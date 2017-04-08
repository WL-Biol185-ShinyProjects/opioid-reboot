# library(ggplot2)
# library(dplyr)
# library(tidyverse)
# 
# #DO NOT NEED THIS FILE ANYMORE
# 
# #odCT <- read_csv("~/opioid-reboot/odCT.csv")
# #TreatmentCT <- read_csv("~/opioid-reboot/TreatmentCT.csv")
# #stateAbbrev <- read_csv("~/opioid-reboot/stateAbbrev.csv")
# 
# AdmissionsbyTown <- TreatmentCT %>%
#   group_by(Town) %>%
#   summarise(SumAdmissions = sum(Admissions))
# 
# 
# ODbyCity <- odCT %>%
#   group_by(deathCity) %>%
#   count(deathCity)
# 
# 
# # ODbyCity = dataframe
# # old.var.name = deathCity
# # new.var.name = Town
# 
# names(ODbyCity)[names(ODbyCity) == 'deathCity'] <- 'Town'
# #this changes the column name for deathCity so it matches the column name in AdmissionsbyTown
# 
# library(dplyr)
# AbT <- mutate_each(AdmissionsbyTown, funs(toupper))
# #This makes a version of AdmissionsbyTown that has all town names capitalized to match ODbyCity
# 
# TreatmentOD <- inner_join(AbT, ODbyCity, by = "Town")
# #This puts the number of ODs and Treatment Admissions into the same table so that they can be correlated by town
# 
# names(TreatmentOD)[names(TreatmentOD) == 'n'] <- 'Overdoses'
# names(TreatmentOD)[names(TreatmentOD) == 'SumAdmissions'] <- 'AddictionTreatmentAdmissions'
# TreatmentOD$AddictionTreatmentAdmissions <-as.numeric(TreatmentOD$AddictionTreatmentAdmissions)
# 
# 
# fit <- lm(Overdoses ~ AddictionTreatmentAdmissions, data = TreatmentOD)
# #summary(fit)
# coef(fit)
# 
# CTODTreatmentComparison<-TreatmentOD %>%
#   filter(Overdoses > 10)%>%
#   ggplot(aes(AddictionTreatmentAdmissions, Overdoses, color = Town)) + geom_point() +
#   geom_abline(slope = coef(fit)[2], intercept = coef(fit)[1])
# 
# #may need to remove filter once checklist is available in shiny

