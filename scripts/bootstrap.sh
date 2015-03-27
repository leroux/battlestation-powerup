#!/bin/bash

BATTLESTATION_POWERUP_DIR="/tmp/battlestation-powerup"

if [ ! -d "$BATTLESTATION_POWERUP_DIR" ]; then
	echo -e  "\n\033[0;32m >> Download battlestation-powerup\033[0m"
	if [ -d $BATTLESTATION_POWERUP_DIR ]; then
		rm -rf $BATTLESTATION_POWERUP_DIR
	fi
	wget https://github.com/leroux/battlestation-powerup/archive/master.zip \
		-O /tmp/battlestation-powerup.zip
	unzip /tmp/battlestation-powerup.zip -d /tmp
fi

cd $BATTLESTATION_POWERUP_DIR

# Install XCode.
./scripts/xcode-cli-tools.sh

# Install ansible.
sudo easy_install pip
sudo pip install ansible

ansible-playbook -K -vvvv main.yml
