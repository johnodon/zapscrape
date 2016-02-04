#!/bin/bash
if [ ! -f "/config/templates/zap2xml.conf.template" ]; then
mkdir -p /config/templates
cp /confs/zap2xml.conf.template /config/templates/zap2xml.conf.template
fi
chown -R nobody:users /config
chmod -R 777 /config
