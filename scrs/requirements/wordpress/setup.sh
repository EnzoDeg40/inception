#!/bin/bash

# Debug
set -xe 

if [ -f /var/www/html/wp-config.php ];
then
	echo "wordpress already downloaded"
else

# mkdir -p /var/www/html

# wget https://wordpress.org/latest.tar.gz \
#     && tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1 \
#     && rm latest.tar.gz

# chown -R www-data:www-data /var/www/html


# copie le fichier de xconfiguration de PHP
# sed -i "s/username_here/${MARIA_USER}/g" /var/www/html/wp-config.php
# sed -i "s/password_here/${MARIA_PASSWORD}/g" /var/www/html/wp-config.php
# sed -i "s/localhost/mariadb/g" /var/www/html/wp-config.php
# sed -i "s/database_name_here/${MARIA_DATABASE}/g" /var/www/html/wp-config.php

# install wp-cli
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# RUN wp config create --dbname=wordpress --dbuser=root --dbpass=motdepasse --dbhost=localhost
# https://chatgpt.com/share/67092a63-02a4-800e-8687-d53f808fbba6
# RUN wp core install --url=localhost --title=enzo_wp --admin_user=admin --admin_password=admin --admin_email=admin@example.com --allow-root --path=/var/www/html

# Cree le fichier de configuration de wordpress
wp config create --dbname=${MARIA_DATABASE} --dbuser=${MARIA_USER} --dbpass=${MARIA_PASSWORD} --dbhost=mariadb --allow-root --path=/var/www/html --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
PHP

# Installe wordpress
wp core install --url=https://localhost/ --title=Example --admin_user=supervisor --admin_email=info@example.com --admin_password=strongpassword --allow-root --path=/var/www/html


fi

exec "$@" # a quoi il sert ?2