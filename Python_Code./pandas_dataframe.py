import pandas as pd

## create dataframe from scratch
raw_data = {
    "name" : ["Toy", 'Joe', 'Marry', 'John', 'Anna'],
    "age" : [33, 25, 20, 22, 31],
    "gender" : ['M', 'M', 'F', 'M', 'F']
}

df = pd.DataFrame(raw_data)
df

## view number of rows and columns
df.shape

## drop column city (axis = 1 : column)
df.drop('city', axis = 1, inplace = True)
df

## remove index = 2 (axis = 0 : row)
df.drop(2, axis = 0, inplace = True)
df

# reset index
df = df.reset_index(drop = True)
df

## column names
list(df.columns)
## rename columns
df.columns = ['nickname', 'age', 'sex']
df

## Create a new series
s1 = pd.Series(['Marry', 20, 'F'], index = ['nickname', 'age', 'sex'])
print(s1)

## append series into dataframe
df = df.append(s1, ignore_index= True)
df

## Adding series to column in dataframe
s2 = pd.Series(["London", 'London', 'London', 'Manchester', 'Liverpool'])
df["city"] = s2

## write csv file
df.to_csv('mydata.csv')

## import csv file
df2 = pd.read_csv("data/data.csv")
df2

## import excel file
df3 = pd.read_excel("data/data.xlsx")
df3

## import json 
df4 = pd.read_json("data/data.json")
df4

## checking data type
df4['myFavorite'].dtype

df
