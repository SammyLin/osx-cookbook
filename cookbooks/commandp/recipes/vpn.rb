#
# Cookbook Name:: commandp
# Recipe:: vpn
#
# This's VPN app
#

include_recipe 'dmg'

dmg_package 'Tunnelblick' do
  source   'http://sourceforge.net/projects/tunnelblick/files/All%20files/Tunnelblick_3.5.0_build_4265.dmg/download'
  checksum '3ed4b749f85924937e41f5c78d84db2cdaf52cb60b5528d5e019468be7a1ad04'
  action   :install
  not_if { ::File.directory?("/Applications/Tunnelblick.app") }
end

