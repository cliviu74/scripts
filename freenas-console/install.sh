#!/bin/sh

echo "Installing script to /usrl/local/bin/"
cp freenas-console.sh /usr/local/bin
ln -s /usr/local/bin/freenas-console.sh /usr/local/bin/freenas-console
chmod +x /usr/local/bin/freenas-console.sh