#!/bin/bash

#
# Installs General Purpose GPU Drivers and oneVPL development kit for Linux
# 
# See https://dgpu-docs.intel.com/installation-guides/index.html and
# https://software.intel.com/content/www/us/en/develop/articles/oneapi-repo-instructions.html
#

cd /tmp
wget -q https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
rm GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
add-apt-repository "deb https://apt.repos.intel.com/oneapi all main"
wget -q https://repositories.intel.com/graphics/intel-graphics.key
APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add intel-graphics.key
rm intel-graphics.key
add-apt-repository "deb [arch=amd64] https://repositories.intel.com/graphics/ubuntu focal main"
apt-get update
apt-get install -y intel-opencl-icd intel-level-zero-gpu level-zero
apt-get install -y libdrm-dev libva-dev intel-media-va-driver-non-free libmfx1 intel-oneapi-onevpl-devel libmfxgen1
# These are optional for development
apt-get install -y libigc-dev intel-igc-cm libigdfcl-dev libigfxcmrt-dev level-zero-dev
apt install -y pkg-config