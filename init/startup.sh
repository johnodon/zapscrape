#Copy zap2xml templates to /config/templates
if [ ! -d "/config/templates/" ]; then
mkdir -p /config/templates
fi
cp /confs/zap2xml.conf1.template /config/templates/zap2xml.conf1.template
cp /confs/zap2xml.conf2.template /config/templates/zap2xml.conf2.template

#Add cron job to update guide data
if [ ! -f "/config/mycron" ]; then
cp /cron/mycron /config/mycron
fi
sleep 5
crontab -u nobody /config/mycron


chown -R nobody:users /config
chmod -R 777 /config
