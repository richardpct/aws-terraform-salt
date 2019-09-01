#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo wget -O - https://repo.saltstack.com/py3/debian/9/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
sudo echo 'deb http://repo.saltstack.com/py3/debian/9/amd64/latest stretch main' > /etc/apt/sources.list.d/saltstack.list
sudo apt-get -y update
sudo apt-get -y install salt-master
sudo sed -i -e 's/#auto_accept: False/auto_accept: True/' /etc/salt/master
sudo systemctl restart salt-master
