#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
set -e

echo "Activating feature 'httpie'"

check_packages() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        apt install -y --no-install-recommends "$@"
    fi
}

apt update
check_packages dpkg
check_packages curl
check_packages gpg

architecture="$(dpkg --print-architecture | grep -oP 'amd64|arm64')"

curl -SsL https://packages.httpie.io/deb/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/httpie.gpg
echo "deb [arch=${architecture} signed-by=/usr/share/keyrings/httpie.gpg] https://packages.httpie.io/deb ./" | sudo tee /etc/apt/sources.list.d/httpie.list > /dev/null
apt update
apt install -y httpie

rm -rf /var/lib/apt/lists/*

echo "Done!"
