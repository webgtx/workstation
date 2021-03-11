#/bin/bash/
echo ""
echo "			Welcome to i3wm installation by webgtx"
  sleep 2
echo ""
echo "	Choose your option"
echo ""
echo "		1) Arch Linux"
echo "		2) Debian & Ubuntu"
  read installOption

if [[ $installOption = "1" ]]; then
    pacman -S i3-gaps i3-gaps i3blocks i3lock i3status
    pacman -S termite picom nitrogen
    toilet --metal Done
    echo ""
    echo "You wanna use my i3wm config or your own?"
    echo "Input (own/your)"
    read configOption
      if [[ $configOption = 'your' ]]; then
        cp .config -r /home/$USER/
        echo "Done, now you need log out from your DE, and run I3WM"
      fi
    echo ""
fi
