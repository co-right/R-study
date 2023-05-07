# 6-2 조건에 맞는 데이터만 추출하기
library(dplyr) #dataframe pliers : 데이터프레임 집게
exam <- read.csv("csv_exam.csv")
exam
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)

exam %>% filter(math > 50)
str(exam)

exam %>% filter(class == 1 & math >=50)
exam %>% filter(class == 2 & english >= 80)

exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(class %in% c(1, 3, 5))


# 6-3 필요한 변수만 추출하기
exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)
exam %>% select(-math)
exam %>% select(-math, -english)

exam %>% filter(class ==1) %>% select(english)

exam %>% 
  filter(class ==1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head

exam %>% 
  select(id, math) %>% 
  head(10)

mpg
mpg_class_cty <- mpg %>% select(class, cty)
mpg_class_cty %>% head

suv_cty<-mean((mpg_class_cty %>% filter(class=="suv"))$cty)
compact_cty<-mean((mpg_class_cty %>% filter(class=="compact"))$cty)

suv_cty
compact_cty


#6-4 순서대로 정렬하기
exam %>% arrange(math)
exam
exam %>% arrange(desc(math))
exam %>% arrange(class, math)

#6-5 파생변수 추가하기
exam %>% 
  mutate(total = math + english +science) %>% 
  head
exam %>% 
  mutate(total = math + english +science,
         mean = (math + english + science)/3) %>% 
  head
exam %>% 
  mutate(test=ifelse(science >= 60, "pass", "fail")) %>% 
  head
exam %>%
  mutate(total = math + english +science) %>% 
  arrange(total) %>% 
  head

mpg %>% head
mpg_copy<-mpg
# Q1
mpg_copy<-mpg %>% 
  mutate(year_total=cty+hwy,
                    year_avg=(cty+hwy)/2)
mpg_copy
mpg_copy %>% arrange(desc(year_avg)) %>% head

mpg %>% 
  mutate(year_total=cty+hwy,
         year_avg=(cty+hwy)/2) %>% 
  arrange(desc(year_avg)) %>% head

# 집단별로 요약하기

exam %>% summarise(mean_math=mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n=n())

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

# dplyr 조합하기
mpg %>% group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (cty+hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

#혼자서 해보기
mpg %>% group_by(class) %>% 
  summarise(mean_cty = mean(cty))

mpg %>% group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

mpg %>% group_by(class) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

str(mpg)

mpg %>% group_by(manufacturer) %>% 
  filter(class=="compact") %>% 
  summarise(n=n())

#데이터 합치기
#가로로 합치기
test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm = c(60,80,70,90,85))
test2 <- data.frame(id=c(1,2,3,4,5),
                    final = c(70,83,65,95,80))
test1
test2

total <- left_join(test1, test2, by = "id")
total
name<-data.frame(class = c(1,2,3,4,5),
                 teacher = c("kim","lee","park","choi","jung"))
name
exam_new <- left_join(exam, name, by = "class")
exam_new
group_a <- data.frame(id = c(1,2,3,4,5), test = c(60,80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10), test = c(70,83,65,95,80))
group_a
group_b
group_all <- bind_rows(group_a, group_b)
group_all
fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35, 2.38, 2.11,2.76, 2.22))
fuel
mpg_copy2 <- mpg
mpg_copy2 %>% head(10)
mpg_copy3<-left_join(mpg_copy2, fuel, by = "fl")
mpg_copy3 %>% head(10)
mpg_copy3 %>% select(model, fl, price_fl) %>% head(10)

#분석 도전
library(ggplot2)
midwest
midwest %>% head(10)
midwest <- as.data.frame(ggplot2::midwest)
midwest
midwest<-midwest %>% mutate(ratio_child=(poptotal-popadults)/poptotal*100)

midwest %>% arrange(desc(ratio_child)) %>% select(county, ratio_child) %>% head(5)

midwest<-midwest %>% mutate(grade=ifelse(ratio_child>=40,"large", ifelse(ratio_child>=30, "middle","small")))
table(midwest$grade)

midwest<-midwest %>% mutate(asian_ratio=popasian/poptotal*100)
midwest %>% select(asian_ratio)
midwest %>% arrange(asian_ratio) %>% select(state, county, asian_ratio) %>% head(10)
