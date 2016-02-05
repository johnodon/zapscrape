#!/bin/bash
if [ ! -d "/config/templates/" ]; then
mkdir -p /config/templates
fi
cp /confs/zap2xml.conf.template /config/templates/zap2xml.conf.template
chown -R nobody:users /config
chmod -R 777 /config
