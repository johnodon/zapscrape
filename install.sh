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


# Disable SSH
rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh


#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################

# Repositories
echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe restricted' > /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates main universe restricted' >> /etc/apt/sources.list


# Install Dependencies
apt-get update -qq
apt-get install -qy libio-socket-inet6-perl libio-socket-ssl-perl libnet-libidn-perl libnet-ssleay-perl libsocket6-perl ssl-cert libio-socket-ip-perl libjson-any-perl sasl2-bin libsasl2-modules

#########################################
## FILES, SERVICES AND CONFIGURATION   ##
#########################################

# Initiate config directory
mkdir -p /config

#########################################
##              CLEANUP                ##
#########################################

# Clean APT install files
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/*
