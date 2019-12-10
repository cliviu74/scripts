#!/bin/bash
wget -O - https://raw.githubusercontent.com/sdesalas/node-pi-zero/master/install-node-v10.0.0.sh | bash
sudo apt-get install -y git make g++ gcc
sudo git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt
sudo chown -R pi:pi /opt/zigbee2mqtt
cd /opt/zigbee2mqtt
npm install
wget -O /lib/systemd/system/zigbee2mqtt.service https://raw.githubusercontent.com/cliviu74/scripts/master/zigbee2mqtt/zigbee2mqtt.service
systemctl daemon-reload
systemctl enable zigbee2mqtt
systemctl start zigbee2mqtt
wget -O /usr/bin/zigbee2mqtt-update.sh https://raw.githubusercontent.com/cliviu74/scripts/master/zigbee2mqtt/zigbee2mqtt-update.sh
