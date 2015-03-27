#!/bin/bash

chmod +x files/xcode-cli-tools.sh
sudo ./xcode-cli-tools.sh

sudo easy_install pip
sudo pip install ansible==1.8.1
xcode-select --install
ansible-playbook -K -vvvv main.yml
