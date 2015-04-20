#
# Cookbook Name:: commandp
# Recipe:: default
#

include_recipe "build-essential"
include_recipe "homebrew"

%w{git postgresql fontconfig imagemagick}.each do |package_name|
execute "Installing #{package_name}" do
  command "brew install #{package_name}"
  not_if  "brew list | grep -q #{package_name}"
end
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