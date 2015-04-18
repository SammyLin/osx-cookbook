#
# Cookbook Name:: commandp
# Recipe:: ruby
#

execute "Installs RVM (Ruby Version Manager)" do
  command "curl -sSL https://get.rvm.io"
  not_if "which rvm"
end

node['rvm']['rubies']['version'].each do |version|
execute "Install #{version}" do
  command "rvm install #{version}"
  not_if "rvm list | grep '#{version}'"
end
end

execute "Set Default Ruby Version" do
 command "rvm use #{node['rvm']['ruby']['default_version']} --default"
 not_if "rvm list | grep '=> #{node['rvm']['ruby']['default_version']}'"
end
