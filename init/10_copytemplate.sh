#!/bin/bash
if [ ! -f "/config/templates/zap2xml.conf1.template" ]; then
mkdir -p /config/templates
cp /confs/zap2xml.conf1.template /config/templates/zap2xml.conf1.template
cp /confs/zap2xml.conf2.template /config/templates/zap2xml.conf2.template
fi
chown -R nobody:users /config
chmod -R 777 /config
