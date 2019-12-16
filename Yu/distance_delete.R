getwd()
setwd("C:/Users/student/Seoul-bike-route/Data")
library(dplyr)

d_1<- read.csv(file.choose(), header=F) #csv
head(d_1)
d_1 <- d_1[,-10]
d_1 <- d_1[,-1]

write.csv(d_1,file = "16_route.csv")
write.csv(d_1,file = "30_route_3.csv")

write.csv(d_1,file = "30_route_4.csv")
