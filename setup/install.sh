#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `setup` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Prompt for everything now
read -r -p "What do you wish to name this computer?: " NAME;
read -r -p "Do you wish to setup this machine for work? [y/N]: " WORK_COMPUTER;

export NAME=$NAME
export WORK_COMPUTER=$WORK_COMPUTER

if ! xcode-select -p | grep -q "/Library/Developer/CommandLineTools"; then
  xcode-select --install
fi

# Install the appropriate bash files
/bin/bash sync -f

pushd setup

for script in scripts/{brew,go,hashicorp,macos,python,ruby,vagrant,sublime,external}.sh; do
  # shellcheck source=/dev/null
  source "$HOME"/.bash_profile
  /bin/bash "$script"
done;
unset script;

popd

# shellcheck source=/dev/null
source "$HOME"/.bash_profile