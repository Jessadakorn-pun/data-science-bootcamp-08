library(mlbench)
library(tidyverse)
library(caret)

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

## training logistic regression model

set.seed(42)
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter =  T)

logistic_model <- train(diabetes ~ .,
                        data = train_df,
                        method = "glm",
                        trControl = ctrl)

logistic_model

## score new data set
p <- predict(logistic_model, newdata = test_df)

## evaluate model
confusionMatrix(p, test_df$diabetes,
                positive = "pos",
                mode = "prec_recall")


## glmnet : ridge and lasso (0 = rigde and 1 = lasso)
## tune grid
my_grid <- expand.grid(alpha = 0:1 , lambda = seq(0.0005, 0.5, length = 20))
## regularization regression
glmnet_model <- train(diabetes ~ .,
                        data = train_df,
                        method = "glmnet",
                        trControl = ctrl,
                        tuneGrid = my_grid)

glmnet_model

## score new data set
p1 <- predict(glmnet_model, newdata = test_df)

## evaluate model
confusionMatrix(p1, test_df$diabetes,
                positive = "pos",
                mode = "prec_recall")


