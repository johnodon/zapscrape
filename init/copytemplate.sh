#!/bin/bash
cp /confs/* /config/
chown -R nobody:users /config
chmod -R 777 /config
