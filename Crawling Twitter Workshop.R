library(twitteR)
library(wordcloud2)
library(corpus)
library(tm)
consumer_key <- "dp4VROTJF46o80MVrSwbU8tBh"
consumer_secret <- "gPWyj8TDZxK5ivwvaucCT7X5H2vKvXuNb9jyiXPbMFmaeOk1e0"
access_token <- "1137924949115432961-7IdQh7egANKRlG3tAwktO4d9lJpsB0"
access_secret <- "vpSqBW5TPIENsuKp0KtjGaodjkxeEQkA6gYRyMRoHEohT"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

library(tidyverse)
library(twitteR)
fn_twitter<- searchTwitter("shopee",n=1000,lang="en")

fn_twitter_df <- twListToDF(fn_twitter)
tweet_words <- fn_twitter_df %>% select(text)
write.csv(tweet_words,"D:/Twitter.csv")
