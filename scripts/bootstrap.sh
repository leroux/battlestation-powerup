#!/bin/bash -e

BATTLESTATION_POWERUP_DIR="/tmp/battlestation-powerup-master"

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if [ ! -d "$BATTLESTATION_POWERUP_DIR" ]; then
	echo -e  "\n\033[0;32m>>> Download battlestation-powerup\033[0m"
	if [ -d $BATTLESTATION_POWERUP_DIR ]; then
		rm -rf $BATTLESTATION_POWERUP_DIR
	fi
	curl -Lo "$BATTLESTATION_POWERUP_DIR.zip" https://github.com/leroux/battlestation-powerup/archive/master.zip
	unzip "$BATTLESTATION_POWERUP_DIR.zip" -d /tmp
fi

cd $BATTLESTATION_POWERUP_DIR

# Install XCode.
sudo ./scripts/xcode-cli-tools.sh

# Install ansible.
sudo easy_install pip
sudo pip install ansible

ansible-playbook -K -vvvv main.yml
