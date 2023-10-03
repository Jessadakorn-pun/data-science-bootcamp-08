## K-Fold CV
ctrl_3 <- trainControl(
  method = "cv",
  number = 5,
  verboseIter = TRUE
)

## add preProcess data 
## data standardization

help("preProcess")

lm_model_3 <- train(medv ~ ., 
                    data = train_df, 
                    method = "lm", 
                    trControl = ctrl_3,
                    preProcess = c("center", "scale", "BoxCox") ## z-score calculating 
                    )

lm_model_3$finalModel
