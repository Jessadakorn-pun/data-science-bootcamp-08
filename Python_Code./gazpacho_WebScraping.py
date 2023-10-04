## install new librart 
## pip -> package manager in python
!pip install gazpacho

## import fuction
from gazpacho import Soup
import requests

## web scraping basics

url = "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"
html = requests.get(url) ## Accept-Language

html.text

imdb = Soup(html.text)
imdb

imdb.find('h1')
imdb.find('h3', {'class' : 'lister-item-header'})

titles = imdb.find('h3', {'class' : 'lister-item-header'})
titles[0].strip()

clean_title = []
for title in titles:
    clean_title.append(title.strip())

print(clean_title)

## list comprehension
clean_title_2 = [
    title.strip() for title in titles
]
print(clean_title_2)

## get rating form website
rating = imdb.find("div", {"class" : "inline-block ratings-imdb-rating"})
rating[0].strip()

clean_rating = []
for r in rating:
    clean_rating.append(r.strip())
print(clean_rating)
print(len(clean_rating))

## creating dataframe
import pandas as pd
movie_database = pd.DataFrame( data = {
    'title' : clean_title,
    'rating' : clean_rating

})

## print first 10 rows
movie_database.head(n = 10)
