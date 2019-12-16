setwd("C:/semi/data_ver2")
getwd()
#파일로드
d_1<- read.csv(file.choose(), header=F) #csv
head(d_1)

d_1 <- d_1[-1]
d_1$V2<-gsub("'","",d_1$V2)
d_1$V3<-gsub("'","",d_1$V3)
d_1$V4<-gsub("'","",d_1$V4)
d_1$V6<-gsub("'","",d_1$V6)
d_1$V7<-gsub("'","",d_1$V7)

#최종확인
head(d_1)

#파일저장
write.csv(d_1,file = "16.csv")
