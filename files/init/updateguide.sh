#!/bin/sh

#Update guide data (only if user created .conf file)
if [ -f "/config/zap2xml.conf" ]; then
	/zap2xml/scripts/zap2xml.pl -C /config/zap2xml.conf
fi
