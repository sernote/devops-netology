Задание 1. \
Версия сервера бд: 8.0.26 MySQL Community Server - GPL
SELECT count(*) FROM orders WHERE price > 300; - одна запись

Задание 2. \
CREATE USER 'test'@'localhost' 
IDENTIFIED WITH mysql_native_password BY 'test-pass'
WITH
MAX_QUERIES_PER_HOUR 100
FAILED_LOGIN_ATTEMPTS 3
PASSWORD EXPIRE INTERVAL 30 DAY
ATTRIBUTE '{"fname": "James", "lname": "Pretty"}';

GRANT SELECT ON test_db.* TO 'test'@'localhost';

Задание 3. \
В бд использовался движок InnoDB;

Задание 4. \
innodb_buffer_pool_size = 30
innodb_log_file_size = 100M
innodb_flush_log_at_trx_commit = 2
innodb_file_per_table = 1
innodb_log_buffer_size = 1M