#!/bin/bash

set -e

source dev-container-features-test-lib

# make sure sqlc is available
sqlc version

reportResults
