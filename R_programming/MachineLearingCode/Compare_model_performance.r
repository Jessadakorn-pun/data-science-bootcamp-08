## resamples() => compare model performance
## predict diabetes

## Logistic Regression
model1 <- train(diabetes ~ .,
                data = train_df,
                method = "glm",
                trControl = trainControl(method = "cv", number = 5))

model2 <- train(diabetes ~ .,
                data = train_df,
                method = "rpart",
                trControl = trainControl(method = "cv", number = 5))

model3 <- train(diabetes ~ .,
                data = train_df,
                method = "rf",
                trControl = trainControl(method = "cv", number = 5))

model4 <- train(diabetes ~ .,
                data = train_df,
                method = "glmnet",
                trControl = trainControl(method = "cv", number = 5))

model5 <- train(diabetes ~ .,
                data = train_df,
                method = "nnet",
                trControl = trainControl(method = "cv", number = 5))



## resamples 
list_models = list(
  logistic = model1,
  tree = model2,
  randomForest = model3,
  glmnet = model4,
  nnet = model5)

result <- resamples(list_models)
summary(result)

