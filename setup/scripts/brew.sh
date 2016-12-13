#!/usr/bin/env bash
set -eo pipefail

if ! hash brew 2>/dev/null; then
  mkdir "$HOME"/.homebrew
  curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$HOME"/.homebrew
fi

# These are pre-requisites for certain software
brew bundle --file="$HOME"/.init/Brewfile