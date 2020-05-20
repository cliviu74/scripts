
#!/bin/env bash

Z2M_DEFAULT_VERSION='1.13.1'
Z2M_VERSION=${1:-$Z2M_DEFAULT_VERSION}

echo "Installing zigbee2mqtt-$Z2M_VERSION"
echo "Cloning repo..."
git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt-$Z2M_VERSION/
echo "Apply permissions..."
sudo chown -R pi:pi /opt/zigbee2mqtt-$Z2M_VERSION/
echo "npm install..."
cd /opt/zigbee2mqtt-$Z2M_VERSION/
sudo -u pi npm ci 
echo "Copy data directory from current install"
cp -ax /opt/zigbee2mqtt/data/* /opt/zigbee2mqtt-$Z2M_VERSION/data/
echo "Starting Zigbee2Mqtt version $Z2M_VERSION"
systemctl stop zigbee2mqtt
rm /opt/zigbee2mqtt
ln -s /opt/zigbee2mqtt-$Z2M_VERSION/ /opt/zigbee2mqtt
systemctl start zigbee2mqtt
