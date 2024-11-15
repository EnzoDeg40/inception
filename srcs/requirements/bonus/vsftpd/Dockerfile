FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

COPY ./tools/script.sh /tmp/script.sh

CMD ["/tmp/script.sh"]

