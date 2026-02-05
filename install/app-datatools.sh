#!/bin/bash

# Install CLI data processing tools
# csvkit, jq, miller (mlr)
set -e

echo "Installing CLI data tools..."

# jq - JSON processor
sudo apt-get install -y jq

# csvkit - CSV utilities
sudo apt-get install -y csvkit

# Miller - like awk/sed/cut for CSV, JSON, etc.
# https://github.com/johnkerl/miller
cd /tmp

MLR_VERSION=$(curl -s "https://api.github.com/repos/johnkerl/miller/releases/latest" | grep -oP '"tag_name": "v\K[^"]+' || echo "6.12.0")
echo "Installing Miller version: ${MLR_VERSION}"

wget -q "https://github.com/johnkerl/miller/releases/download/v${MLR_VERSION}/miller-${MLR_VERSION}-linux-amd64.tar.gz"
tar -xzf "miller-${MLR_VERSION}-linux-amd64.tar.gz"
sudo mv "miller-${MLR_VERSION}-linux-amd64/mlr" /usr/local/bin/
rm -rf "miller-${MLR_VERSION}-linux-amd64" "miller-${MLR_VERSION}-linux-amd64.tar.gz"

cd ~
echo "CLI data tools installed successfully (jq, csvkit, mlr)"
