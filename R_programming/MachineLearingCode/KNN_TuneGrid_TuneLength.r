## KNN model

## making train control : k-fold cv
set.seed(42)

ctrl_3 <- trainControl(
  method = "cv",
  number = 5,
  verboseIter = TRUE
)

## making a knn model
knn_model <- train(medv ~ rm + b + crim + lstat + age , 
                   data = train_df, 
                   method = "knn", 
                   trControl = ctrl_3, 
                   preProcess = c("center", "scale", "BoxCox"),
                   tuneLength = 5 ## tuning hyper parameter in train process
                   )


## train final model using k = 5
knn_model_k5 <- train(medv ~ rm + b + crim + lstat + age , 
                   data = train_df, 
                   method = "knn",
                   tuneGrid = data.frame(k = 5) , ## set k = 5
                   trControl = trainControl(method = "none"), ## no resampling process
                   preProcess = c("center", "scale", "BoxCox")
                   )


## prediction test set
p <- predict(knn_model, newdata = test_df)

p_train <- predict(knn_model_k5)
p_test <- predict(knn_model_k5, newdata = test_df)


## rmse for test set
cal_rmse(test_df$medv, p)

cal_rmse(train_df$medv, p_train)
cal_rmse(test_df$medv, p_test)

## mae
cal_mae(test_df$medv, p)

cal_mae(train_df$medv, p_train)
cal_mae(test_df$medv, p_test)

## tune Length vs. tune Grid (set k manually)
set.seed(42)

ctrl_3 <- trainControl(
  method = "cv", ## k-fold cv
  number = 5,
  verboseIter =  T
)

## tune Grid
model <- train(medv ~ rm + b + crim + lstat + age , 
               data = train_df, 
               method = "knn",
               tuneGrid = data.frame(k = c(5,7,13)),
               preProcess = c("center", "scale"),
               trControl = ctrl_3
               )

## tune Length
model <- train(medv ~ rm + b + crim + lstat + age , 
               data = train_df, 
               method = "knn",
               tuneLength = 5, ## model will select top 5 best performance for K,
               preProcess = c("center", "scale"),
               trControl = ctrl_3
)

## select other metric to evaluate our model
model <- train(medv ~ rm + b + crim + lstat + age , 
               data = train_df, 
               method = "knn",
               tuneGrid = data.frame(k = c(5,7,13)),
               preProcess = c("center", "scale"),
               trControl = ctrl_3,
               metric = "MAE" ## select metric
               )


## ML == Experimentation
