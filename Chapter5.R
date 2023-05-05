### 5단원 데이터 분석 기초! - 데이터 파악하기, 다루기 쉽게 수정하기
# 1. 데이터 파악하기
# 2. 변수명 바꾸기
# 3. 파생변수 만들기

exam <-read.csv("csv_exam.csv")

# exam 데이터 파악하기
head(exam)
head(exam, 10)
tail(exam)
tail(exam, 10)
View(exam)
dim(exam)
str(exam)
summary(exam)

# mpg 데이터 파악하기
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)

# 변수명 바꾸기
df_raw <- data.frame(var1 = c(1,2,1), var2 = c(2,3,2))
df_raw

install.packages("dplyr")
library(dplyr)
df_new <- df_raw # 복사본 생성
df_new # 출력
df_new <-rename(df_new, v2 = var2) # var2를 v2로
df_new

# 혼자서 해보기
mpg_new <- mpg
mpg_new
head(mpg_new)
mpg_new <- rename(mpg_new, city = cty, highway = hwy)
str(mpg_new)

# 파생변수 만들기
df <- data.frame(var1 = c(4,3,8), var2 = c(2,6,1))
df
df$var_sum <- df$var1 + df$var2
df
df$var_mean<-(df$var1 + df$var2)/2
df

# mpg 통합 연비 변수 만들기
str(mpg)
mpg$total <- (mpg$cty + mpg$hwy)/2 # 통합 연비 변수 생성
head(mpg)
mean(mpg$total)

# 조건문을 활용해 파생변수 만들기
summary(mpg$total)
hist(mpg$total) # 히스토그램 생성

# 합격 판정 변수 만들기
ifelse(mpg$total >= 20, "pass", "fail")
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)
table(mpg$test)
library(ggplot2)
qplot(mpg$test)


# 중첩 조건문 활용하기
mpg$grade <- ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20) #데이터 확인
table(mpg$grade)
qplot(mpg$grade) # qplot is short for quik plot
mpg$grade2 <- ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 25, "B", ifelse(mpg$total >= 20, "C", "D")))
table(mpg$grade2)
qplot(mpg$grade2)

# 분석 도전!
midwest_5 <- midwest
head(midwest_5)
midwest_5 <- rename(midwest_5, total=poptotal, asian=popasian)
str(midwest_5)

midwest_5$asian_100 <- (midwest_5$asian/midwest_5$total)*100
midwest_5$asian_100
midwest_5$percasian
mean_asian_100 <- mean(midwest_5$asian_100)
midwest_5$asian_volume <- ifelse(midwest_5$asian_100>mean_asian_100, "large", "small")
head(midwest_5)
str(midwest_5)
midwest_5$asian_volume

table(midwest_5$asian_volume)
qplot(midwest_5$asian_volume)



















