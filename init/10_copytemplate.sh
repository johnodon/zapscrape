#!/bin/bash
if [ ! -f "/config/templates/zap2xml.conf1" ]; then
mkdir -p /config/templates
cp /confs/zap2xml.conf1 /config/templates/zap2xml.conf1
cp /confs/zap2xml.conf2 /config/templates/zap2xml.conf2
fi
chown -R nobody:users /config
chmod -R 777 /config
