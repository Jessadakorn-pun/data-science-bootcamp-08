split_data <- function(data, size) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(1:n, size = size * n)
  train_df <- data[id, ]
  test_df <- data[-id, ]
  return(list(training = train_df, testing = test_df))
}
