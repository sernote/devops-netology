Задание 1. \
Сначала определим что за операция зависла(например с фильтром 1 мин): db.currentOp("secs_running" : { "$gt" : 60 })
Остановим эту операцию: db.killOp()

Как вариант решения проблемы - добавить индекс;

Задание 2. \
Скорее всего, отношение количества записанных key-value значений к количеству истёкших превысило 25% и Redis заблокировал запись;

Задание 3. \
Как определить проблему:
- Попытаться запрофилировать этот запрос;

Возможные проблемы:
- Большая нагрузка;
- Проблемы с сетевым соединением;

Возможные решения:
- Оптимизировать структуру БД или запрос;
- Добавить индексы;
- Увеличить таймауты;
- Расширить ресурсы сервера;
- Если пытаемся передать слишком много (миллионы) строк в рамках одного запроса,следует увеличить net_read_timeout;

Задание 4. \
Скорее всего у системы заканчивается оперативная память и OOM killer убивает процесс postgres.
Нужно добавить ресурсов на сервер.