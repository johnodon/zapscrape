# Builds a docker image for zap2xml
FROM phusion/baseimage:0.9.18
MAINTAINER johnodon


###############################################
##                                 ENVIRONMENTAL CONFIG                                           ##
###############################################
# Set correct environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME="/root" LC_ALL="C.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

###############################################
##                         INTALL ENVIORMENT AND SOFTWARE                           ##
###############################################
COPY install.sh /tmp/ 
COPY zap2xml.pl /zap2xml/
RUN chmod +x /tmp/install.sh && sleep 1 && /tmp/install.sh && rm /tmp/install.sh


###############################################
##                                        PORTS AND VOLUMES                                            ##
###############################################

VOLUME /config
