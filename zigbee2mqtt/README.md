# Install and run Zigbee2Mqtt on a raspberry pi zero (ARMv6)

This repository provides instructions for installing [Zigbee2Mqtt](https://www.zigbee2mqtt.io/) on raspberry pi zero.

Installing Zigbee2Mqtt on raspberry pi zero (ARMv6) was challenging. Node is only avalaible for ARMv6 only up to version 8, where updated versions of zigbee2mqtt require node version 10.

To install node, I've used [sdesalas's](https://github.com/sdesalas) node install scripts for ARMv6 - https://github.com/sdesalas/node-pi-zero

## Install

```
wget -O - https://raw.githubusercontent.com/cliviu74/scripts/master/zigbee2mqtt/install.sh | bash
```

## Update

```
wget -O - https://raw.githubusercontent.com/cliviu74/scripts/master/zigbee2mqtt/zigbee2mqtt-update.sh | bash
```

## Credits

Zigbee2Mqtt project - https://www.zigbee2mqtt.io/
Steven de Salas scripts for installing NodeJS on ARMv6 - https://github.com/sdesalas/node-pi-zero
