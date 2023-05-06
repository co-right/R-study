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










