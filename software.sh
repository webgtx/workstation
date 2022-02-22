#!/bin/bash

echo "Here you can install needed software packs."
echo ""
echo "1) Developer starter pack"
echo "2) Pentester starter pack (You can use this option only if you install Black Arch repository)"
echo "3) dxv1d software pack"
read softwareOption

case $softwareOption in
  1)
    sudo pacman -S neovim nodejs npm rustc python3 gcc git
    ;;

  2)
    sudo pacman -S arp-scan nmap burpsuite metasploit aircrack-ng sqlmap socialfish
    ;;

  3)
    sudo pacman -S discord telegram-desktop firefox keepassxc openvpn
    echo "1" | sh software.sh
    ;;

  *)
    echo "something"
    ;;
esac
