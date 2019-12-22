install.packages("Cairo")
library(Cairo)
library(ggplot2)
library(ggthemes)
library(mice)
library(plyr)
library(dplyr)

#########################################################

##  READING IN DATASET FOR MODIFICATION ##

#########################################################

setwd("/Users/laurenbannon/Desktop/College/Year 4/Semester 1/Data Application Development/Project/Forest Fires Analysis/Forest Fires Analysis")

#Dataset downloaded as csv
amazon_fires <- read.csv("Datasets/amazon.csv", stringsAsFactors = FALSE)

#Dataset downloaded as csv
forest_fires <- read.csv("Datasets/forestfires.csv", stringsAsFactors = FALSE)

#Cleaning up values - Amazon.csv
amazon_fires$state[amazon_fires$state == "Par\xe1"] <- "Para"
amazon_fires$state[amazon_fires$state == "Piau"] <- "Piaui"

typeof(amazon_fires)
summary(amazon_fires$month)

amazon_fires$month[amazon_fires$month == "Janeiro"] <- "jan"
amazon_fires$month[amazon_fires$month == "Fevereiro"] <- "feb"
amazon_fires$month[amazon_fires$month == "Mar\xe7o"] <- "mar"
amazon_fires$month[amazon_fires$month == "Abril"] <- "apr"
amazon_fires$month[amazon_fires$month == "Maio"] <- "may"
amazon_fires$month[amazon_fires$month == "Junho"] <- "jun"
amazon_fires$month[amazon_fires$month == "Julho"] <- "jul"
amazon_fires$month[amazon_fires$month == "Agosto"] <- "aug"
amazon_fires$month[amazon_fires$month == "Setembro"] <- "sep"
amazon_fires$month[amazon_fires$month == "Outubro"] <- "oct"
amazon_fires$month[amazon_fires$month == "Novembro"] <- "nov"
amazon_fires$month[amazon_fires$month == "Dezembro"] <- "dec"

summary(amazon_fires$year)
typeof(amazon_fires$month)

write.csv(amazon_fires, file = "Datasets/Updated Amazon Fires.csv")

updated_amazon_df <- read.csv("Datasets/Updated Amazon Fires.csv", stringsAsFactors = FALSE)

#Cleaning up values - ForestFires.csv
forest_fires_df <- data.frame(forest_fires$month, forest_fires$temp, forest_fires$wind, forest_fires$rain, forest_fires$area)

forest_fires_df <- rename(forest_fires_df,c("forest_fires.month" = "month", "forest_fires.temp" = "temp","forest_fires.wind" = "wind", "forest_fires.rain" = "rain", "forest_fires.area" = "area"))

write.csv(forest_fires_df, file = "Datasets/Updated Forest Fires.csv")

merged_df <- read.csv(file = "Datasets/Amazon & Forest Fires Merged.csv")

#merged_df <- read.csv("Datasets/Merged Data.csv", stringsAsFactors = FALSE)

# Advanced option: use mice
#mice_mod <- mice(merged_df[, !names(merged_df) %in%
                                 #c('year','state','month','number','date')], method='rf')

#mice_output <- complete(mice_mod)
#merged_df$area <- mice_output$area
#merged_df$rain <- mice_output$rain
#merged_df$wind <- mice_output$wind
#merged_df$temp <- mice_output$temp

#sapply(merged_df,function(x) sum(is.na(x)))

#write.csv(merged_df, file = "Datasets/Amazon & Forest Fires Merged.csv")

##################################################

# GRAPHS - FOR ANALYSIS #

##################################################

attach(merged_df)

# State that is subjected to the highest level of deforestation
plot1 <- ggplot(merged_df, aes(x = year, y = area)) +
  geom_point(aes(color = state), size = 3)

print(plot1)

pdf(file = "Plots/StateSubjectedToHighestLevelOfDeforestation.pdf", width = 5, height = 5)
print(plot1)
dev.off() # Remember to close the device 

# Commonality of the fires over a one-year period
filtered_year<- filter(merged_df, year == 2016) 
plot2 <- ggplot(filtered_year,
       aes(y = number, x = month)) +
  geom_point()

print(plot2)

pdf(file = "Plots/CommonaltiyOfFiresOverYearPeriod.pdf", width = 5, height = 5)
print(plot2)
dev.off() # Remember to close the device 

#Month subjected to highest level of deforestation - temp
plot3 <- ggplot(merged_df, aes(x = number, y = temp)) +
  geom_point(aes(color = month), size = 3)

print(plot3)

pdf(file = "Plots/MonthSubjectToHighestLevelOfDeforestation.pdf", width = 5, height = 5)
print(plot3)
dev.off() # Remember to close the device 

# Extent of destruction that can be caused in one month alone
plot4 <- ggplot(merged_df, aes(x=month, y=area)) + 
  geom_bar(stat="identity")

print(plot4)

pdf(file = "Plots/ExtentOfDestructionCausedInOneMonth.pdf", width = 5, height = 5)
print(plot4)
dev.off() # Remember to close the device 







