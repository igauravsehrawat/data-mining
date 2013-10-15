library(ggplot2)

mydata<-read.csv("user_stats_cluster_no_id_100.csv")
mydata<-na.omit(mydata)
mydata<-scale(mydata)


fit <- kmeans(mydata, 10) 
aggregate(mydata,by=list(fit$cluster),FUN=mean)
mydata <- data.frame(mydata, fit$cluster)





