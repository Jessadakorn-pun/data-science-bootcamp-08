data("BostonHousing")
View(BostonHousing)

mini_house <- BostonHousing %>%
  select(medv, rm, age, dis)


## apply this function to all columns in data frame
## 2 = column , 1 = row
norm_mini_house <- apply(mini_house, 2, normalize_data)

## k-mean clustering
km_result <- kmeans(mini_house, center = 5)

km_result$size
km_result$cluster

## assign cluster back to dataframe
mini_house$cluster <- km_result$cluster
View(mini_house)

mini_house %>%
  group_by(cluster) %>%
  summarize(avg_price = mean(medv),
            avg_rm = mean(rm))

## apply this function to all columns in data frame
## 2 = column , 1 = row
norm_mini_house <- apply(mini_house, 2, normalize_data)
