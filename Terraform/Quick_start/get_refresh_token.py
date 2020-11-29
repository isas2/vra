import requests
import json
from getpass import getpass

username = input("vRA user: ")
password = getpass()

body = {
    "username": username,
    "password": password
}
json_data = json.dumps(body)
vra_url = "https://vra8.zabedu.ru/csp/gateway/am/api/login?access_token"
headers = {'Content-type': 'application/json'}
response = requests.post(vra_url, verify = False, data = json_data, headers=headers)
response_json = response.json()

file_name = "refresh_token.txt"
f = open(file_name, "w")
f.write(response_json["refresh_token"])
f.close
