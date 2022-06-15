#!/bin/sh
cp -r .config/* ~/.config
if [[ $(whoami) != "root" ]]; then
  sudo ./redhat_install.sh
  exit 0
fi

i3(  ) {
  dnf install \
      i3-gaps \
      i3lock \
      i3status \
      dmenu \
      picom \
      nitrogen \
      alacritty 
}

sway(  ) {
  dnf install \
    sway \
    grimshot \
    grim \
    waybar \
    wl-clipboard 
}

printf "\nSelect WM\n\n 1) SWAY\n 2) I3\n"
read -p "[ uspace ]: " option

case "$option" in
  "1")
    sway
    ;;
  "2")
    i3
    ;;
  *)
    echo "What ?"
    ./redhat_install.sh
esac

