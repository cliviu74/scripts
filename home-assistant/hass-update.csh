#!/bin/csh

service hass stop

# Run update sequence with su as an inline script

su homeassistant -c /bin/csh << EOS
cd /usr/local/share/homeassistant
source /usr/local/share/homeassistant/bin/activate.csh

pip3.9 install homeassistant --upgrade
EOS

service hass start
