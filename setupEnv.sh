#!/usr/bin/env bash

ansible-playbook ./AnsibleSetup/ansbl.yml --tags=node
wait $!
source ~/.bashrc
ansible-playbook ./AnsibleSetup/ansbl.yml --tags=dotfiles,dotbot,zsh,npm-installs,tmux,misc,nvim
