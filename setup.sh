#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `setup` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Prompt for everything now
read -r -p "What do you wish to name this computer?: " NAME;
read -r -p "Do you wish to setup this machine for work? [y/N]: " CONTINUE;

if ! xcode-select -p | grep -q "/Library/Developer/CommandLineTools"; then
  xcode-select --install
fi

# Install the appropriate bash files
chmod a+x sync
/bin/bash sync -f

pushd setup

for script in {brew,go,hashicorp,macos,python,ruby,vagrant,sublime,external}; do
  source "$HOME"/.bash_profile
  chmod a+x "$script"
  /bin/bash "$script"
done;
unset script;

popd

source "$HOME"/.bash_profile