#!/usr/bin/env bash

set -euo pipefail

osascript -e 'tell application "Sublime Text" to quit'

settings_directory="$HOME/Library/Application Support/Sublime Text 3/Installed Packages"
package_control="Package Control.sublime-package"
installed_file="Package Control.sublime-settings"

if [ ! -f "$settings_directory/$package_control" ]; then
  wget -O "$settings_directory/$package_control" "https://packagecontrol.io/Package%20Control.sublime-package"
fi

cp -f "$HOME/.init/$installed_file" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/$installed_file"

open -a "Sublime Text"