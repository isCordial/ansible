#!/usr/bin/env bash

ansible-playbook ./AnsibleSetup/ansbl.yml --tags=nvim
source ~/.bashrc
