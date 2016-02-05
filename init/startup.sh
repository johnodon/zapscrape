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

#Update guide data (only if user created .conf files)
if [ -f "/config/zap2xml.conf1" ] %% if [ -f "/config/zap2xml.conf2" ]; then
/zap2xml/zap2xml.pl -C /config/zap2xml.conf1
/zap2xml/zap2xml.pl -C /config/zap2xml.conf2
sleep 120
python /zap2xml/xmlcombine.py /data/guide1.xml /data/guide2.xml > /data/guide.xml   #merges xmls
fi

#set proper unRAID permissions on /config
chown -R nobody:users /config
chmod -R 777 /config
