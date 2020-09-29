#!/bin/csh

pkg install -y nano ffmpeg pkgconf python38 py38-sqlite3 ca_root_nss libxslt
pw groupadd -n homeassistant -g 8123
echo 'homeassistant:8123:8123::::::/bin/csh:' | adduser -f -

/usr/local/bin/python3.8 -m ensurepip

/usr/local/bin/pip3.8 install --upgrade pip virtualenv av==6.1.2

mkdir -p /usr/local/share/homeassistant
chown -R homeassistant:homeassistant /usr/local/share/homeassistant

su homeassistant -c '/bin/csh' << EOS

cd /usr/local/share/homeassistant
virtualenv -p python3.8 .
source ./bin/activate.csh
/usr/local/bin/pip3.8 install homeassistant

# Run ensure_config startup script to create initial configuration
hass --script ensure_config

# Run check_config startup script to install initial dependencies 
hass --script check_config

deactivate
EOS

mkdir -p /usr/local/etc/rc.d/
curl -o /usr/local/etc/rc.d/homeassistant https://raw.githubusercontent.com/cliviu74/scripts/master/home-assistant/homeassistant
chmod +x /usr/local/etc/rc.d/homeassistant
ln -s /usr/local/etc/rc.d/homeassistant /usr/local/etc/rc.d/hass
sysrc homeassistant_enable="YES"
