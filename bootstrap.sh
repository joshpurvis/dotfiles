#!/bin/bash

sudo apt-get update
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev python-pip
sudo pip install ansible --upgrade
ansible-playbook -i "localhost," -c local ansible/main.yml
