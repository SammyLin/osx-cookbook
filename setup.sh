#!/bin/bash
set -e

# Add /var/chef/ if it doesn't exist
if [ ! -d "/var/chef/" ]; then
  echo "Creating /var/chef/"
  sudo mkdir -p /var/chef && sudo chown -R `whoami`:staff /var/chef
else
  echo "Directory /var/chef already exists"
fi

if [ ! -d "/usr/local/" ]; then
  echo "Creating /usr/local/"
  sudo mkdir -p /usr/local && sudo chown -R `whoami`:staff /usr/local
else
  echo "Directory /usr/local already exists"
fi
