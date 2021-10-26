Задание 1. \
- вывода списка БД - \l
- подключения к БД - \connect
- вывода списка таблиц - \dp
- вывода описания содержимого таблиц - \d+
- выхода из psql - \q

Задание 2. \
команда SELECT avg_width FROM pg_stats WHERE tablename='orders';

Задание 3. 
````
BEGIN;
ALTER TABLE orders RENAME TO orders_old;
CREATE TABLE orders (id integer, title varchar(80), price integer) PARTITION BY RANGE (price);
CREATE TABLE orders_1 PARTITION OF orders FOR VALUES FROM (0) TO (499);
CREATE TABLE orders_2 PARTITION OF orders FOR VALUES FROM (499) TO (999);
INSERT INTO orders SELECT * FROM orders_old;
COMMIT;
````
Чтобы избежать такой ситуации с ручными операциями можно было использовать секционирование с самого начала.

Задание 4. 
````
pg_dump test_database > test_database_dump.sql
````
Чтобы добавить уникальность значения столбца title для таблиц test_database в бэкап файл добавляем UNIQUE на строке 29:
````
title character varying(80) UNIQUE
````
