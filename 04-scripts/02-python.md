Вопрос 1.  \
Будет ошибка, тк pyhon не умеет не явно приводить типы (int и str в данном случае) \
12: 
````
с = int(str(a)+b)
````
3:
````
с = a+int(b)
````

Вопрос 2. 

````
import os

path_to_rep = "~/netology/sysadm-homeworks"
bash_command = [f"cd {path_to_rep}", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(f"{path_to_rep}/{prepare_result}")
````

Вопрос 3. 
```` 
import os
import sys

path_to_rep = "~/netology/sysadm-homeworks"

if len(sys.argv) > 1:
    path_to_rep = sys.argv[1]

if len([x for x in os.scandir(path_to_rep) if x.name == ".git"]) == 0:
    print(f"{path_to_rep} is not a git repo")
    sys.exit()

bash_command = [f"cd {path_to_rep}", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()

for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(f"{path_to_rep}/{prepare_result}")  
````   

Вопрос 4.
````   
import json
import socket
import os

services = ["drive.google.com", "mail.google.com", "google.com"]
current_services_ip = {x: socket.gethostbyname(x) for x in services}

check_file_path = "last_ip_check.json"
last_services_ip = {}

# read previous check results
if os.path.exists(check_file_path):
    with open(check_file_path, "r") as last_check_file:
        last_services_ip = json.load(last_check_file)

for service in services:
    current_ip = current_services_ip[service]

    print(f"{service} - {current_ip}")

    # check current results with previous, if they are known
    if len(last_services_ip.keys()) != 0:
        last_ip = last_services_ip[service]

        if current_ip != last_ip:
            print(f"[ERROR] {service} IP mismatch: {last_ip} {current_ip}")

# save current results
with open(check_file_path, "w") as last_check_file:
    json.dump(current_services_ip, last_check_file)

````   
