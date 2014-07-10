#
# Cookbook Name:: afa-postfix
# Recipe:: default
#
# Copyright 2013, AFA Insurance
#
# All rights reserved - Do Not Redistribute
#
package 'postfix'

service "postfix" do
  supports :status => true, :restart => true, :reload => true
  action :enable
end

execute "rehash-config" do
  command "postmap /etc/postfix/main.cf"
  action :nothing
end

# replace the main config with our own
# rehash the config and restart postfix
template "/etc/postfix/main.cf" do
  source "main.cf.erb"
  action :create
  notifies :run, "execute[rehash-config]", :immediately
  notifies :restart, "service[postfix]", :delayed
end
