library(ggplot2)
library(scales)

date_count<-read.csv("sample_date.csv")
timeline<-as.Date(date_count$Day)
df<-data.frame(timeline,date_count$Pressure)
date_count.tmp<-ggplot(df, aes(x=timeline, y=date_count$Pressure)) + geom_line() 


summary(date_count.tmp)
save(date_count,file="temp_tags_count.rData")
ggsave(file="sample_datecount.pdf")
ggsave(file="sample_datecount.jpeg",dpi=72)




