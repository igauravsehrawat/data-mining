library(ggplot2)
library(scales)

tags_count<-read.csv("r_tags.csv")


tags_count.tmp<-ggplot(tags_count, aes(x=tags, y=count)) + geom_point() 


summary(tags_count.tmp)
save(tags_count,file="tags_count.rData")
ggsave(file="tags_count.pdf")
ggsave(file="tags_count.jpeg",dpi=1080)




