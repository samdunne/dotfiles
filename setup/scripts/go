#!/usr/bin/env bash
set -eo pipefail

mkdir -p "$GOPATH"
mkdir -p "$GOPATH"/src/github.com/samdunne

# shellcheck source=/dev/null
source "$HOME"/.bash_profile

go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet
