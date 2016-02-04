#!/bin/bash
cp /confs/* /config/templates/
chown -R nobody:users /config
chmod -R 777 /config
