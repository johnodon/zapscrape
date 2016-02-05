#!/bin/bash
if [ ! -e "/config/mycron/" ]; then
cp /cron/mycron /config/mycron
chown -R nobody:users /config
chmod -R 777 /config
crontab -u nobody /config/mycron
fi

