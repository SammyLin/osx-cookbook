#
# Cookbook Name:: commandp
# Recipe:: default
#

include_recipe "build-essential"
include_recipe "homebrew"

%w(git postgresql fontconfig imagemagick).each do |package_name|
  homebrew_package package_name
end


## 打開螢幕共享
execute "enable screensharing" do
  command "sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist"
  # stop
  # sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.screensharing.plist
end

## 打開遠端登入
execute "enable ssh" do
  command "sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist"
  # stop
  # sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist
end

## 自動登入 commandp
execute "enable auto Login commandp" do
  command "sudo defaults write /Library/Preferences/com.apple.loginwindow autoLoginUser 'commandp'"
  not_if "defaults read /Library/Preferences/com.apple.loginwindow autoLoginUser | grep 'commandp'"
end

## 系統偏好設定 / 安全性與隱私, 取消喚醒輸入密碼
execute "Disable Ask Password" do
  command "defaults write com.apple.screensaver askForPassword -int 0"
  not_if "defaults read com.apple.screensaver askForPassword | grep '0'"
end

## 取消進入睡眠模式
execute "disable sleep" do
  command "sudo pmset -a sleep 0"
end


## Homebrew http://brew.sh/
## 安裝 Homebrew ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
## brew install git postgresql fontconfig imagemagick --with-fontconfig
# RVM https://rvm.io/
# curl -sSL https://get.rvm.io | bash -s stable

# rvm install ruby-2.1.2
# 把 server ip 加入 config/deploy/staging.rb, 跑 cap staging deploy:check, 會幫你建立目錄並跟你說少什麼檔案
# 從別台 server 複製設定檔, 例如:
# scp 'commandp@192.168.0.156:~/deploy/staging/shared/config/*.yml' .
# scp *.yml commandp@192.168.0.141:~/deploy/staging/shared/config/
# 跑 cap staging deploy:check, 確定沒少檔案
# ssh bitbucket.org
# cap staging deploy <- 要跑很久, 可以先去打個桌球