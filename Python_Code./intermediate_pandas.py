import pandas as pd

penguins = pd.read_csv("penguins.csv")

## preview first 5 rows
penguins.head(5)

## shape of dataframe
penguins.shape

## information of dataframe
penguins.info()

## select column
penguins['species'].head()

penguins.species.head()

penguins[['species', 'island', 'sex']].tail()


## iloc[row, column]
mini_penguins = penguins.iloc[0:3, [0,1,2]]
mini_penguins

## filtering with condition
penguins['island'] == 'Torgersen'

penguins[penguins['island'] == 'Torgersen']

penguins[penguins['bill_length_mm'] < 34]

## filter with more than one condition
## & : and
## | : or
penguins[(penguins['island'] == 'Torgersen') & (penguins['bill_length_mm'] < 35)]

## filter with query
penguins.query("island == 'Torgersen'")

penguins.query('island == "Torgersen" & bill_length_mm < 35')

## Checking missing value in each columns
penguins.isna().sum()

## filter missing value in columns sex
penguins['sex'].isna()
penguins[penguins['sex'].isna()]

## drop NA
clean_penguins = penguins.dropna()
clean_penguins

clean_penguins.isna().sum()

## Fill NA with mean
avg_value = top5_penguins['bill_length_mm'].mean()
print(avg_value)

top5_penguins = top5_penguins['bill_length_mm'].fillna(value = avg_value)
top5_penguins

## Sort dataframe
penguins.dropna().sort_values('bill_length_mm', ascending= False).head(10)
## sort mutiple columns
penguins.dropna().sort_values(['island', 'bill_length_mm'], ascending= False)

## unique value
penguins['species'].unique()

## count values
penguins['species'].value_counts()

## count more than one columns
result = penguins[['island', 'species']].value_counts().reset_index()
result.columns = ['island', 'species', 'count']
result.sort_values('island').reset_index(drop = True)

## summarise dataframe
penguins.describe()
## summarise all variable
penguins.describe(include= "all")

## average, mean
print("mean = ",penguins['bill_length_mm'].mean())
print("sd = ",penguins['bill_length_mm'].std())

## group by + sum / mean
penguins.groupby('species')['bill_length_mm'].mean()
penguins.groupby('species')['bill_length_mm'].agg(['min', 'max', 'median', 'std', 'mean'])

## group by more than one columns
result = penguins.groupby(['island', 'species'])['bill_length_mm'].agg(['min', 'mean', 'max']).reset_index()
result

## map({"old_value" : "new_value"})
penguins['sex'].map({'MALE': 'm', 'FEMALE' : 'f'}).fillna('other')

## numpy where clause
df['new_column'] = np.where(df['bill_length_mm'] > 40, True, False)
df.head(10)


## mearge dataframe
left = {
    'key' : [1, 2, 3, 4],
    'name' : ['toy', 'joe', 'jane', 'anna'],
    'age' : [25, 28, 30, 22]
}

right = {
    'key' : [1, 2, 3, 4],
    'city' : ['Bagkok', 'London', 'Seoul', 'Tokyo'],
    'zip' : [1001, 2504, 2094, 9802]
}

df_left = pd.DataFrame(left)
df_right = pd.DataFrame(right)

df_result =pd.merge(df_left, df_right, on = 'key')
df_result

## quick plot
## histogram 1 columns
penguins['body_mass_g'].plot(kind = "hist");

## histogram 2 columns
penguins[['body_mass_g', 'bill_length_mm']].plot(kind = 'hist', bins = 30)

penguins['bill_length_mm'].plot(kind = 'hist', bins = 30, color = "salmon")

# bar plot for species
penguins['species'].value_counts().plot(kind = 'bar', color = ['salmon', 'orange', 'yellow'])

## scatter plot
penguins[['bill_length_mm', 'bill_depth_mm']]\
    .plot(x = 'bill_length_mm', y = 'bill_depth_mm', kind = 'scatter', color = 'black');
