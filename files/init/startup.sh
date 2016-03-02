#!/bin/sh

#Set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config

#Copy zapscrape.conf templates to /config/templates
if [ ! -d "/config/templates/" ]; then
	mkdir -p /config/templates
  	cp /zapscrape/templates/zapscrape.conf1 /config/templates/zapscrape.conf1
  	cp /zapscrape/templates/zapscrape.conf2 /config/templates/zapscrape.conf2
else
	cp /zapscrape/templates/zapscrape.conf1 /config/templates/zapscrape.conf1
	cp /zapscrape/templates/zapscrape.conf2 /config/templates/zapscrape.conf2
fi

#Add cron job to update guide data
if [ ! -f "/config/mycron" ]; then
	cp /zapscrape/cron/mycron /config/mycron
fi
sleep 10
crontab -u nobody /config/mycron

#Update guide data (only if user created .conf files)
if [ -f "/config/zapscrape.conf1"  -a  -f "/config/zapscrape.conf2" ]; then
	/zapscrape/scripts/zapscrape.pl -C /config/zapscrape.conf1
	/zapscrape/scripts/zapscrape.pl -C /config/zapscrape.conf2
	sleep 120
	python /zapscrape/scripts/xmlcombine.py /data/guide1.xml /data/guide2.xml > /data/guide.xml   #merges xmls
fi

#re-set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config
