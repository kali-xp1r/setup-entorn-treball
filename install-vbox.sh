#!/bin/sh
if [ "$(id -u)" -ne 0 ]; then
    echo "Has d'executar aquest script com a root"
    exit 1 
fi

apt update
apt upgrade -y
apt install bzip2 -y

#virtual box
cd /media/user/VBox_GAs_7.1.6/
./VBoxLinuxAdditions.run
apt install virtualbox-guest-x11 -y
VBoxClient --clipboard
