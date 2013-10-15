library(ggplot2)

tags_count<-read.csv("tags_count.csv")
head(users_points)

tags_count.tmp<-ggplot(tags_count,aes(x=creation_date,y=count))+geom_smooth()
summary(tags_count.tmp)
save(tags_count,file="temp_tags_count.rData")
ggsave(file="users_tagscount.pdf")
ggsave(file="users_tagscount.jpeg",dpi=72)


