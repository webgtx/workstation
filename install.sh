#!/bin/sh/
echo "	Welcome to ArchDX installation by webgtx"
sleep 2
echo ""
echo "	1) Installation ArchDX, already on finished Arch Linux"
echo "	2) LiveUSB installation"
echo ""
read -p "Choose your option: " installOption

setup_reqr() {
  pacman -S \
  i3 \
  i3-gaps \
  i3blocks \
  i3lock \
  i3status \
  sakura \
  picom \ 
  nitrogen \
  cmus \ 
  neofetch \
  htop
}

if [[ $installOption = "1" ]]; then
  printf "\nYou wanna use my i3wm config or your own?"
  read -p "Input (own/your): " configOption
    if [[ $configOption = 'your' ]]; then
      cp .config -r /home/$USER/
      setup_reqr()
      echo "Done, now you need logout from your DE, and run I3WM"
    else
      echo "Okay, the native i3wm installation started"
      setup_reqr()
    fi
  read -p "Do you wanna install BlackArch repository? y/n" blackarchOption
    if [[ $blackarchOption = "y" ]]; then
      curl -O https://blackarch.org/strap.sh
      sha1sum strap.sh
      echo "# shouldmatch: d062038042c5f141755ea39dbd615e6ff9e23121"
      sleep 5
      sudo chmod+x strap.sh 
      sudo ./strap.sh
      sudo pacman -Syyu
      echo "Done, good luck Mr. Alderson."
    else
      echo "No problem."
    fi
    sh software.sh
fi
if [[ installOption = "2" ]]; then
  pacman -Sy
  pacman -S wget 
  wget matmoul.github.io/archfi
  bash archfi.sh
fi
