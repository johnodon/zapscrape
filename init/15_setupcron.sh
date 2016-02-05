#!/bin/bash
if [ ! -e "/config/mycron" ]; then
cp /cron/mycron /config/mycron
crontab -u nobody /config/mycron
fi

