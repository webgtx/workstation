#!/bin/sh
cp -r .config/* ~/.config
if [[ $(whoami) != "root" ]]; then
  sudo ./redhat_install.sh
  exit 0
fi
dnf install \
    i3-gaps \
    i3lock \
    i3status \
    dmenu \
    picom \
    nitrogen \
    alacritty 
