#!/bin/bash

sudo easy_install pip
sudo pip install ansible==1.8.1
xcode-select --install
ansible-playbook -K -vvvv main.yml
