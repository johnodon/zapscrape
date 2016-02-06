#!/bin/sh

#Set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config

#Update guide data (only if user created .conf files)
if [ -f "/config/zap2xml.conf1"  -a  -f "/config/zap2xml.conf2" ]; then
	/zap2xml/scripts/zap2xml.pl -C /config/zap2xml.conf1
	/zap2xml/scripts/zap2xml.pl -C /config/zap2xml.conf2
	sleep 120
	python /zap2xml/scripts/xmlcombine.py /data/guide1.xml /data/guide2.xml > /data/guide.xml   #merges xmls
fi

#Re-set proper unRAID permissions on /config
chown -R nobody:users /config
chown -R nobody:users /data
chmod -R 777 /config /data
chmod -R 777 /config /config
