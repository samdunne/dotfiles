#!/usr/bin/env bash
set -eox pipefail

function download_with_version() {
  echo "Downloading $1"
  path="$HOME"/.bin/hashicorp/"$1"/"$2"
  mkdir -p "$path"
  wget https://releases.hashicorp.com/"$1"/"$2"/"$1"_"$2"_darwin_amd64.zip -O temp.zip
  unzip temp.zip -d "$path"
  rm -rf temp.zip
  pushd "$HOME"/.bin
  ln -fs hashicorp/"$1"/"$2"/"$1" .
}

download_with_version "packer" "0.10.1"
download_with_version "terraform" "0.7.3"