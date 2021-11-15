#!/bin/bash

## Check for root

if [[ $EUID -ne 0 ]]; then
   echo ""
   echo -e "\e[1;91m[-] Please run this script as a root [sudo bash install.sh]"
   echo -e "\e[0m"
   exit 1
fi

echo "[+] Installing dnsutils package"
sudo apt install dnsutils -y &>/dev/null
echo "[+] Installing gawk" 
sudo apt install gawk -y &>/dev/null
echo "[+] Done. Now run the script by simply typing : ./whysobroke <file>"
