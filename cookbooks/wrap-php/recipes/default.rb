#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "php"

node['php']['modules'].each do |module_name|
  package "php5-#{module_name}"
end
