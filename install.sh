#!/bin/bash

## Check for root

if [[ $EUID -ne 0 ]]; then
   echo ""
   echo -e "\e[1;91m[-] Please run this script as a root [sudo $0]"
   echo -e "\e[0m"
   exit 1
fi

sudo apt install dnsutils -y &>/dev/null
sudo apt install gawk -y &>/dev/null
echo "Done."
