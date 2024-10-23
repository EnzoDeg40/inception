FROM debian:bullseye

RUN apt update -y
RUN apt install vsftpd -y

COPY ./tools/script.sh /tmp/script.sh

CMD ["/tmp/script.sh"]

