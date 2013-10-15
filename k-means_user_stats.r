library(ggplot2)

mydata<-read.csv("user_stats_cluster_no_id_100.csv")
ggplot(mydata,aes(x="reputation", y="up_votes"))+
geom_point()

ggsave(file="users_clust.pdf")
ggsave(file="users_clust.jpeg",dpi=72)
mydata<-na.omit(mydata)
mydata<-scale(mydata)



fit <- kmeans(mydata, 10)

library(cluster) 
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, 
  	 labels=2, lines=0,main="k-means-cluster")



