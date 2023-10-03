## train control
## change resampling technique

## Bootstrap
ctrl_1 <- trainControl(
  method ="boot",
  number = 50,
  verboseIter = TRUE ## Show log for each Iteration
)

## Leave one out CV
ctrl_2 <- trainControl(
  method ="LOOCV",
  verboseIter = TRUE ## Show log for each Iteration
)

## K-Fold CV
ctrl_3 <- trainControl(
  method = "cv",
  number = 5,
  verboseIter = TRUE
)

lm_model_1 <- train(medv ~ ., data = train_df, method = "lm", trControl = ctrl_1)
lm_model_2 <- train(medv ~ ., data = train_df, method = "lm", trControl = ctrl_2)
lm_model_3 <- train(medv ~ ., data = train_df, method = "lm", trControl = ctrl_3)

## variabel important
varImp(lm_model_3)

## stat from model
lm_model_3$finalModel %>%
  summary()
