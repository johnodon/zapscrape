#!/bin/sh

#Set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config

#Copy zapscrape.conf template to /config/templates
if [ ! -d "/config/templates/" ]; then
	mkdir -p /config/templates
  	cp /zapscrape/templates/zapscrape.conf /config/templates/zapscrape.conf
else
	cp /zapscrape/templates/zapscrape.conf /config/templates/zapscrape.conf
fi

#Add cron job to update guide data
if [ ! -f "/config/mycron" ]; then
	cp /zapscrape/cron/mycron /config/mycron
fi
sleep 10
crontab -u nobody /config/mycron

#Update guide data (only if user created .conf file)
if [ -f "/config/zapscrape.conf" ]; then
	/zapscrape/scripts/zapscrape.pl -C /config/zapscrape.conf
fi

#Re-set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config
