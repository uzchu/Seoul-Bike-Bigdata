library(dplyr)
d_1<- read.csv(file.choose(), header=F) #csv
head(d_1)
d_1 <- d_1[,-1]

d_1$V4 <- gsub("상암센터 정비실","",d_1$V4)
d_1$V4 <- gsub("중랑센터","",d_1$V4)
table(d_1$V4)
d_1$V7 <- gsub("상암센터 정비실","",d_1$V7)
d_1$V7 <- gsub("중랑센터","",d_1$V7)
table(d_1$V7)

d_1 <- d_1 %>% filter(V4!=""&V7!="")

write.csv(d_1,file = "1_1.csv")
