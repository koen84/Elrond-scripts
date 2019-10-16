#!/bin/bash

# CHECK root
if ! [ $(id -u) = 0 ]; then
   echo "Script must be run as root / sudo."
   exit 1
fi

# Read SSH port from config file, otherwise default 22
_sshd_input=$(cat /etc/ssh/sshd_config | awk '/^Port/ {print $2}')
re='^[0-9]+$'
if [[ $_sshd_input =~ $re ]]; then
  # is number
  if [ $_sshd_input -le 65535 ] && [ $_sshd_input -gt 0 ]; then
    _sshPort=$_sshd_input
  else
    _sshPort="22"
  fi
fi

#Firewall security measures
apt install ufw -y
ufw disable
ufw allow ${_sshPort}/tcp
ufw limit ${_sshPort}/tcp
ufw logging on
ufw default deny incoming
ufw default allow outgoing
ufw --force enable

echo "Success! Make sure to test a NEW ssh connection on port ${_sshPort} before disconnecting your old session or rebooting."
