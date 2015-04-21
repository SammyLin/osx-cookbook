
#
# Cookbook Name:: brew install
# Recipe:: default
#

include_recipe "build-essential"
include_recipe "homebrew"

node["brew"]["package"].each do |package_name|
execute "Installing #{package_name}" do
  command "brew install #{package_name}"
  not_if  "brew list | grep -q #{package_name}"
end
end