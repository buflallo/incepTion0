#!/bin/bash

service mariadb start;

sleep 3
echo -e "\nn\nY\n${MYSQL_ROOT_PASS}\n${MYSQL_ROOT_PASS}\nY\nY\nY\nY\n" | mysql_secure_installation
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"


mysql -uroot -e "CREATE USER IF NOT EXISTS '${DB_USR}'@'%' IDENTIFIED BY '${DB_PASS}';"

mysql -uroot -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USR}'@'%' IDENTIFIED BY '${DB_PASS}';"



mysqladmin -u root -p"${MYSQL_ROOT_PASS}" shutdown



mysqld --user=mysql --console
