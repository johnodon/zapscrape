#!/bin/bash
if [ ! -f "/config/mycron/" ]; then
cp /cron/mycron /config/mycron
chown -R nobody:users /config
chmod -R 777 /config
fi
