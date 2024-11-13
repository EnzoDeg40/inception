FROM debian:bullseye

# install mariadb
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

EXPOSE 3306

# copy conf
COPY ./requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# run the setup script
COPY ./requirements/mariadb/tools/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh
CMD ["/bin/bash", "/tmp/setup.sh"]
