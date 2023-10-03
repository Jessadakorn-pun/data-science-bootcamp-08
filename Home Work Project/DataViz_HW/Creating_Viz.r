df <- diamonds
View(df)

## chart price vs carat
set.seed(66)
small_diamonds <- sample_frac(diamonds, size = 0.1)

## Graph 1
ggplot(data = small_diamonds, mapping = aes(x = carat , y = price, col = price )) +
  geom_point(alpha = 0.8) +
  geom_smooth(col = "black", se = F) +
  theme_minimal() +
  scale_colour_gradient_tableau('Red') +
  labs(title = "Scatter plot of Price vs. Carat",
       subtitle =  "DataSet : Diamonds with random sample size = 10 %",
       x = "Carat",
       y = "Price")

## Graph 2
ggplot(diamonds, mapping = aes(x = price)) +
  geom_histogram(bins = 100, fill = "#5c8991") +
  theme_minimal() +
  labs(title = "The Distribution of Price",
       subtitle = "Dataset : Diamond",
       x = "Price",
       y = "Count")

ggplot(diamonds, mapping = aes(x = price)) +
  geom_density() +
  theme_minimal() +
  labs(title = "Density plot of Price",
       subtitle = "Dataset : Diamond",
       x = "Price",
       y = "Density")

## Graph 3
ggplot(diamonds, aes(clarity, fill = cut)) +
  geom_bar(position = "dodge") +
  theme_minimal() +
  coord_flip() +
  labs(title = "Bar plot of Clearity vs. Cut",
       subtitle =  "DataSet : Diamonds")

ggplot(diamonds, aes(clarity)) +
  geom_bar(fill = "#5c8991") +
  theme_minimal() +
  labs(title = "Bar plot of Clearity",
       subtitle =  "DataSet : Diamonds")

## graph 4
ggplot(diamonds, aes(clarity, price)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Boxplot of Price vs. Clarity",
       subtitle =  "DataSet : Diamonds")

## graph 5
ggplot(small_diamonds, aes(carat, price, col = color)) +
  geom_point(alpha = 1) +
  scale_color_brewer(type = "div", palette = 6) +
  labs(title = "Scatter plot Price vs. Carrat by color",
       subtitle = "DataSet : Diamonds")

ggplot(small_diamonds, aes(carat, price, col = price)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method ="lm", col = "black") +
  scale_color_gradient(low = "#93d48c",high = "#3d593a") +
  facet_wrap(~clarity) +
  theme_minimal() +
  labs(title = "Scatter plot Price vs. Carrat by clarity",
       subtitle = "DataSet : Diamonds")
  
