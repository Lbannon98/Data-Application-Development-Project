library(htmltab)
library(ggplot2)
library(ggthemes)
#library(stringr)
#library(plyr) 
#library(dplyr)
library(mice)

#install.packages("stringr")

#########################################################

##  WEB SCRAPING FROM HTML TABLE ON WIKI ##
##  OUTPUTTING INTO A CSV FILE TO READ IN ##

#########################################################

setwd("/Users/laurenbannon/Desktop/College/Year 4/Semester 1/Data Application Development/Project/Forest Fires Analysis/Forest Fires Analysis")

#url <- "https://en.wikipedia.org/wiki/List_of_California_wildfires"

#most_descructive_fires <- htmltab(doc=url, which = 3)

#write.csv(most_descructive_fires, file = "Datasets/Most_destructive_wildfires.csv")

#Data extracted from HTML table
#calafornia_wildfires <- read.csv("Datasets/Most_destructive_wildfires.csv", stringsAsFactors = FALSE)

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

#amazon_fires$state <- str_to_title(amazon_fires$state)

write.csv(amazon_fires, file = "Datasets/Updated Amazon Fires.csv")

updated_amazon_df <- read.csv("Datasets/Updated Amazon Fires.csv", stringsAsFactors = FALSE)

#Cleaning up values - ForestFires.csv
forest_fires_df <- data.frame(forest_fires$month, forest_fires$temp, forest_fires$wind, forest_fires$rain)

forest_fires_df <- rename(forest_fires_df,c("forest_fires.month" = "month", "forest_fires.temp" = "temp","forest_fires.wind" = "wind", "forest_fires.rain" = "rain"))

write.csv(forest_fires_df, file = "Datasets/Updated Forest Fires.csv")

merged_df <- read.csv("Datasets/Merged Data.csv", stringsAsFactors = FALSE)

mice?

# Advanced option: use mice
mice_mod <- mice(merged_df[, !names(new_merged_df) %in%
                                 c('year','state','month','number','date')], method='rf')

mice_output <- complete(mice_mod)
merged_df$area <- mice_output$area
merged_df$rain <- mice_output$rain
merged_df$wind <- mice_output$wind
merged_df$temp <- mice_output$temp

sapply(new_merged_df,function(x) sum(is.na(x)))

write.csv(merged_df, file = "Datasets/Amazon & Forest Fires Merged.csv")

##################################################

# GRAPHS- FOR ANALYSIS #

##################################################

attach(merged_df)

hist(merged_df$area)
summary(area)

ggplot(new_merged_df, aes(year, fill = number)) +
 geom_histogram() +
  # I include Sex since we know (a priori) it's a significant predictor
  facet_grid(.~area) +
  theme_few()

#pc1 <- ggplot(merged_df, aes(x = number, y = rain, color = year))
#pc1 + geom_point()

hist(merged_df$rain)

summary(merged_df$number)

hist(merged_df, 
     main="Histogram for Merged Data", 
     xlab="number", 
     border="blue", 
     col="red",
     xlim=c(0,1000),
     las=1, 
     breaks=5)

p2 <- ggplot(new_merged_df, aes(x = number, y = month, color = year))
p2 + geom_histogram()

#rm(df)












