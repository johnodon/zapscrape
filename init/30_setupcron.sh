if [ -e /config/mycron ]; then
  crontab -u nobody /config/mycron
fi
