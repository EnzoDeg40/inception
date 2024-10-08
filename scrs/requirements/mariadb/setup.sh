#!/bin/bash

# Debug
set -xe 

service mariadb start

# # Make sure that NOBODY can access the server without a password
# mysql -e "UPDATE mysql.user SET Password = PASSWORD('CHANGEME') WHERE User = 'root'"
# # Kill the anonymous users
# mysql -e "DROP USER ''@'localhost'"
# # Because our hostname varies we'll use some Bash magic here.
# mysql -e "DROP USER ''@'$(hostname)'"
# # Kill off the demo database
# mysql -e "DROP DATABASE test"
# # Make our changes take effect
# mysql -e "FLUSH PRIVILEGES"
# # Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param

mariadb -e "CREATE DATABASE wp;"
mysql -e "CREATE USER 'enzo'@'%' IDENTIFIED BY 'enzo';"
mysql -e "GRANT ALL PRIVILEGES ON wp.* TO 'enzo'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# set root password
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'enzo'"

service mariadb stop
# mysqladmin -u root -penzo shutdown

exec mysqld_safe 
# CMD ["mysqld", "--bind-address=0.0.0.0"]
# CMD ["mysqld_safe", "--bind-address=0.0.0.0"]