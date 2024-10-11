#!/bin/bash

# Debug
set -xe 

mkdir -p /var/www/html

wget https://wordpress.org/latest.tar.gz \
    && tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1 \
    && rm latest.tar.gz

chown -R www-data:www-data /var/www/html


#Inport env variables in the config file
# cp wp-config-sample.php wp-config.php
# sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
# sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
# sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config.php
# sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php