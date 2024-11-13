#!/bin/bash

# debug
set -xe 

service mariadb start

mariadb -e "CREATE DATABASE ${MARIA_DATABASE};"
mariadb -e "CREATE USER '${MARIA_USER}'@'%' IDENTIFIED BY '${MARIA_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${MARIA_DATABASE}.* TO '${MARIA_USER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld_safe
