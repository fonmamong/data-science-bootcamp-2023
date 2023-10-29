### HW01 5 question ask about flight database 
library(nycflights13)
library(dplyr)

View (flights)
view (airports)
glimpse(flights)


# [1]สายการบิน ที่บินเยอะที่สุดในปี 2013 = UA

pop_carrier <-flights %>%
  group_by(carrier) %>% 
  count (carrier) %>% 
  arrange(-n)%>%
  head(1)


#[2] สนามบินปลายทาง 5 อันดับแรก ที่สายการบิน UA ไปจอดเยอะที่สุด 
 flights %>%
  filter(carrier == pop_carrier$carrier) %>%   group_by(month) %>% 
  count (dest) %>% 
  arrange(-n)%>%
  head(5) %>% 
   inner_join(airports, by = c("dest" ="faa"))
 
 
#[3] วันที่มีเที่ยวบิน มากที่สุด ในปี = 27 Nov 2013 = 1,014 เที่ยวบิน
		#วันที่มีเที่ยวบิน น้อยที่สุด ในปี = 28 Nov 2013 =  634 เที่ยวบิน 

  date_least_flight<- flights %>%
   group_by (month) %>%
   count(day)%>% 
   arrange(n)%>%
   head(1)
 
 date_most_flight<- flights %>%
   group_by (month) %>%
   count(day)%>% 
   arrange(-n)%>%
   head(1)
 
    
 ## [4]สนามบินปลายทางที่ไกลที่สุดจากต้นทาง ของวันที่มีเที่ยวบินมากที่สุด = HNL 
 flights %>% 
   select (day,month,dest,distance) %>%
   filter (day == date_least_flight$day,
           month == date_least_flight$month) %>%
   group_by(dest) %>% 
   arrange(desc(distance)) %>% 
   head(1) %>% 
   inner_join(airports, by = c("dest" ="faa"))
 
 
  # [5] เที่ยวบินขาเข้า ของสนามบิน HNL ในวันที่ 27 Nov มาจากที่ใดบ้าง 
 flights %>% 
   select (day,month,dest,origin,flight) %>%
   filter (dest == "HNL",
           month == 11,
           day == 27) %>%
    group_by(origin) %>% 
   inner_join(airports, by = c("dest" ="faa"))
