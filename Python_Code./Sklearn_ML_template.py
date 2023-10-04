## Evaluate function
def evaluate(predicted, actual):
    result = []

    ## MAE
    mae = np.mean(abs(actual - predicted))
    r_mae = f"MAE : {round(mae, 4)}"
    result.append(r_mae)

    ## MSE
    mse = np.mean((actual - predicted) **2)
    r_mse = f"MSE : {round(mse, 4)}"
    result.append(r_mse)

    ## RMSE
    rmse = (np.mean((actual - predicted) **2)) ** 0.5
    r_rmse = f"MSE : {round(rmse, 4)}"
    result.append(r_rmse)

    return  result

## Linear Regression
## sklearn basic 
## ref : https://scikit-learn.org/stable/
import numpy as np
import pandas as pd

## read data
url = "https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv"
df = pd.read_csv(url)
df.head()

# prepare data
x = df.drop(["mpg", "model"], axis = 1)
y = df["mpg"]

## split data
from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 0.25, random_state = 42)

## train Linear Regression model
from sklearn.linear_model import LinearRegression
model_1 = LinearRegression()
model_1.fit(x_train, y_train)

p_1 = model_1.predict(x_test)

## R square
model_1.score(x_test, y_test)

## model evaluate
evaluate(p_1, y_test)

## Decision Tree
## train decision tree model
from sklearn.tree import DecisionTreeRegressor
model_2 = DecisionTreeRegressor()
model_2.fit(x_train, y_train)

## model fitting
p = model_2.predict(x_test)

## model evaluate
model_2.score(x_test, y_test)

## model evaluation
evaluate(p, y_test)

## Random forest
from sklearn.ensemble import BaggingRegressor

model_3 = BaggingRegressor()
model_3.fit(x_train, y_train)

## predict model
p = model_3.predict(x_test)

## model evaluate
model_3.score(x_test, y_test)

evaluate(p, y_test)

## Elasticnet
from sklearn.linear_model import ElasticNet
model_4 = ElasticNet()
model_4.fit(x_train, y_train)

p = model_4.predict(x_test)
model_4.score(x_test, y_test)
evaluate(p, y_test)
