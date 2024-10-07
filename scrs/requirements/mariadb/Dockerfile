FROM debian:latest

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]