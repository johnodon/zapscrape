#!/bin/sh

#Set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config

#Update guide data (only if user created .conf files)
if [ -f "/config/zapscrape.conf1"  -a  -f "/config/zapscrape.conf2" ]; then
	/zapscrape/scripts/zapscrape.pl -C /config/zapscrape.conf1
	/zapscrape/scripts/zapscrape.pl -C /config/zapscrape.conf2
	sleep 120
	python /zapscrape/scripts/xmlcombine.py /data/guide1.xml /data/guide2.xml > /data/guide.xml   #merges xmls
fi

#Re-set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config
