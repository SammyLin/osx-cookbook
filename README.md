# Mac 自動安裝

這可以幫助你建置一個 Ruby 跟 Chef 的環境

* RVM
* Chef
* Homebrew
* postgresql
* fontconfig
* git
* imagemagick
* build-essential

## 步驟

### 1.安裝 Installing Command Line Tools

    $ xcode-select --install

### 2.設定 & 安裝 chef

    $ curl -fsSL https://raw.githubusercontent.com/SammyLin/osx-cookbook/master/bootstrap.sh | sudo bash

### 3.下載 cookbook & 執行 Chef

    $ git clone https://github.com/SammyLin/osx-cookbook.git ~/osx-cookbook
    $ cd ~/osx-cookbook/
    $ ./deploy.sh

## cookbook 更動備註

### 如果 berksfile 有更改的話

    $ berks vendor vendor/cookbooks

### 執行 chef-solo

    $ chef-solo -c solo.rb -j rolos/macmini.json

