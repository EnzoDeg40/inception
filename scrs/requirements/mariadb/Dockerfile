FROM debian:bullseye

# Variables d'environnement pour éviter les prompts interactifs
# ENV DEBIAN_FRONTEND=noninteractive

# Installation de MariaDB et PS
RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

EXPOSE 3306

# Récupère les variables d'environnement de Docker Compose
# ENV MARIA_ROOT_PASSWORD=${MARIA_ROOT_PASSWORD}
# ENV MARIA_DATABASE=${MARIA_DATABASE}
# ENV MARIA_USER=${MARIA_USER}
# ENV MARIA_PASSWORD=${MARIA_PASSWORD}

# copie 50-server.cnf # TODO: call a script instead
COPY ./requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Lance le script de configuration de la base de données
COPY ./requirements/mariadb/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh
CMD ["/bin/bash", "/tmp/setup.sh"]
