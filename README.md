# osx-cookbooks

A chef repository for automating the configuration of MAC OS X workstations for rails

## Usage

### 1.Install Command Line Tools

    $ xcode-select --install

### 2.Setting & Installing chef

    $ curl -fsSL https://raw.githubusercontent.com/commandp/osx-cookbooks/master/script/bootstrap.sh | sudo bash

### 3.Clone cookbook & Running deploy

    $ git clone https://github.com/commandp/osx-cookbooks.git ~/osx-cookbooks ; cd ~/osx-cookbooks/

### 4.Deploy

    $ ./script/deploy.sh

---

## cookbook

### If Berksfile Change

    $ berks vendor vendor/cookbooks

### Run customized your node

Now you are almost ready to run chef solo. Before running chef-solo you should copy the rolos/rails_dev.json to YOUR_NAME.json and edit it to your liking.

    $ chef-solo -c solo.rb -j rolos/YOUR_NAME.json

