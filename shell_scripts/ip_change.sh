#!/bin/bash

# Usage
## chmod +x ip_change.sh
## sudo ./ip_change.sh new_ip

path="/etc/network/interfaces"
current="$(hostname -I | cut -d' ' -f1 | xargs)"
new_ip=$1

if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  exit
fi

echo "Current ip is $current"
echo "New ip is $new_ip"

echo ""
echo "Ip change script has been started."

echo "$path file editing..."
sudo sed -i -e "s/^[[:blank:]]address.*/ address ${new_ip}/g" /etc/network/interfaces
echo "$path successfully edited."

echo "Flushing current ip.."
ip addr flush dev ens18
echo "Current ip flashed."

echo "Networking service restarting..."
systemctl restart networking
echo "Networking service successfully restarted."

echo ""
echo "Current ip ($current) successfully changed to new one($new_ip)."
