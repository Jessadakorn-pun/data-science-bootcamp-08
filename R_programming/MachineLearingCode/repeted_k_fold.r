set.seed(42)

ctrl <- trainControl(
  method = "repeatedcv", ## k-fold cv
  number = 5 , # k = 5
  repeats = 5, # repeats = 5
  verboseIter =  T
)

model <- train(medv ~ rm + b + crim + lstat + age , 
               data = train_df, 
               method = "knn",
               tuneGrid = data.frame(k = c(5,7,13)),
               preProcess = c("center", "scale"),
               trControl = ctrl,
               metric = "Rsquared"
)
