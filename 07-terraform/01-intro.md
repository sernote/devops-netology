Задание 1. \
Ответы на вопросы:

- Какой тип инфраструктуры будем использовать для этого проекта: изменяемый или не изменяемый? \
Ответ: Клиентов мало, поэтому - не изменяемый;
- Будет ли центральный сервер для управления инфраструктурой?
Нет, тк сервисом будет пользоваться внешний заказчик, а значит в случае с центральным сервером понадобиться проводить лишние работы по открытию портов в нашу сеть и аутентификации;
- Будут ли агенты на серверах?
Будут агенты kubernetis;
- Будут ли использованы средства для управления конфигурацией или инициализации ресурсов?
Будем инициализировать ресурсы с Terraform;
- Какие инструменты из уже используемых вы хотели бы использовать для нового проекта?
Terraform, Packer, Kubernetis, Docker.