## request and response cycle
import requests 

url = "https://swapi.dev/api/people/15"

resp = requests.get(url)

## if success, status code == 200
resp.status_code

## see information
resp.text

## see data in json
resp.json()

## select name
resp.json()["name"]


import requests
import time

char = []
for i in range(1,6):
    url = f"https://swapi.dev/api/people/{i}"
    resp = requests.get(url)
    if resp.status_code == 200:
        char.append(
            (resp.json()["name"],
            resp.json()["height"])
        )
    else:
        print("error")
    time.sleep(1) ## pause API request for 1 sec
print(char)
