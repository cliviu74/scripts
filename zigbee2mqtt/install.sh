#!/bin/bash
wget -O - https://raw.githubusercontent.com/sdesalas/node-pi-zero/master/install-node-v10.0.0.sh | bash
sudo apt-get install -y git make g++ gcc
sudo git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt
sudo chown -R pi:pi /opt/zigbee2mqtt
cd /opt/zigbee2mqtt
npm install
wget -o /lib/systemd/system/zigbee2mqtt.service 