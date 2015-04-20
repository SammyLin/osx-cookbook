#!/bin/bash
set -e

echo "Install Chef"

curl -L https://opscode.com/chef/install.sh | sudo bash


echo "Modify the permissions on relevant directories"

sudo mkdir -p /var/chef && sudo chown -R `whoami`:staff /var/chef
sudo mkdir -p /usr/local && sudo chown -R `whoami`:staff /usr/local

echo "Strat chef-solo"
chef-solo -c solo.rb -j roles/macmini.json
