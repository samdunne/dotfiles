#!/usr/bin/env bash

for script in scripts/{brew,go,hashicorp,macos,python,ruby,vagrant,sublime,external}.sh; do
  # shellcheck source=/dev/null
  source "$HOME"/.bash_profile
  /bin/bash "$script"
done;
unset script;
