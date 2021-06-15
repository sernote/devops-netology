Вопрос 1.  \
Ключ ip должен быть обособлен кавычками как и значение,
Управляющий символ табуляции не имеет смысла в данном контексте,

````
{ "info" : "Sample JSON output from our service",
    "elements" :[
        { "name" : "first",
        "type" : "server",
        "ip" : 7175
        },
        { "name" : "second",
        "type" : "proxy",
        "ip" : "71.78.22.43"
        }
    ]
}
````

Вопрос 2.
````   
import json
import socket
import os
import yaml

# get services ip
services = ["drive.google.com", "mail.google.com", "google.com"]
current_services_ip = {x: socket.gethostbyname(x) for x in services}

services_json = "services.json"
services_yaml = "services.yaml"
last_services_ip = {}


def save_check_results():
    """saving current services ip"""
    with open(services_json, "w") as last_check_json:
        json.dump(current_services_ip, last_check_json)

    with open(services_yaml, "w") as last_check_yaml:
        yaml.dump(current_services_ip, last_check_yaml)


def is_any_ip_change(services: dict) -> bool:
    result = False
    for service in services:
        current_ip = current_services_ip[service]
        print(f"{service} - {current_ip}")

        # check current results with previous, if they are known
        if len(last_services_ip.keys()) != 0:
            last_ip = last_services_ip[service]

            if current_ip != last_ip:
                print(f"[ERROR] {service} IP mismatch: {last_ip} {current_ip}")
                result = True

    return result


# read previous check results
if os.path.exists(services_json):
    with open(services_json, "r") as last_check_file:
        last_services_ip = json.load(last_check_file)

if is_any_ip_change(last_services_ip):
    save_check_results()
````   
