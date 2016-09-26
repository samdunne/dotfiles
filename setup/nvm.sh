#!/usr/bin/env bash
set -eo pipefail

brew install nvm

mkdir -p "$HOME"/.nvm

nvm install 5.0
nvm use 5.0
nvm alias default node
