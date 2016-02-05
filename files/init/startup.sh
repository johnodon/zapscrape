#!/bin/sh
#Copy zap2xml.conf templates to /config/templates
if [ ! -d "/config/templates/" ]; then
  mkdir -p /config/templates
  cp /zap2xml/templates/zap2xml.conf1 /config/templates/zap2xml.conf1
  cp /zap2xml/templates/zap2xml.conf2 /config/templates/zap2xml.conf2
else
	cp /zap2xml/templates/zap2xml.conf1 /config/templates/zap2xml.conf1
	cp /zap2xml/templates/zap2xml.conf2 /config/templates/zap2xml.conf2
fi

#set proper unRAID permissions on /config
chown -R nobody:users /config
