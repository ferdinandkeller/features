#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
set -e

echo "Activating feature 'sqlc'"

go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest

echo "Done!"
