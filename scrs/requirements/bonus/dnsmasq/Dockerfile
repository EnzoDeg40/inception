FROM debian:bullseye

RUN apt-get update && apt-get install -y dnsmasq dnsutils

# copy conf file
COPY ./requirements/bonus/dnsmasq/conf/dnsmasq.conf /etc/dnsmasq.conf

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["dnsmasq", "-k"]
