#!/usr/bin/env bash
if [$(uname -s)="Linux"]; then
  sudo nixos-rebuild switch $1 --flake .#$HOSTNAME
elif [$(uname -s)="Darwin"]; then
  sudo darwin-rebuild switch $1 --flake .#HOSTNAME
fi
