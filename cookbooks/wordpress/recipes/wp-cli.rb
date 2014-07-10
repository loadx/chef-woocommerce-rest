remote_file node['wordpress']['wp_cli_location'] do
  source node['wordpress']['wp_cli_url']
  mode "0755"
  owner node['wordpress']['install']['user']
  group node['wordpress']['install']['group']
  action :create_if_missing
end
