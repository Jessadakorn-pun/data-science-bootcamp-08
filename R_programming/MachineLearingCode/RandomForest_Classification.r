library(mlbench)
library(tidyverse)
library(caret)
library(rpart)
data("PimaIndiansDiabetes")

df <- PimaIndiansDiabetes

View(df)

str(df)

## split data process

set.seed(42)
n <- nrow(df)
id <- sample(1:n, size = n * 0.8)
train_df <- df[id, ]
test_df <- df[-id, ]

## resampling 
set.seed(42)
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter =  T)
## random forest model
## mtry hyperparmeter => no.column
rf_model <- train(diabetes ~ .,
                  data = train_df,
                  #tuneGrid = expand.grid(mtry = c(3, 5)),
                  tuneLength = 5,
                  trControl = ctrl)

rf_model

## score new data set
p3 <- predict(rf_model, newdata = test_df)

## evaluate model
confusionMatrix(p3, test_df$diabetes,
                positive = "pos",
                mode = "prec_recall")
