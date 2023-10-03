df <- flights
View(df)

## destination
df %>%
  count(dest) %>%
  arrange(desc(n)) %>%
  head(5)

df %>%
  filter(dest == "ORD")%>%
  count(carrier)

df %>%
  filter(dest == "ORD") %>%
  count(origin) %>%
  arrange(desc(n))


## top distance
df %>%
  select(carrier, origin, dest, distance) %>%
  arrange(desc(distance)) 
  

## percent of longest flight in that carrier
df %>%
  mutate(top_dis = ifelse(distance > 4500, "Y" , "N")) %>%
  count(top_dis) %>%
  mutate(percentage = (n / sum(n) * 100)) 
 
## flight to HNL (top distance)
df %>%
  filter(distance == 4983) %>%
  count(carrier) 

df %>%
  select(origin, dest ,distance) %>%
  filter(dest == "HNL") %>%
  group_by(origin) %>%
  summarise(max(distance))

## time of top distance
df %>%
  select(origin, dest ,distance, air_time ,hour, minute) %>%
  filter(dest == "HNL") %>%
  mutate(total_min = hour * 60 + minute ) %>%
  group_by(origin) %>%
  summarise(mean(distance), mean(total_min), mean(air_time, na.rm = T)) 
  
## popula flights
df %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  head(5)
## popular month
df %>%
  count(month) %>%
  arrange(desc(n))

## popular carrier in that month
df %>%
  count(month, carrier) %>%
  group_by(month) %>%
  filter(n == max(n))

## popular destination by month
df %>%
  count(month, dest) %>%
  group_by(month) %>%
  filter(n == max(n)) %>%
  left_join(airports, by = c("dest" = "faa")) %>%
  select(month, name , n)
  
  
## hightest avg arrive delay time
df %>%
  select(carrier, arr_delay) %>%
  group_by(carrier) %>%
  summarise(arr_delay_avg = mean(arr_delay, na.rm = T)) %>%
  arrange(-arr_delay_avg) %>%
  head(1)
 
## hightest avg departure delay time
df %>%
  select(carrier, dep_delay) %>%
  group_by(carrier) %>%
  summarise(dep_delay_avg = mean(dep_delay, na.rm = T)) %>%
  arrange(-dep_delay_avg) %>%
  head(1)
