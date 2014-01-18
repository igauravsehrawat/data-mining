nitty_gritty_class_finder.r
#find all classes of all the columns in a table structure . 
For fast loading if large chunk is to read of same table

nitty<-read.table("sample.txt",nrows=100)
witty_class<-sapply(nitty,class)
eff_table=read.table("table.txt",colClasses=witty_class)