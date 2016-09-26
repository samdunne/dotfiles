#!/usr/bin/env bash
set -eo pipefail

brew install python --with-brewed-openssl
pip install virtualenv

export VIRTUAL_ENV_DISABLE_PROMPT=1

virtualenv ~/.virtualenvs/default

pip install Pygments
