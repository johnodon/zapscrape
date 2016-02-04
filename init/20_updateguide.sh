#!/bin/bash
if [ -f "/config/zap2xml.conf" ]; then
/zap2xml/zap2xml.pl -C /config/zap2xml.conf
fi
