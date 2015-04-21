#!/bin/bash
set -e

# Function that tests if a command exists
command_exists() {
  command -v "$1" &> /dev/null ;
}


# Install chef-solo command if it doesn't exist (using omnibus installer)
if command_exists chef-solo; then
  echo "Chef already installed"
else
  echo "Installing chef to: /opt/chef/"
  curl -L https://www.opscode.com/chef/install.sh | bash
  echo ""
fi


# Add /var/chef/ if it doesn't exist
if [ ! -d "/var/chef/" ]; then
  echo "Creating /var/chef/"
  sudo mkdir -p /var/chef && sudo chown -R `whoami`:staff /var/chef
else
  echo "Directory /var/chef/ already exists"
fi
