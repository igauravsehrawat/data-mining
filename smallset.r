library(ggplot2)

mydata<-read.csv("cols.csv")
head(mydata)

mydat.tmp<-ggplot(mydata,aes(x=col1,y=col2))+geom_point()
summary(mydat.tmp)
save(mydat.tmp,file="temp.rData")
ggsave(file="cols.pdf")
ggsave(file="rest.jpeg",dpi=72)


