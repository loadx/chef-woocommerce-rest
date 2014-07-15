cli = node['wordpress']['wp_cli_location']
plugin = "woocommerce"

execute "install plugin - #{plugin}" do
  command "#{cli}  plugin install #{plugin} --activate"
  cwd node['wordpress']['dir']
  user node['wordpress']['install']['user']
  group node['wordpress']['install']['group']
  not_if "#{cli} plugin list --fields=name | grep #{plugin}",
    :cwd => node['wordpress']['dir'],
    :user => node['wordpress']['install']['user'],
    :group => node['wordpress']['install']['group']
end


wp_settings = {
  "woocommerce_api_enabled" => "yes",
  "permalink_structure" => "/%postname%/",
}
wp_settings.each do |key,val|
  execute "set wp_option - #{key}" do
    command "#{cli} option update #{key} #{val}"
    cwd node['wordpress']['dir']
    user node['wordpress']['install']['user']
    group node['wordpress']['install']['group']
    not_if "#{cli} option get #{key} | grep #{val}",
      :cwd => node['wordpress']['dir'],
      :user => node['wordpress']['install']['user'],
      :group => node['wordpress']['install']['group']

  end
end

api_values = {
  "woocommerce_api_consumer_key" => "ck_f1e1bd5d15dee529d75d5f90d6af4b7f",
  "woocommerce_api_consumer_secret" => "cs_db232802cc947a7c1ca0eb4ec64471ea",
  "woocommerce_api_key_permissions" => "read",
}
api_values.each do |key,val|
  execute "set woo meta option - #{key}" do
    command "#{cli} user meta update 1 #{key} #{val}"
    cwd node['wordpress']['dir']
    user node['wordpress']['install']['user']
    group node['wordpress']['install']['group']
    not_if "#{cli} user meta get 1 #{key} | grep #{val}",
      :cwd => node['wordpress']['dir'],
      :user => node['wordpress']['install']['user'],
      :group => node['wordpress']['install']['group']
  end
end
