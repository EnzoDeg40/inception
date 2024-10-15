#!/bin/bash

# debug
set -xe 

# check if wordpress is already configured
if [ -f /var/www/html/wp-config.php ];
then
	echo "wordpress already configured"
else

cd /var/www/html

wp config create --path=/var/www/html \
    --dbname="${MARIA_DATABASE}" \
    --dbuser="${MARIA_USER}" \
    --dbpass="${MARIA_PASSWORD}" \
    --dbhost="mariadb" --allow-root

wp core install --path=/var/www/html \
    --url="https://edegraev.42.fr/" \
    --title="My WordPress" \
    --admin_user="admin" \
    --admin_password="admin_password" \
    --admin_email="admin@example.com" --allow-root

wp core download --allow-root

fi

exec "$@"
