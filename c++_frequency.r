library(ggplot2)
library(scales)

c++_tags_count<-read.csv("c++_tags.csv",1:25)


c++_tags_count.tmp<-ggplot(c++_tags_count, aes(x=tags, y=count)) + geom_point() 


summary(c++_tags_count.tmp)
save(c++_tags_count,file="c++_tags_count.rData")
ggsave(file="c++_tags_count.pdf")
ggsave(file="c++_tags_count.jpeg",dpi=72)




