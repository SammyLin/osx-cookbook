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

### 1.把 username 加入到 /etc/sudoer

    $ whoami # 如果不知道 username 的話
    $ sudo visudo

加入下面這行

    <username> ALL=(ALL) NOPASSWD: ALL

### 2.安裝 Installing Command Line Tools

    $ xcode-select --install

### 3.設定 & 安裝 chef

    $ curl -fsSL https://raw.githubusercontent.com/SammyLin/osx-cookbook/master/bootstrap.sh | sudo bash

### 4.下載 cookbook & 執行 Chef

    $ git clone https://github.com/SammyLin/osx-cookbook.git ~/osx-cookbook
    $ cd ~/osx-cookbook/
    $ ./deploy.sh

## cookbook 更動備註

### 如果 berksfile 有更改的話

    $ berks vendor vendor/cookbooks

### 執行 chef-solo

    $ chef-solo -c solo.rb -j rolos/macmini.json

