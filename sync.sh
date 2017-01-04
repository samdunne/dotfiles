#!/usr/bin/env bash

# Silent pushd
pushd () {
  command pushd "$@" > /dev/null
}

# Silent popd
popd () {
  command popd > /dev/null
}

sync_folders() {
  pushd configuration

  echo "$(tput setaf 64)$(tput bold)SYNCING DIRECTORIES $(tput sgr0)"

  for directory in $(find . -type d -maxdepth 1 -mindepth 1 | cut -c 3-); do
    printf "%-15s %-15s %-15s %-15s\n" "[copying]" "$directory" "--->" "$HOME/.$directory"
    command cp -R "$directory/." "$HOME/.$directory"
  done

  popd
}

sync_files() {
  pushd files

  echo "$(tput setaf 64)$(tput bold)SYNCING DOTFILES $(tput sgr0)"

  for file in *; do
    printf "%-15s %-15s %-15s %-15s\n" "[copying]" "$file" "--->" "$HOME/.$file"
    command cp "$file" "$HOME/.$file"
  done

  popd
}

run() {
  sync_folders
  sync_files
  # shellcheck source=/dev/null
  source "$HOME"/.bash_profile
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
  run
else
  read -rp "$(tput setaf 124)This may overwrite existing files in your home directory. Are you sure? (y/n) $(tput sgr0)" -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    run
  fi
fi
