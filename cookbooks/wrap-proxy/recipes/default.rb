#
# Cookbook Name:: proxy
# Recipe:: default
#
#

node.set['ubuntu']['archive_url'] = node['proxy']['archive_url']
#include_recipe "ubuntu"

# This is my LXC host polipo instance ;)
ruby_block "set proxy" do
  block do
    %w[http_proxy https_proxy].each do |config|
      Chef::Config[config.to_sym] = node['proxy']['proxy_url']
    end
  end
  action node['proxy']['ruby_block_action']
end

file File.join("/etc/apt/apt.conf.d", '99proxy') do
  content <<-EOH
Acquire {
    Retries "0";
    HTTP { Proxy "#{node['proxy']['proxy_url']}"; };
};
EOH
  action :nothing
end.run_action(:create)

file File.join("/etc/apt/apt.conf.d", '99cachelimit') do
  content <<-EOH
APT::Cache-Limit "#{node['proxy']['cache-limit']}";
EOH
  action :nothing
end.run_action(:create)
