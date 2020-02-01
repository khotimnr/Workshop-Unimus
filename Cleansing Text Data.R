library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("stringr")

Data_Crawling_Instagram2 <-Data_Crawling_Instagram2$Text)
Bukalapak.text <-Corpus(VectorSource(Data_Crawling_Instagram2))
removeURL <- function(x) gsub("http[^[:space:]]*", "", x)
clean <- tm_map(Bukalapak.text, removeURL)
removeNL <- function(y) gsub("\n", " ", y)
clean <- tm_map(clean, removeNL)
removepipe <- function(z) gsub("<[^>]+>", "", z)
clean <- tm_map(clean, removepipe)
remove.mention <- function(z) gsub("@\\S+", "", z)
clean <- tm_map(clean, remove.mention)
remove.hashtag <- function(z) gsub("#\\S+", "", z)
clean <- tm_map(clean, remove.hashtag)
removeamp <- function(y) gsub("&amp;", "", y)
clean <- tm_map(clean, removeamp)
removetitik3 <- function(y) gsub("[[:punct:]]", "", y)
clean <- tm_map(clean, removetitik3)
remove.all <- function(xy) gsub("[^[:alpha:][:space:]]*", "", xy)
clean <- tm_map(clean,remove.all)
clean <- tm_map(clean, tolower)
clean <- tm_map(clean, stripWhitespace)

dtm<-TermDocumentMatrix(clean)
m <-as.matrix(dtm)
v <-sort(rowSums(m),decreasing=TRUE)
d <-data.frame(word = names(v),freq=v)
head(d, 25)
dataframe<-data.frame(text=unlist(sapply(clean, `[`)),stringsAsFactors=F)
write.csv(dataframe,"D:/cleaning3.csv")





twbem.df<-twListToDF(tw.bem)
dim(twbem.df)

myCorpus<-Corpus(VectorSource(twbem.df$text))
removeURL<-function(x) gsub ("http[^[[:space:]]*","",x)
myCorpus<-tm_map(myCorpus,content_transformer(removeURL))

removeNumFuct<-function(x) gsub("[^[:alpha:][:space:]]*","",x)
myCorpus<-tm_map(myCorpus,content_transformer(removeNumFuct))


