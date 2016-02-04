#!/bin/bash
if [ ! -d "/config/templates/" ]; then
mkdir -p /config/templates
fi
cp /confs/zap2xml.conf1.template /config/templates/zap2xml.conf1.template
cp /confs/zap2xml.conf2.template /config/templates/zap2xml.conf2.template
chown -R nobody:users /config
chmod -R 777 /config
