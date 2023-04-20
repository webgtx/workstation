#!/bin/bash

cat assets/uspace.ascii

while [[ true ]];
do
  cat ./assets/menu.ascii
  read -p "[ uspace ]: " option
  case "$option" in 
    "1")
      ansible-playbook ./playbooks/traditional/sway.yml --ask-become 
      exit 0
      ;;
    "2")
      ansible-playbook ./playbooks/traditional/i3.yml --ask-become 
      exit 0
      ;;
    *)
      printf "\n\nSoon...\n\n"
      sleep 3
      ;;
  esac
done
