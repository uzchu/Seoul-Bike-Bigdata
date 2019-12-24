library(dplyr)
library(readxl)
#파일로드
d_1<- read.csv(file.choose(), header=F) #csv
head(d_1)

#속도 최적화를 위한 대여(반납)대여소명 삭제
d_1 <- d_1[-8]
d_1 <- d_1[-4]

#대여일시 문자형 date형으로 변환 후, 시간데이터만 뽑아 time 열 추가
d_1$time <- as.POSIXct(d_1$V2,format="%Y-%m-%d %H:%M:%S") %>% format('%H') #''없을때
d_1$time <- as.POSIXct(d_1$V2,format="'%Y-%m-%d %H:%M:%S'") %>% format('%H') #''있을때
d_1$time <- as.POSIXct(d_1$V2,format="%Y-%m-%d %H:%M") %>% format('%H') #''없을때, 시:분만 있는 형태

#최종확인
head(d_1)

#파일저장
write.csv(d_1,file = "30.csv")
