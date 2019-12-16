library(dplyr)
data1 = read.csv("c:/Rwork/rendinfo_1901.csv")
data2 = read.csv("c:/Rwork/rendplace_1905.csv")
data3 = read.csv("c:/Rwork/backplace_1905.csv")
#빌린 정류소 기준으로 데이터 병합 
innerjoindata1 = inner_join(data2,data1, by = "rendnum")
#위 데이터에 반납 정류소 기준으로 데이터 병합
joindata = inner_join(innerjoindata1,data3, by = "backnum")
View(innerjoindata1) 
View(joindata) 

#시각화------------------------------------
install.packages("ggplot2")
install.packages("ggmap")
library(ggplot2)
library(ggmap)

register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

seoul.cen <- c(126.982708,37.525994)
map <- get_googlemap(center=seoul.cen, maptype="roadmap",zoom=11)
ggmap(map)

joindata$lon.x[1]
joindata$lat.x[1]
joindata$lon.y[1]
joindata$lat.y[1]

babydata = joindata[c(1:4),]
View(babydata)

p1 = geom_point(data=babydata, aes(x=babydata$lon.x[1], y=babydata$lat.x[1]), alpha=1, size=1, color="black")
p2 = geom_point(data=babydata, aes(x=babydata$lon.y[1], y=babydata$lat.y[1]), alpha=1, size=1, color="black")
p3 = ggmap(map)+ p1 + p2 + geom_line(data=babydata,aes(x,y),group=babydata$backnum)

