#!/bin/bash
wget -O - https://raw.githubusercontent.com/sdesalas/node-pi-zero/master/install-node-v10.0.0.sh | bash
sudo apt-get install -y git make g++ gcc
sudo git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt
sudo chown -R pi:pi /opt/zigbee2mqtt
cd /opt/zigbee2mqtt
npm install
sudo wget -O /lib/systemd/system/zigbee2mqtt.service https://raw.githubusercontent.com/cliviu74/scripts/master/zigbee2mqtt/zigbee2mqtt.service
sudo systemctl daemon-reload
sudo systemctl enable zigbee2mqtt
sudo systemctl start zigbee2mqtt
sudo wget -O /usr/local/bin/zigbee2mqtt-update.sh https://raw.githubusercontent.com/cliviu74/scripts/master/zigbee2mqtt/zigbee2mqtt-update.sh
sudo chmod +x /usr/local/bin/zigbee2mqtt-update.sh 