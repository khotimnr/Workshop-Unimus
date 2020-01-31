library(readxl)
Data_Crawling_Instagram <- read_excel("D:/Data_Crawling_Instagram.xlsx", 
                                      +     sheet = "Cleaning Fix")
View(Data_Crawling_Instagram)
library(tidyverse)
library(dplyr)
library(tidytext)

#Menyiapkan Data
Data_Crawling_Instagram%>% str()
Data_Crawling_Instagram  %>% 
  select(Text, Likes,Date)

library(wordcloud2)
Data_Crawling_Instagram %>%select(Text) %>%unnest_tokens(input = Text, output = token) %>% count(token, sort = T)
Data_Crawling_Instagram %>%select(Text) %>%unnest_tokens(input = Text, output = token) %>% count(token, sort = T) %>%wordcloud2()
stopwords_indo <- read_csv("https://raw.githubusercontent.com/masdevid/ID-Stopwords/master/id.stopwords.02.01.2016.txt", col_names = "stopwords")

#Memuat Wordcloud berbagai bentuk
Data_Crawling_Instagram %>%select(Text) %>%unnest_tokens(input = Text, output = token) %>%anti_join(y = stopwords_indo, by = c("token" = "stopwords")) %>%count(token, sort = T) %>% wordcloud2()
Data_Crawling_Instagram %>%select(Text) %>%unnest_tokens(input = Text, output = token) %>%anti_join(y = stopwords_indo, by = c("token" = "stopwords")) %>%count(token, sort = T) %>% wordcloud2(size = 2, shape = "square")

#Melihat Token
Data_Crawling_Instagram %>%select(Text) %>%unnest_tokens(input = Text, output = token) %>%anti_join(y = stopwords_indo, by = c("token" = "stopwords")) %>%count(token, sort = T)
