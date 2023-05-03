#4-2 데이터 프레임 만들기 - 시험 성적 데이터를 만들어 보자!
#데이터 입력해 데이터 프레임 만들기
#1. 변수만들기
english<-c(90,80,60,70)
english
math<-c(50,60,100,20)
math

#2. 데이터 프레임 만들기
df_midterm<-data.frame(english, math)
df_midterm

#3.반에 대한 데이터 추가
class<-c(1,1,2,2)
class
df_midterm<-data.frame(english,math, class)
df_midterm

#4. 분석하기
mean(df_midterm$english)
mean(df_midterm$math)

#5. 데이터 프레임 한 번에 만들기
df_midterm<-data.frame(english=c(90,80,60,70),math=c(56,60,100,20),class=c(1,1,2,2))
df_midterm

#혼자서 해보기
product<-c("사과","딸기","수박")
product
price<-c(1800,1500,3000)
sales<-c(24,38,13)
df_product<-data.frame(product,price,sales)
df_product

###외부 데이터 이용하기-축적된 시험 성적 데이터를 불러오자!
install.packages("readxl")
library(readxl)
df_exam<-read_excel("excel_exam.xlsx")
df_exam
mean(df_exam$english)
mean(df_exam$science)

##첫 행 인식 안하려면
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar
df_exam_novar<-read_excel("excel_exam_novar.xlsx", col_names=F)
df_exam_novar

#엑셀 파일에 시트가 여러 개 있다면?
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet=3) #3번째 sheet 불러온다.
df_exam_sheet

###csv파일
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam

#데이터 프레임을 csv파일로 저장하기
df_midterm<-data.frame(english=c(90,80,60,70),math=c(56,60,100,20),class=c(1,1,2,2))
df_midterm
write.csv(df_midterm, file="df_midterm.csv")
saveRDS(df_midterm, file="df_midterm.rds")
rm(df_midterm)
df_midterm
df_midterm<-readRDS("df_midterm.rds")
df_midterm