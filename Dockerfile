FROM debian:stretch
LABEL maintainer="M <edimoger@upc.edu>"

ENV REFRESHED_AT 2018-04-19

WORKDIR /opt/src

RUN apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive \
       apt-get -yqq --no-install-recommends install \
         wget dnsutils openssl ca-certificates kmod \
         iproute gawk grep sed net-tools iptables \
         bsdmainutils libcurl3-nss \
	 nano strongswan xl2tpd rsyslog

COPY ./run.sh /opt/src/run.sh
RUN chmod 755 /opt/src/run.sh

VOLUME ["/lib/modules"]

CMD ["/opt/src/run.sh"]
