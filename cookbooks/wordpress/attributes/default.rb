default['wordpress']['install']['user'] = 'vagrant'
default['wordpress']['install']['group'] = 'vagrant'

default['wordpress']['server_name'] = 'wordpress.local'
default['wordpress']['version'] = 'latest'
default['wordpress']['dir'] = '/fs/wordpress'
default['wordpress']['db']['name'] = 'wordpress'
default['wordpress']['db']['host'] = 'localhost'
default['wordpress']['db']['user'] = 'wordpress'
default['wordpress']['db']['password'] = 'password'
default['wordpress']['ports'] = [8080, 443]

# wp-cli stuff
default['wordpress']['title'] = 'WooTest'
default['wordpress']['admin_user'] = 'admin'
default['wordpress']['admin_password'] = 'password'
default['wordpress']['admin_email'] = 'none@spam.com'
default['wordpress']['wp_cli_location'] = ::File.join(default['wordpress']['dir'], 'wp-cli.phar')
default['wordpress']['wp_cli_url'] = 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
