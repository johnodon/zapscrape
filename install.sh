#!/bin/bash

#########################################
##       ENVIRONMENTAL CONFIG          ##
#########################################

# Configure user nobody to match unRAID's settings
usermod -u 99 nobody
usermod -g 100 nobody
usermod -d /home nobody
mkdir /home/nobody
chown -R nobody:users /home/nobody


#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################

# Repositories
echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe restricted' > /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates main universe restricted' >> /etc/apt/sources.list


# Install Dependencies
apt-get update -qq
apt-get install -qy wget libio-socket-inet6-perl libio-socket-ssl-perl libnet-libidn-perl libnet-ssleay-perl libsocket6-perl ssl-cert libio-socket-ip-perl libjson-any-perl sasl2-bin libsasl2-modules

#########################################
## FILES, SERVICES AND CONFIGURATION   ##
#########################################

# Initiate config directory
mkdir -p /zap2xml
mkdir -p /config

#########################################
##             INTALLATION             ##
#########################################

# Install zap2xml
cd /zap2xml/
wget "http://phatic.tk/?h=9hz90q"
chown -R nobody:users /zap2xml


#########################################
##              CLEANUP                ##
#########################################

# Clean APT install files
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/*
