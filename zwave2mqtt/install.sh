#!/bin/bash

sudo mkdir -p /opt/zwave2mqtt/store
sudo wget -O /lib/systemd/system/zwave2mqtt.service https://raw.githubusercontent.com/cliviu74/scripts/master/zwave2mqtt/zwave2mqtt.service
sudo systemctl daemon-reload
sudo systemctl enable zwave2mqtt
sudo systemctl start zwave2mqtt