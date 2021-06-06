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

````   
