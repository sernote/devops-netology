Вопрос 1. 
- с будет равно "a+b" потому что по умолчанию переменная - строка и мы просто создали новую строку;
- d будет равно "1+2" потому что мы создали строку и использовали значения a и b;
- e будет равно 3 потому что использована операция сложения;

Вопрос 2. \
Были допущены синтаксическая ошибка (скобка) и отсутвие выхода из цикла(оператор break) если сервис доступен. 
Правильный вариант:
````
while ((1==1))
do
    curl https://localhost:4757
    if (($? != 0))
    then
        date >> curl.log
    else
        break
    fi
done
````

Вопрос 3. 
````   
array_str=("192.168.0.1" "173.194.222.113" "87.250.250.242")
a=5
while (($a > 0))
do
    for host in ${array_str[@]}
    do
        curl http://$host:80 --connect-timeout 5
        echo "$(date): $host: $?" >> curl.log
    done
let "a-=1"
done
````   

Вопрос 4.
````   
array_str=("173.194.222.113" "192.168.0.1" "87.250.250.242")
while ((1 == 1))
do
    status=1
    for host in ${array_str[@]}
    do
        curl http://$host:80 --connect-timeout 5
        if (($? != 0))
        then
            echo "$(date): $host: $?" >> error.log
            status=0
            break
        fi
    done
    if(($status != 1))
    then
       break
    fi
done
````   
