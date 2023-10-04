## contex manager => with
## use to open data file
##  ลดการลืมปิด file

## import
from csv import reader
result = []

with open("friend.csv", "r") as file:
    data = reader(file)
    for row in data:
        result.append(row)

result

## import csv
## write mode
import csv

headers = ['id', 'course', 'students']
body_data = [
    [1, 'data science', 30],
    [2, 'marketing', 28],
    [3, 'power BI', 35]
             ]
with open("courses.csv", 'w') as file:
    writer = csv.writer(file)
    writer.writerow(headers) ## write one row
    writer.writerows(body_data) ## write mutiple rows
