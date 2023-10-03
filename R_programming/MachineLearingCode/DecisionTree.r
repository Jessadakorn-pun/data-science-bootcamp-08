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

## training decision tree model

set.seed(42)
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter =T)

tree_model <- train(diabetes ~ .,
                        data = train_df,
                        method = "rpart",
                        ## complexity parameter : high cp -> good generalization
                        tuneGrid = expand.grid(cp = c(0.02, 0.1, 0.25)),
                        trControl = ctrl)

tree_model ## cp : complexity parameter


## score new data set
p <- predict(tree_model, newdata = test_df)

## evaluate model
confusionMatrix(p, test_df$diabetes,
                positive = "pos",
                mode = "prec_recall")

## plot tree model
library(rpart.plot)
rpart.plot(tree_model$finalModel)
