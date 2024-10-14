#!/bin/bash

# Debug
set -xe 

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

# copie le fichier de xconfiguration de PHP
sed -i "s/username_here/${MARIA_USER}/g" /var/www/html/wp-config.php
sed -i "s/password_here/${MARIA_PASSWORD}/g" /var/www/html/wp-config.php
sed -i "s/localhost/mariadb/g" /var/www/html/wp-config.php
sed -i "s/database_name_here/${MARIA_DATABASE}/g" /var/www/html/wp-config.php

fi

exec "$@" # a quoi il sert ?