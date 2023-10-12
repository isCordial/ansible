#!/usr/bin/env bash

ansible-playbook ./AnsibleSetup/ansbl.yml --tags=zsh
wait $!
zsh
