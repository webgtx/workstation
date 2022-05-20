#!/bin/sh

cat assets/uspace.ascii

while [[ true ]];
do
  cat assets/menu.ascii
  read -p "uspace: " option
  case "$option" in 
    "1")
      ./redhat_install.sh
      exit 0
      ;;
    "2")
      ./arch_install.sh
      exit 0
      ;;
    *)
      printf "\n\nSoon...\n\n"
      sleep 3
      ;;
  esac
done
