#!/usr/bin/env bash
set -eo pipefail

brew cask install vagrant

vagrant plugin install vagrant-berkshelf vagrant-auto_network vagrant-hostmanager vagrant-cachier vagrant-vmware-fusion
