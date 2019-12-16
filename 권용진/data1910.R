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

babydata = joindata[c(1:4),]
View(babydata)

lon <- c(babydata$lon.x,babydata$lon.y)
lat <- c(babydata$lat.x,babydata$lat.y)
cen <- c(mean(lon),mean(lat))
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
map <- get_googlemap(center=cen, maptype="roadmap",zoom=15)

p2 = geom_point(data=babydata, aes(x=babydata$lon.x, y=babydata$lat.x), alpha=1, size=2, color="red")
p3 = geom_point(data=babydata, aes(x=babydata$lon.y, y=babydata$lat.y), alpha=1, size=2, color="green")
p4 = geom_line(data=babydata, aes(x=c(babydata$lon.x, babydata$lon.y), y=c(babydata$lat.x, babydata$lat.y)), alpha=1, size=1, color="blue")
ggmap(map) + p2 + p3 + p4 