library(ggplot2)
library(scales)

ctags_count<-read.csv("c++_tags.csv",1:25)


ctags_count.tmp<-ggplot(ctags_count, aes(x=tags, y=count)) + geom_point() 


summary(ctags_count.tmp)
save(ctags_count,file="c++tags_count.rData")
ggsave(file="ctags_count.pdf")
ggsave(file="ctags_count.jpeg",dpi=72)




