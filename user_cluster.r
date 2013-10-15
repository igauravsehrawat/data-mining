library(ggplot2)

mydata<-read.csv("user_stats_cluster_no_id_100.csv")
mydata<-na.omit(mydata)
mydata<-scale(mydata)



d<-dist(mydata,method="euclidean")
fit<-hclust(d,method="ward")
plot(fit)
groups<-cuttree(fit,k=10)
rect.hclust(fit,k=10,border="red")
