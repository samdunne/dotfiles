#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")" || exit;

git pull origin master;

function run() {
	rsync --exclude-from .sync-ignore -avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	run;
else
	echo "This may overwrite existing files in your home directory. Are you sure? (y/n)";
  select yn in "y" "n"; do
    case $yn in
      y ) run; break;;
      n ) exit;;
    esac
  done
fi;
unset run;
