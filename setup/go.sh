#!/usr/bin/env bash
set -eo pipefail

mkdir -p "$GOPATH"
mkdir -p "$GOPATH"/src/github.com/samdunne

brew install go
go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet
