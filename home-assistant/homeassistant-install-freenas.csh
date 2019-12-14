#!/bin/csh

pkg install -y nano ffmpeg pkgconf python37 py37-sqlite3 ca_root_nss

pw groupadd -n homeassistant -g 8123
echo 'homeassistant:8123:8123::::::/bin/csh:' | adduser -f -

python3.7 -m ensurepip
pip3 install --upgrade pip virtualenv av==6.1.2

mkdir -p /usr/local/share/homeassistant
chown -R homeassistant:homeassistant /usr/local/share/homeassistant

su homeassistant -c '/bin/csh' << EOS

cd /usr/local/share/homeassistant
virtualenv -p python3.7 .
source ./bin/activate.csh
pip3 install homeassistant

timeout 180 hass --open-ui
deactivate
EOS

mkdir -p /usr/local/etc/rc.d/
curl -o /usr/local/etc/rc.d/homeassistant https://raw.githubusercontent.com/cliviu74/scripts/master/home-assistant/homeassistant
chmod +x /usr/local/etc/rc.d/homeassistant
ln -s /usr/local/etc/rc.d/homeassistant /usr/local/etc/rc.d/hass
sysrc homeassistant_enable="YES"
