#!/bin/bash

set -e

source dev-container-features-test-lib

# make sure httpie, http and https are available
httpie --version
http --version
https --version

reportResults
