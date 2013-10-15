library(tm)
library(ggplot2)
library(Snowball)
library(wordcloud)

df2 <- read.csv("./cplustags_freq.csv")

df <- do.call("rbind", lapply(df2, as.data.frame))
 #dim(df)
names(df)<-c("tags")
 

myCorpus <- Corpus(VectorSource(df$tags))

myCorpus <- tm_map(myCorpus, gsub, pattern="><", replacement=" ")
myCorpus <- tm_map(myCorpus, gsub, pattern="<", replacement="")
myCorpus <- tm_map(myCorpus, gsub, pattern=">", replacement="")
myCorpus <- tm_map(myCorpus, gsub, pattern="+", replacement="plusplus")
myCorpus <- tm_map(myCorpus, gsub, pattern="#", replacement="sharp")
# convert to lower case
#myCorpus <- tm_map(myCorpus, tolower)
# remove punctuation
myCorpus <- tm_map(myCorpus, removePunctuation)
# remove numbers
myCorpus <- tm_map(myCorpus, removeNumbers)
# remove URLs
#removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
#myCorpus <- tm_map(myCorpus, removeURL)
# add two extra stop words: "available" and "via"
myStopwords <- c(stopwords('english'), "available", "via")
# remove "r" and "big" from stopwords
#myStopwords <- setdiff(myStopwords, c("r", "big"))
# remove stopwords from corpus
myCorpus <- tm_map(myCorpus, removeWords, myStopwords)

# keep a copy of corpus to use later as a dictionary for stem completion
myCorpusCopy <- myCorpus
# stem words
myCorpus <- tm_map(myCorpus, stemDocument)
# inspect documents (tweets) numbered 11 to 15
# inspect(myCorpus[11:15])
# The code below is used for to make text fit for paper width
for (i in 11:15) {
cat(paste("[[", i, "]] ", sep=""))
writeLines(strwrap(myCorpus[[i]], width=73))
}




#stem completion
 myCorpus <- tm_map(myCorpus, stemCompletion, dictionary=myCorpusCopy)
#replacing 


#text document matrix
myTdm <- TermDocumentMatrix(myCorpus, control=list(wordLengths=c(3,Inf)))
#myTdm

#frequency_plot
termFrequency <- rowSums(as.matrix(myTdm))
termFrequency <- subset(termFrequency, termFrequency>=10)
library(ggplot2)

c_tags_count.tmp<-qplot(names(termFrequency), termFrequency, geom="bar", xlab="Terms") + coord_flip()


summary(c_tags_count.tmp)
save(c_tags_count,file="c_cloud_count.rData")
ggsave(file="c_cloud_count.pdf")
m2 <- as.matrix(myTdm)
# calculate the frequency of words and sort it descendingly by frequency
wordFreq <- sort(rowSums(m2), decreasing=TRUE)
# word cloud
set.seed(375)
 # to make it reproducible
#pal2<-brewer.pal(8,"Dark2")
png("wordcloud_NewYorkTimes.png",width=1280,height=800)
grayLevels <- gray( (wordFreq+3) / (max(wordFreq)+3) )
wordcloud(words=names(wordFreq), freq=wordFreq, min.freq=3, random.order=F,
colors=grayLevels)








