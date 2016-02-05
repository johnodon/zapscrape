#!/bin/sh

#set proper unRAID permissions on /config
chown -R nobody:users /config
chmod -R 777 /config

#Copy zap2xml.conf templates to /config/templates
if [ ! -d "/config/templates/" ]; then
	mkdir -p /config/templates
  	cp /zap2xml/templates/zap2xml.conf1 /config/templates/zap2xml.conf1
  	cp /zap2xml/templates/zap2xml.conf2 /config/templates/zap2xml.conf2
else
	cp /zap2xml/templates/zap2xml.conf1 /config/templates/zap2xml.conf1
	cp /zap2xml/templates/zap2xml.conf2 /config/templates/zap2xml.conf2
fi

#Add cron job to update guide data
if [ ! -f "/config/mycron" ]; then
	cp /zap2xml/cron/mycron /config/mycron
fi
sleep 10
crontab -u nobody /config/mycron
