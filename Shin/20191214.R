library(dplyr)
library(readxl)
#파일로드
d_1<- read.csv(file.choose(), header=F) #csv
head(d_1)

#속도 최적화를 위한 대여(반납)대여소명 삭제
d_1 <- d_1[-11] # 이용거리 삭제제
d_1 <- d_1[-8]
d_1 <- d_1[-4]
d_1 <- d_1[-1,]
#str(head(d_1))
d_1


#대여일시 문자형 date형으로 변환 후, 시간데이터만 뽑아 time 열 추가
d_1$time <- as.POSIXct(d_1$V2,format="%Y-%m-%d %H:%M:%S") %>% format('%H') #''없을때
d_1$time <- as.POSIXct(d_1$V2,format="'%Y-%m-%d %H:%M:%S'") %>% format('%H') #''있을때
d_1$time <- as.POSIXct(d_1$V2,format="%Y-%m-%d %H:%M") %>% format('%H') #''없을때, 시:분만 있는 형태



#시분(초) 년월일 순서로
#분에 따른 행 추가 
d_1$minute <- as.POSIXct(d_1$V2,format ="%Y-%m-%d %H:%M:%S") %>% format("%M")
d_1$minute <- as.POSIXct(d_1$V2,format="%Y-%m-%d %H:%M") %>% format('%M') #''없을때, 시:분만 있는 형태



#년에 따른 행 추가 
d_1$year <- as.POSIXct(d_1$V2,format ="%Y-%m-%d %H:%M:%S") %>% format("%Y")
d_1$year <- as.POSIXct(d_1$V2,format="%Y-%m-%d %H:%M") %>% format('%Y') #''없을때, 시:분만 있는 형태


#월에 따른 행 추가 
d_1$month <- as.POSIXct(d_1$V2,format ="%Y-%m-%d %H:%M:%S") %>% format("%m")
d_1$month <- as.POSIXct(d_1$V2,format="%Y-%m-%d %H:%M") %>% format('%m') #''없을때, 시:분만 있는 형태


#일에 따른 행 추가 
d_1$day <- as.POSIXct(d_1$V2,format ="%Y-%m-%d %H:%M:%S") %>% format("%d")
d_1$day <- as.POSIXct(d_1$V2,format="%Y-%m-%d %H:%M") %>% format('%d') #''없을때, 시:분만 있는 형태

View(d_1)

#반납, 대여장소 같으면 1, 다르면 0 ,열 하나추가 
# data <- data %>% mutate(V12=ifelse(V4==V7,1,0))

d_1$V3 <- as.character(d_1$V3)
d_1$V7 <- as.character(d_1$V7)
d_1$route <- ifelse(d_1$V3==d_1$V7,1,0)

table(d_1$route)



d_1$V4 <- gsub("상암센터 정비실","",d_1$V4)
d_1$V4 <- gsub("중랑센터","",d_1$V4)
d_1$V4 <- gsub("위트콤","",d_1$V4)
d_1$V4 <- gsub("위트콤공장","",d_1$V4)
d_1$V4 <- gsub("중랑정비팀test 1005","",d_1$V4)
d_1$V4 <- gsub("공장","",d_1$V4)


table(d_1$V3)

d_1$V7 <- gsub("상암센터 정비실","",d_1$V7)
d_1$V7 <- gsub("중랑센터","",d_1$V7)
d_1$V7 <- gsub("위트콤","",d_1$V7)
d_1$V7 <- gsub("위트콤공장","",d_1$V7)
d_1$V7 <- gsub("공장","",d_1$V7)
d_1$V7 <- gsub("중랑정비팀test 1005","",d_1$V7)


table(d_1$V7)

#d_1 <- d_1 %>% filter(V4!=""&V7!="")




#최종확인
head(d_1)

#파일저장
write.csv(d_1,file = "1909_2.csv")
