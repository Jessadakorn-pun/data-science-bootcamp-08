## load library
library(tidyverse)
library(caret)
library(readxl)
library(visdat)
library(lubridate)


## load data frame 
df_2016 <- read_excel("House_Price_India.xlsx", sheet = 1)
df_2017 <- read_excel("House_Price_India.xlsx", sheet = 2)

View(df_2016)
View(df_2017)

## checking data frame
glimpse(df_2016)


## checking NA Value
mean(complete.cases(df_2016))
vis_miss(df_2016)

mean(complete.cases(df_2017))
vis_miss(df_2017)

## bindcol
df <- bind_rows(df_2016, df_2017)
nrow(df)
## cleaning dataset
#convert feature to proper fromat
df_cleaned <- df %>%
  transmute(
            date = as.Date(Date, origin = "1900-01-01"),
            num_bed = `number of bathrooms`,
            num_bath = `number of bathrooms`,
            liv_a = `living area`,
            lot_a = `lot area`, 
            num_floor = `number of floors`,
            waterfront = as.factor(`waterfront present`), ## cleaned
            num_view = `number of views`,
            house_con = as.factor(`condition of the house`),
            house_grade = as.factor(`grade of the house`),
            area_house = `Area of the house(excluding basement)`,
            are_basement = `Area of the basement`,
            year_restore = ifelse(`Renovation Year` == 0, `Built Year`, `Renovation Year`), ##cleaned,
            living_area_renov,
            lot_area_renov,
            num_school = `Number of schools nearby`,
            dis_air = `Distance from the airport`,
            price = Price
            )

## checking num_date
df_cleaned %>%
  count(num_bed)

df_cleaned <- df_cleaned %>%
  mutate(num_bed = ceiling(num_bed)) 

## checking num_bath
df_cleaned %>%
  count(num_bath)

df_cleaned <- df_cleaned %>%
  mutate(num_bath = ceiling(num_bath))

## living area
ggplot(df_cleaned, aes(liv_a)) +
  geom_histogram()

df_cleaned <- df_cleaned %>%
  filter(liv_a <= 5000)

## lot area
ggplot(df_cleaned, aes(lot_a)) +
  geom_boxplot()

ggplot(df_cleaned, aes(lot_a)) +
  geom_histogram()

q3_la <- quantile(df_cleaned$lot_a, probs = 0.75)
q1_la <- quantile(df_cleaned$lot_a, probs = 0.25)
iqr_la <- q3_la - q1_la
upper <- q3_la + 1.5 * iqr_la
lower <- q1_la - 1.5 * iqr_la

df_cleaned <- df_cleaned %>% 
  filter(lot_a <= upper, lot_a >= lower)

## number of floor
df_cleaned %>%
  count(num_floor)

## number of view
df_cleaned %>%
  count(num_view)

## area house
ggplot(df_cleaned, aes(area_house)) +
  geom_histogram()

## area basement
ggplot(df_cleaned, aes(are_basement)) +
  geom_boxplot()

## living_area_renov
ggplot(df_cleaned, aes(living_area_renov )) +
  geom_histogram()

## lot_area_renov
ggplot(df_cleaned, aes(lot_area_renov )) +
  geom_histogram()

df_cleaned <- df_cleaned %>%
  filter(lot_area_renov <= 25000)

## number of school nearby
df_cleaned %>% 
  count(num_school)

## distance from airport
ggplot(df_cleaned, aes(dis_air )) +
  geom_histogram()

## price
ggplot(df_cleaned, aes(price)) +
  geom_histogram()

### EDA
# Price vs house Condition
ggplot(df_cleaned, aes(house_con, price, color = house_con)) +
  geom_point(position = position_jitter(), alpha = 0.5)

# price vs hhouse_grade
ggplot(df_cleaned, aes(house_grade, price, color = house_grade)) +
  geom_point(position = position_jitter(), alpha = 0.5)

##median price vs house grade
med_price_hg <- df_cleaned %>%
  group_by(house_grade) %>%
  summarize(median_price = median(price)) %>%
  arrange(-median_price)

ggplot(med_price_hg, aes(house_grade, median_price)) +
  geom_col(fill = "#4ec758") +
  coord_flip() +
  geom_text(aes(label = median_price), size = 3, hjust=-0.1) +
  theme_minimal() +
  ylim(c(0, 2e6)) +
  labs(title = "Median of Price vs. Grade of House",
        x = "Median of Price",
        y = "Grade of House",
       caption = "House Price India Dataset")

## median price vs codition of house

med_price_con <- df_cleaned %>%
  group_by(house_con) %>%
  summarize(median_price = median(price)) %>%
  arrange(-median_price)

ggplot(med_price_con, aes(house_con, median_price)) +
  geom_col(fill = "#d9c45d") +
  coord_flip() +
  geom_text(aes(label = median_price), size = 3, hjust=-0.1) +
  theme_minimal() +
  ylim(c(0, 7e5)) +
  labs(title = "Median of Price vs. Condition of House",
       x = "Median of Price",
       y = "Condition of House",
       caption = "House Price India Dataset")

## Distribution of Price
ggplot(df_cleaned, aes(price)) +
  geom_histogram(bins = 100, fill = "#c45e52") +
  theme_minimal() +
  labs(title ="The Distibution of House in India", 
       y = "Count", 
       x = "Price of House",
       caption = "House Price India Dataset")

nrow(df_cleaned)

## Traing Model
## baseline model : Linear Regression

# Split Train 80% and Test data 20%
set.seed(42)
n <- nrow(df_cleaned)
id <- sample(1:n, size = 0.8 * n)
train_df <- df_cleaned[id, ]
test_df <- df_cleaned[-id, ]

## K-fold cv with repeate
ctrl <- trainControl(
    method = "cv",
    number = 5,
    verboseIter = T
)


# Train
lm_model <- train(price ~ . -date ,
                  data = train_df,
                  method = "lm",
                  preProcess = c("center", "scale", "BoxCox"),
                  trControl = ctrl
                  )
varImp(lm_model)
lm_model$finalModel
summary(lm_model)
