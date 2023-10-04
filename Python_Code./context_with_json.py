## dict to json
import json 
# .load(), .dump()

book = {
    "name" : "How to be better in almost every thing",
    "year" : 2018,
    "author" : "Pat Flynn",
    "favorite" : True
}

with open("book.json", "w") as file:
    json.dump(book, file)
    print("Create file successfully!")




## combine with try / accept to avoid an error
try:
    with open("COURSE.csv", 'r') as file:
        data = csv.reader(file)
        for row in data:
            print(row)
except FileNotFoundError:
    print("file not found, please check your file name again")

else:
    print("Open file successfully")
