library(tidyverse)
library(nycflights13)

#homework
#dplyr 5 query

#find year , month , day , dep_time, arr_time and sched_dep_time, sched_arr_time 
#of flights between 1 - 15 September and order by day
flights %>%
  select(year, month, day,dep_time, arr_time,sched_dep_time, sched_arr_time) %>%
  filter(month == 9 & day >= 1 & day <= 15) %>%
  arrange(day)

#find top 3 airline name with most flight
flights %>%
  count(carrier) %>%
  arrange(-n) %>%
  head(3) %>%
  left_join(airlines)

#find mean of dep_delay and mean of arr_delay that group by carrier 
flights %>%
  group_by(carrier) %>%
  drop_na() %>%
  summarise(mean(dep_delay),
            mean(arr_delay)) 

#find flights that total delay more than 1000 and sort it by total delay in DESC
flights %>%
  select(dep_delay,arr_delay,carrier) %>%
  mutate(total_delay = dep_delay + arr_delay) %>%
  filter(total_delay > 1000) %>%
  arrange(-total_delay)

#find max and min of total delay of each month
flights %>%
  mutate(total_delay = dep_delay + arr_delay) %>%
  group_by(month) %>%
  drop_na() %>%
  summarise(max(total_delay),
            min(total_delay)) 

  

    