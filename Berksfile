# -*- mode: ruby -*-
source "https://supermarket.getchef.com"

upstream_cookbooks = [
  'apache2',
  'apt',
  'build-essential',
  'database',
  'deb_pkg_unautostart',
  'php',
  'ntp',
  'timezone-ii',
  'hostsfile'
].each do |up_cb|
  cookbook up_cb
end

current_dir = File.dirname(__FILE__)
cookbook_dir = File.join(current_dir, "cookbooks")

local_cookbooks = Dir[File.join(cookbook_dir,'*','metadata.rb')].map do |cookbook_metadata|
  File.dirname(cookbook_metadata).split(File::SEPARATOR).last
end.each do |cookbook|
  cookbook cookbook, path: File.expand_path(File.join(cookbook_dir, cookbook))
end
