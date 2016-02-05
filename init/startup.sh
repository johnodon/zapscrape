#Copy zap2xml templates to /config/templates
if [ ! -d "/config/templates/" ]; then
mkdir -p /config/templates
fi
cp /confs/zap2xml.conf1.template /config/templates/zap2xml.conf1.template
cp /confs/zap2xml.conf2.template /config/templates/zap2xml.conf2.template
sleep 10

#set proper unRAID permissions on /config
chown -R nobody:users /config
chmod -R 777 /config
