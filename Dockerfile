FROM phusion/baseimage
MAINTAINER johnodon <johnodon68@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Volume mappings
VOLUME /config

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy perl libcompress-raw-zlib-perl libhtml-parser-perl \
libhttp-cookies-perl liblwpx-paranoidagent-perl libconfig-json-perl \
libjson-xs-perl build-essential cpanminus python

RUN mkdir /zap2xml
ADD /zap2xml.pl /zap2xml/zap2xml.pl
ADD /xmlcombine.py /zap2xml/xmlcombine.py
ADD /zap2xml.sh /zap2xml/zap2xml.sh
RUN chmod +x /zap2xml/zap2xml.sh
