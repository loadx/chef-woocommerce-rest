#
# Cookbook Name:: wrap-wordpress
# Recipe:: default
#
#
include_recipe 'selfsigned_certificate'
include_recipe "wordpress::database"
include_recipe "wordpress::wp-cli"

cli = node['wordpress']['wp_cli_location']

hostsfile_entry "127.0.0.1" do
  hostname node['wordpress']['server_name']
  unique true
  comment "wordpress"
end

directory node['wordpress']['dir'] do
  action :create
  recursive true
  owner node['wordpress']['install']['user']
  group node['wordpress']['install']['group']
  mode '00755'
end

web_app "wordpress_ssl" do
  template "wordpress_ssl.conf.erb"
  docroot node['wordpress']['dir']
  server_name node['wordpress']['server_name']
  server_aliases node['wordpress']['server_aliases']
  server_port node['wordpress']['ssl_port']
  ssl_certificate_file  File.join(node['selfsigned_certificate']['destination'], 'server.crt')
  ssl_certificate_key_file File.join(node['selfsigned_certificate']['destination'], 'server.key')
  enable true
end

execute "download wordpress" do
  wp_index = File.join(node['wordpress']['dir'], 'index.php')
  command "#{cli} core download --path=#{node['wordpress']['dir']}"
  user node['wordpress']['install']['user']
  group node['wordpress']['install']['group']
  not_if { File.exists?(wp_index) }
end

execute "generate config.php" do
  wp_config = File.join(node['wordpress']['dir'], 'wp-config.php')
  command "#{cli} core config" \
    " --dbname=#{node['wordpress']['db']['name']} --dbuser=#{node['wordpress']['db']['user']}" \
    " --dbpass=#{node['wordpress']['db']['password']} --dbhost=#{node['wordpress']['db']['host']}" \
    " --extra-php <<PHP" \
    "\ndefine('WP_SITEURL', 'https://#{node['wordpress']['server_name']}');" \
    "\ndefine('WP_HOME', 'https://#{node['wordpress']['server_name']}');"
  cwd node['wordpress']['dir']
  user node['wordpress']['install']['user']
  group node['wordpress']['install']['group']
  not_if { File.exists?(wp_config) }
  notifies :run, "execute[install wordpress]", :delayed
end

execute "install wordpress" do
  command "#{cli} core install" \
    " --url=#{node['wordpress']['server_name']}" \
    " --title=#{node['wordpress']['title']}" \
    " --admin_user=#{node['wordpress']['admin_user']}" \
    " --admin_password=#{node['wordpress']['admin_password']}" \
    " --admin_email=#{node['wordpress']['admin_email']}"
  cwd node['wordpress']['dir']
  user node['wordpress']['install']['user']
  group node['wordpress']['install']['group']
  not_if "#{cli} core is-installed",
    :cwd => node['wordpress']['dir'],
    :user => node['wordpress']['install']['user'],
    :group => node['wordpress']['install']['group']
  action :nothing
end

uploads_dir = File.join(node['wordpress']['dir'], 'wp-content/uploads')
directory uploads_dir do
  mode 0777
end

# all plugins go here
include_recipe "wordpress::woocommerce"
