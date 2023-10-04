# -*- coding: utf-8 -*-

# -- Project --

# # Final Project - Analyzing Sales Data
# 
# **Date**: 1 September 2023
# 
# **Author**: Jessadakorn Vorathammaporn
# 
# **Course**: `Pandas Foundation`


# import data
import pandas as pd
df = pd.read_csv("sample-store.csv")

# preview top 5 rows
df.head()

# shape of dataframe
df.shape

# see data frame information using .info()
df.info()

# We can use `pd.to_datetime()` function to convert columns 'Order Date' and 'Ship Date' to datetime.


# example of pd.to_datetime() function
pd.to_datetime(df['Order Date'].head(), format='%m/%d/%Y')

# TODO - convert order date and ship date to datetime in the original dataframe
df['Order Date'] = pd.to_datetime(df['Order Date'], format = '%m/%d/%Y')
df["Ship Date"] = pd.to_datetime(df["Ship Date"], format = '%m/%d/%Y')
df

# TODO - count nan in postal code column
df['Postal Code'].isna().sum()

# TODO - filter rows with missing values
df[df['Postal Code'].isna()]

# TODO - Explore this dataset on your owns, ask your own questions
df.groupby(['State', 'Category'])['Profit']\
    .agg(['mean', 'median', 'std'])\
        .reset_index()\
            

# ## Data Analysis Part
# 
# Answer 10 below questions to get credit from this course. Write `pandas` code to find answers.


# TODO 01 - how many columns, rows in this dataset
df.shape

# TODO 02 - is there any missing values?, if there is, which colunm? how many nan values?
df.isna().sum()

# TODO 03 - your friend ask for `California` data, filter it and export csv for him
df_california = df.query("State == 'California'")
df_california.to_csv("result_california.csv")

# TODO 04 - your friend ask for all order data in `California` and `Texas` in 2017 (look at Order Date), send him csv file
df['year'] = df['Order Date'].dt.strftime("%Y")
df_ca_tx_2017 = df.query("((State == 'California') | (State == 'Texas')) & (year == '2017')")
df_ca_tx_2017.to_csv("result_ca_tx_2017")

# TODO 05 - how much total sales, average sales, and standard deviation of sales your company make in 2017
df.query("year == '2017'")['Sales'].agg(['sum', 'mean', 'std'])

# TODO 06 - which Segment has the highest profit in 2018
df.query("year == '2018'").groupby('Segment')['Sales'].sum().sort_values(ascending = False).head(1)

# TODO 07 - which top 5 States have the least total sales between 15 April 2019 - 31 December 2019
df[(df['Order Date'] >= "2019-04-15") & (df['Order Date'] <= "2019-12-31")]\
    .groupby("State")["Sales"]\
        .sum().sort_values().head(5)
    

# TODO 08 - what is the proportion of total sales (%) in West + Central in 2019 e.g. 25% 
sum_sales = df[df['year'] == '2019'].groupby("Region")['Sales'].sum()
total_sale = sum_sales.sum()

prop_center_west = ((sum_sales[0] + sum_sales[3]) / total_sale) * 100
prop_center_west

# TODO 09 - find top 10 popular products in terms of number of orders vs. total sales during 2019-2020
df_2019_2020 = df[(df['year'] == "2019") | (df['year'] == '2020')]
df_2019_2020.groupby("Sub-Category")["Quantity"].sum().sort_values(ascending = False).head(10)

df_2019_2020.groupby("Sub-Category")["Sales"].sum().sort_values(ascending = False).head(10)

# TODO 10 - plot at least 2 plots, any plot you think interesting :)
result = df.groupby("Sub-Category")[['Quantity', 'Profit']].median()
result["ratio"] = result["Profit"] / result["Quantity"]

## sub-category vs Ratio of median profit per quantity
result['ratio'].sort_values(ascending = False).plot(kind = "bar", color = 'tomato')

df['month_year'] = df['Order Date'].dt.strftime("%m-%Y")
pre_plot = df.groupby("month_year")["Profit"].sum().reset_index()
pre_plot['month_year'] = pd.to_datetime(pre_plot['month_year'], format = '%m-%Y')
pre_plot.sort_values("month_year").plot(x = "month_year", y = "Profit", kind = "line", color = "salmon")

# TODO Bonus - use np.where() to create new column in dataframe to help you answer your own questions
import numpy as np
df['is_profit'] = np.where(df['Profit'] > 0, True, False)
df



