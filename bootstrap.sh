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

# Download osx-cookbook
if [ ! -d "~/osx-cookbook/" ]; then
  echo "Download osx-cookbook"
  git clone https://github.com/SammyLin/osx-cookbook.git ~/osx-cookbook
  cd ~/osx-cookbook
else
  cd ~/osx-cookbook
  echo "Directory ~/osx-cookbook already exists"
fi