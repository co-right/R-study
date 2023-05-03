#변수 만들기
a<-1
a
b<-2
b
c<-3
c
d<-3.5
d
a+b
a+b+3
4/b
5*b

#여러 값으로 구성된 변수 만들기
var1<-c(1,2,5,7,8)
var1
var2<-c(1:5)
var2
var3<-seq(1,5)
var3
var4<-seq(1,10,by=2)
var4
var5<-seq(1,10,by=3)
var5
var1
var1+2
var1+var2

#문자로 된 변수 만들기
str1<-"a"
str1
str2<-'text'
str2
str3<-"Hello World"
str3
str4<-c("a","b","c")
str4
str1+2

#숫자를 다루는 함수 이용하기
x<-c(1,2,3)
x
mean(x)
max(x)
min(x)

#문자를 다루는 함수 이용하기
str5<-c("Hello!", "World", "is", "good!")
str5
paste(str5, collapse=",")
str5
paste(str5, collapse=" ")
x_mean<-mean(x)
x_mean
str5_paste <- paste(str5, collapse=" ")
str5_paste

#ggplot2 패키지 설치하기
install.packages("ggplot2")
library(ggplot2)
x<-c("a","a","b","c")
x
qplot(x)

#ggplot2의 mpg데이터로 그래프 만들기
qplot(data=mpg, x=hwy)

qplot(data=mpg, x=cty)
qplot(data=mpg, x=drv, y=hwy)
qplot(data=mpg, x=drv, y=hwy, geom="line")
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")
qplot(data=mpg, x=drv, y=hwy, geom="boxplot", colour=drv)

?qplot

#혼자서 해보기
grade<-c(80,60,70,50,90)
mean(grade)
grade_mean<-mean(grade)
grade_mean

