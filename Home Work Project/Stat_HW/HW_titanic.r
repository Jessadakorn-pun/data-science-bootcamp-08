## install library
install.packages("tidyverse")
install.packages("ggthemes")
install.packages("patchwork")
install.packages("titanic")
install.packages("caret")

library(tidyverse)
library(ggthemes)
library(patchwork)
library(titanic)
library(caret)

## Clean Data
## Drop NA (Missing Values)
df <- titanic_train
df <- na.omit(titanic_train)
View(df)
summary(df)

## set factor columns
df$Survived<- factor(df$Survived, level = c(0, 1), labels = c("not_survive", "survive"))
df$Pclass <- factor(df$Pclass, level = c(1,2,3), labels = c("1st", "2nd", "3rd"))
df$Sex <- factor(df$Sex, level = c("male", "female"))
df$Embarked <- factor(df$Embarked, level = c("C", "Q", "S"))

## EDA

## age
age_his <- ggplot(df , aes(Age)) +
  geom_histogram(bins = 50, fill = "#b85849") +
  theme_minimal() +
  labs(title = "Histogram of Passenger Age in titanic")

age_his

age_den <- ggplot(df , aes(Age)) +
  geom_density()

age_den

df %>%
  select(Age) %>%
  summarise(mean_age = mean(Age), med_age = median(Age), sd_age = sd(Age), min_age = min(Age), max_age = max(Age))

most_freq <- df %>%
  count(Age) %>%
  arrange(-n) %>%
  head(5)

most_freq



ggplot(df, aes(Survived, Age, fill = Survived)) +
  geom_boxplot()

summarise_s <- df %>%
  filter(Survived == "survive") %>%
  select(Age) %>%
  summarise(mean_age = mean(Age), sd_age = sd(Age), min_age = min(Age), max_age = max(Age))
summarise_s 

most_freq_s <- df %>%
  filter(Survived == "survive") %>%
  count(Age) %>%
  arrange(-n) %>%
  head(5)
most_freq_s


summarise_ns <- df %>%
  filter(Survived == "not_survive") %>% 
  select(Age) %>%
  summarise(mean_age = mean(Age), sd_age = sd(Age), min_age = min(Age), max_age = max(Age))
summarise_ns 

most_freq_s <- df %>%
  filter(Survived == "not_survive") %>%
  count(Age) %>%
  arrange(-n) %>%
  head(5)
most_freq_s


## Passenger Class
ggplot(df, aes(Pclass, fill = Pclass)) + 
  geom_bar() +
  coord_flip() +
  theme_minimal() +
  labs(title = "Passenger Class",
       x = "Passenger Class")

ggplot(df, aes(Pclass, fill = Survived)) +
  geom_bar(position =  "dodge") +
  theme_minimal() +
  labs(title = "Passenger Class vs Surviving",
       x = "Passenger Class")


## Sex
ggplot(df, aes(Sex, fill = Survived)) + 
  geom_bar(position = "dodge") +
  theme_minimal() +
  labs(title = "Sex vs. Surviving")

## Siblings/Spouses Aboard and Parch
sg

## Embarked
df %>%
  select(Embarked, Survived) %>%
  count(Embarked, Survived)


## Split The Data set 
set.seed(42)
n <- nrow(df)
id <- sample(1:n, size = 0.7 * n)
train_data <- df[id,]
test_data <- df[-id,]

## Training model
## Pclass + Sex + Age + SibSp + Parch 
model <- glm(Survived ~  Pclass + Sex + Age + SibSp + Parch  , data = train_data, family = "binomial")
summary(model)


train_data$prob_sur <- predict(model, type = "response")
train_data$pred_sur <- ifelse(train_data$prob_sur >= 0.6, "survive", "not_survive" )

con_m1 <- confusion_matrix_cal(train_data$pred_sur, train_data$Survived)



## Test data
test_data$prob_sur <- predict(model, newdata = test_data)
test_data$pred_sur <- ifelse(test_data$prob_sur >= 0.6, "survive", "not_survive" )
con_m2 <- confusion_matrix_cal(test_data$pred_sur, test_data$Survived)



## confusion calculater
confusion_matrix_cal <- function(predicted, actual) {
  
  con_m <- table(predicted, actual, dnn = c("Predicted", "Actucal"))
  print(con_m)
  
  acc <- (con_m[1,1] + con_m[2, 2]) / sum(con_m)
  cat("Accuracy :", acc) 
  
  pre <- con_m[2,2] / (con_m[2,1] + con_m[2,2])
  cat("\nPresision :", pre)
  
  rec <- con_m[2,2] / (con_m[1,2] + con_m[2,2])
  cat("\nRecall :", rec)
  
  f1 <- (2*pre*acc) / (pre + acc)
  cat("\nF1 :", f1)
}
