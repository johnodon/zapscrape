FROM phusion/baseimage:0.9.16

# Set correct environment variables
ENV DEBIAN_FRONTEND=noninteractive HOME="/root" TERM=xterm

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# source dir
RUN mkdir -p /zap2xml

# get zap2xml.pl 
ADD src/ /zap2xml/

# set volume
VOLUME /zap2xml

# Fix permissions of user nobody to suit unraid
RUN usermod -u 99 nobody && \
usermod -g 100 nobody  && \

# install dependencies
apt-get update -qq && \
apt-get install wget libio-socket-inet6-perl libio-socket-ssl-perl libnet-libidn-perl libnet-ssleay-perl libsocket6-perl ssl-cert libio-socket-ip-perl libjson-any-perl sasl2-bin libsasl2-modules -qy

#clean up
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
/usr/share/man /usr/share/groff /usr/share/info \
/usr/share/lintian /usr/share/linda /var/cache/man && \
(( find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true )) && \
(( find /usr/share/doc -empty|xargs rmdir || true ))
