#!/usr/bin/env bash

ansible-playbook ./AnsibleSetup/ansbl.yml --tags=dotbot
source ~/.bashrc
