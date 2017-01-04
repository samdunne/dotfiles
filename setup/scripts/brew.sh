#!/usr/bin/env bash
set -eo pipefail

if ! hash brew 2>/dev/null; then
  mkdir "$HOME"/.homebrew
  curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$HOME"/.homebrew
fi

brew update

brew upgrade

brew install mas

brew bundle --file="$HOME"/.init/Brewfile

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Remove outdated versions from the cellar.
brew cleanup