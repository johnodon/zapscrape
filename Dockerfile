FROM phusion/baseimage
MAINTAINER johnodon <johnodon68@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy perl libcompress-raw-zlib-perl libhtml-parser-perl \
libhttp-cookies-perl liblwpx-paranoidagent-perl libconfig-json-perl \
libjson-xs-perl build-essential cpanminus python

RUN mkdir /zap2xml
RUN mkdir /config
ADD /confs /config/
ADD /zap2xml /zap2xml/
RUN chmod +x /zap2xml/*

# Volume mappings
VOLUME /config /data
#ENTRYPOINT [ "/zap2xml/zap2xml.sh" ]
