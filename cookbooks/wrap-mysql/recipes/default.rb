#
# Cookbook Name:: wrap-mysql
# Recipe:: default
#
#
include_recipe "mysql::server"
include_recipe "mysql::client"
include_recipe "database::mysql"
