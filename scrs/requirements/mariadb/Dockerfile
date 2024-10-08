FROM debian:latest

# Variables d'environnement pour éviter les prompts interactifs
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

EXPOSE 3306

# RUN service mysql start && \
#     mysql -e "CREATE DATABASE wp;" && \
#     mysql -e "CREATE USER 'enzo'@'%' IDENTIFIED BY 'enzo';" && \
#     mysql -e "GRANT ALL PRIVILEGES ON wp.* TO 'enzo'@'%';" && \
#     mysql -e "FLUSH PRIVILEGES;"

# CMD ["mysqld", "--bind-address=0.0.0.0"]
CMD ["mysqld_safe"]