#!/bin/bash

# debug
set -xe 

cd /var/www/html

# check if wordpress is already configured
if [ -f /var/www/html/wp-config.php ];
then
	echo "wordpress already configured"
else
    wp config create --path=/var/www/html \
        --dbname="${MARIA_DATABASE}" \
        --dbuser="${MARIA_USER}" \
        --dbpass="${MARIA_PASSWORD}" \
        --dbhost="mariadb" --allow-root
fi

# check if wordpress is already installed
if wp core is-installed --path=/var/www/html --allow-root;
then
    echo "wordpress already configured"
else
    wp core install --path=/var/www/html \
        --url="https://edegraev.42.fr/" \
        --title="My WordPress" \
        --admin_user="${WP_ADMIN_NAME}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" --allow-root
fi

# create user if not exist
if wp user list --path=/var/www/html --allow-root | grep "${WP_USER_NAME}";
then
    echo "user already exist"
else
    wp user create --path=/var/www/html \
        "${WP_USER_NAME}" \
        "${WP_USER_EMAIL}" \
        --user_pass="${WP_USER_PASSWORD}"
fi

exec "$@"
