library(rtweet)
library(ggplot2)
library(ggthemes)

# Obtaining and using access tokens
vignette("auth", package = "rtweet")

app_name <- "AmazonianForestFiresAnalysis"
api_key <- "hrkPigk7fnjCrDdsaYTcAmEcC"
api_secret <- "0iTUIHb03HwsNnhNq4IdAXTs4Tke0wFeNGSLiQSL9jSWmWe0a5"
access_token <- "1868320890-QYmRtFL74AwYaHDK5c1ncjOak3Oh93TYkgaiVD3"
access_token_secret <- "UtTLD16BmDPwMW5Mz6lS8f63VTNR4yKDEyN3wQeLBEh2Y"

# rtweet - Creating Twitter authorization token
token <- create_token(
  app = app_name,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret
)

#########################################################

##  PULLING TWEETS AND EXTRACTING COLUMNS I NEED ##
##  OUTPUTTING INTO A CSV FILE TO READ IN ##

#########################################################

setwd("/Users/laurenbannon/Desktop/College/Year 4/Semester 1/Data Application Development/Project/Forest Fires Analysis/Forest Fires Analysis")

#amazonian_Tweets <- search_tweets("Amazon Fires", n = 1000, include_rts = FALSE)

#amazon_df <- data.frame(amazonian_Tweets$user_id, amazonian_Tweets$created_at, amazonian_Tweets$screen_name, amazonian_Tweets$text, amazonian_Tweets$favourites_count, amazonian_Tweets$retweet_count)

#write.csv(amazon_df, file = "amazon_tweets.csv", row.names = T)

amazon_data <- read.csv("amazon.csv", stringsAsFactors = T)

amazon_tweets_data <- read.csv("amazon_tweets.csv", stringsAsFactors = T)

ggplot(amazon_data, aes(month, fill = factor(year))) +
  geom_bar(stat='count', position='dodge') +
  facet_grid(.~number) +
  theme_few()

barplot(table(amazon_data$number))
#rm(amazon_tweets_df)









