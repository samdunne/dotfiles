#!/usr/bin/env bash
set -eo pipefail

pip install virtualenv

# shellcheck source=/dev/null
source "$HOME"/.bash_profile

virtualenv ~/.virtualenvs/default

pip install Pygments
