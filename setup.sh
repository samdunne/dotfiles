#!/usr/bin/env bash

# Might as well ask for password up-front, right?
sudo -v

xcode-select --install
xcrun cc

# Install the appropriate bash files
chmod a+x sync.sh
/usr/bin/env bash sync.sh -f

pushd setup

chmod a+x brew.sh
/usr/bin/env bash brew.sh
brew bundle

for script in {go.sh,hashicorp.sh,nvm.sh,perl.sh,python.sh,ruby.sh,vagrant.sh}; do
  source "$HOME"/.bash_profile
  chmod a+x "$script"
  /usr/bin/env bash "$script"
done;
unset file;

popd

source "$HOME"/.bash_profile
