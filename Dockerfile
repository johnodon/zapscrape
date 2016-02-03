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
libjson-xs-perl build-essential cpanminus

RUN mkdir /zap2xml
ADD http://fossick.tk/?h=12b49re /zap2xml/zap2xml.pl

# Database directory for config
VOLUME /data
