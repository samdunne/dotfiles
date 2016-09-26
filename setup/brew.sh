#!/usr/bin/env bash
set -eo pipefail

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# These are pre-requisites for certain software
brew install Caskroom/cask/java
brew install Caskroom/cask/java7
brew install Caskroom/cask/xquartz