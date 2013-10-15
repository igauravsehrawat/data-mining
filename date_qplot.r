library(ggplot2)
library(scales)

df<-read.csv("tags_count.csv")


dt<-qplot(date,count,data=df,geom="line")+theme(aspect.ratio=1)
date_qplot.temp<-dt

summary(date_count.tmp)
save(date_count,file="temp_tags_count.rData")
ggsave(file="users_datecount.pdf")
ggsave(file="users_datecount.jpeg",dpi=72)
