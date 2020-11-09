library(dplyr)
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("wesanderson")

df <- read.csv('edx_free_courses_cleaned.csv', header=TRUE, sep=",", fill=FALSE)
# selected <-  data.frame(df$Post.Message, df$Posted)
selected <-  df$desc
# str(selected)
words<-as.character(selected)

word.corpus<-Corpus(VectorSource(words))


word.corpus<-word.corpus%>%
  tm_map(removePunctuation)%>%
  tm_map(removeNumbers)%>%
  # remove white spaces
  tm_map(stripWhitespace)

# remove unnecessary keywords
word.corpus <- tm_map(word.corpus, removeWords, c("the", "and","for","this","that","with","will","also","i'm","you","our","from","about","are","can","what","cours","how","your","these","world","learn","use","the")) 

word.corpus<-tm_map(word.corpus, stemDocument)
word.counts<-as.matrix(TermDocumentMatrix(word.corpus))
word.freq<-sort(rowSums(word.counts), decreasing=TRUE)
# show word frequency
head(word.freq)

set.seed(32)

# show word cloud
wordcloud(words=names(word.freq), freq=word.freq, scale=c(4,.3),max.words = 30, random.order = FALSE, color=wes_palette("Darjeeling1"),rot.per=.7)
