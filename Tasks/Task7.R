library(dplyr)
library(tidyverse)
library(nycflights13)
nyc.weather <- nycflights13::weather
library(ggplot2)
nycwind_plot <- ggplot(nyc.weather, aes(x=time_hour, y=wind_speed)) + geom_point()
print(nycwind_plot)                       

windspeed_filtered <- filter(nycflights13::weather, wind_speed < 200)

windspeed_dplyr <- nyc.weather %>%
  group_by(wind_speed) %>%
  filter(wind_speed < 200) %>%
  print(windspeed_dplyr)

med_windspeed = windspeed_dplyr %>%
  group_by(wind_dir, origin) %>%
  summarise(wind_spd_med = median(wind_speed)) %>%
  group_by(origin) %>%
  filter(wind_spd_med == max(wind_spd_med))

EWR = med_windspeed %>%
  filter(origin == 'EWR')

JFK = med_windspeed %>%
  filter(origin == "JFK")

LGA = med_windspeed %>%
  filter(origin == "LGA")

nyc_flights_air <- inner_join(nycflights13::flights, airlines)

JFK_med_dist = nyc_flights_air %>%
  filter(origin == "JFK") %>%
  group_by(name) %>%
  summarise(med_dist_JFK = median(distance)) %>%
  arrange(desc(med_dist_JFK))

wide.frame <- nyc_flights_air %>%
  group_by(month, name) %>%
  summarise(month.airline = length(month)) %>%
  spread(name, month.airline)

library(babynames)

baby_names <- babynames::babynames
 
topnames = baby_names %>%
  filter(year == 2014) %>%
  group_by(sex) %>%
  top_n(10,n) %>%
  select(year, sex, name)

topgirl = baby_names %>%
  filter(year == 2014) %>%
  filter(sex == 'F') %>%
  top_n(10,n)

topboy = baby_names %>%
  filter(year == 2014) %>%
  filter(sex == 'M') %>%
  top_n(10,n)

name_girl <- baby_names %>%
  filter(sex == 'F') %>%
  filter(name %in% top_ten_girl$name) %>%
  select(year,sex,name,prop) %>%
  group_by(name)

name_boy <- baby_names %>%
  filter(sex == 'M') %>%
  filter(name %in% top_ten_boy$name) %>%
  select(year,sex,name,prop) %>%
  group_by(name)

ggplot(name_girl, aes(year, prop, color = name))+
  geom_line()

ggplot(name_boy, aes(year, prop, color = name))+
  geom_line()

common_1896 <- baby_names %>%
  select(year, sex, name, n) %>%
  filter(sex == 'F') %>%
  filter(year == 1896)

common_1942 <- baby_names %>%
  select(year, sex, name, n) %>%
  filter(sex == 'F') %>%
  filter(year == 1942)

common_2014 <- baby_names %>%
  select(year, sex, name, n) %>%
  filter(sex == 'F') %>%
  filter(year == 2014)

common_names_join = full_join(common_1896, common_1942)
common_names = full_join(common_join, common_2014)

names_26_29 = common_names %>%
  group_by(year) %>%
  top_n(29,n) %>%
  top_n(-4,n)
print(names_26_29)