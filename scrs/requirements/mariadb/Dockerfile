FROM debian:bullseye

# Variables d'environnement pour éviter les prompts interactifs
# ENV DEBIAN_FRONTEND=noninteractive

# Installation de MariaDB et PS
RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client procps

EXPOSE 3306

# Lance le script de configuration de la base de données
COPY ./requirements/mariadb/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh
CMD ["/bin/bash", "/tmp/setup.sh"]
