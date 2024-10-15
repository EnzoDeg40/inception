#!/bin/bash

# debug
set -xe 

# check if wordpress is already configured
if [ -f ./wp-config.php ]
then
	echo "wordpress already configured"
else

# install wp-cli
# wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp

# edit the wp-config.php file
# sed -i "s/username_here/${MARIA_USER}/g" /var/www/html/wp-config.php
# sed -i "s/password_here/${MARIA_PASSWORD}/g" /var/www/html/wp-config.php
# sed -i "s/localhost/mariadb/g" /var/www/html/wp-config.php
# sed -i "s/database_name_here/${MARIA_DATABASE}/g" /var/www/html/wp-config.php

# Éditer le fichier wp-config.php avec les variables d'environnement
# wp config create --path=/var/www/html \
#     --dbname="${MARIA_DATABASE}" \
#     --dbuser="${MARIA_USER}" \
#     --dbpass="${MARIA_PASSWORD}" \
#     --dbhost="mariadb" --allow-root

# # Installation de WordPress
# wp core install --path=/var/www/html \
#     --url="http://localhost" \
#     --title="My WordPress" \
#     --admin_user="admin" \
#     --admin_password="admin_password" \
#     --admin_email="admin@example.com" --allow-root

wp core download --allow-root

fi

exec "$@"
