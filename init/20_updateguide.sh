#!/bin/bash
if [ -f "/config/zap2xml.conf1" ]; then
/zap2xml/zap2xml.pl -C /config/zap2xml.conf1
/zap2xml/zap2xml.pl -C /config/zap2xml.conf2
sleep 120

fi
