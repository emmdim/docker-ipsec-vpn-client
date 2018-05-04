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
	 nano strongswan rsyslog xl2tpd

COPY ./run.sh /opt/src/run.sh
RUN chmod 755 /opt/src/run.sh

COPY ./xl2tpd-1.3.8_pacthed_amd64.deb /opt/src/xl2tpd-1.3.8_pacthed_amd64.deb

VOLUME ["/lib/modules"]

CMD ["/opt/src/run.sh"]
