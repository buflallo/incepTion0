#!/bin/bash

service mariadb start;

sleep 3

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"


mysql -uroot -e "CREATE USER IF NOT EXISTS '${DB_USR}'@'%' IDENTIFIED BY '${DB_PASS}';"

mysql -uroot -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USR}'@'%' IDENTIFIED BY '${DB_PASS}';"

mysql -uroot -e "UPDATE mysql.user SET Password = PASSWORD('${MYSQL_ROOT_PASS}') WHERE User = 'root';; FLUSH PRIVILEGES;"


mysqladmin -u root -p"${MYSQL_ROOT_PASS}" shutdown



mysqld --user=mysql --console
