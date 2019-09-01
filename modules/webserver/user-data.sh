#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo wget -O - https://repo.saltstack.com/py3/debian/9/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
sudo echo 'deb http://repo.saltstack.com/py3/debian/9/amd64/latest stretch main' > /etc/apt/sources.list.d/saltstack.list
sudo apt-get -y update
sudo apt-get -y install salt-minion
sudo sed -i -e 's/#master: salt/master: ${saltmaster_host}/' /etc/salt/minion
sudo systemctl restart salt-minion
