default['wordpress']['install']['user'] = 'vagrant'
default['wordpress']['install']['group'] = 'vagrant'

default['wordpress']['server_name'] = 'wordpress.local'
default['wordpress']['version'] = 'latest'
default['wordpress']['dir'] = '/fs/wordpress'
default['wordpress']['db']['name'] = 'wordpress'
default['wordpress']['db']['host'] = 'localhost'
default['wordpress']['db']['user'] = 'wordpress'
default['wordpress']['db']['password'] = 'password'

# wp-cli stuff
default['wordpress']['title'] = 'WooTest'
default['wordpress']['admin_user'] = 'admin'
default['wordpress']['admin_password'] = 'password'
default['wordpress']['admin_email'] = 'none@spam.com'
default['wordpress']['wp_cli_location'] = ::File.join(default['wordpress']['dir'], 'wp-cli.phar')
default['wordpress']['wp_cli_url'] = 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'

# ssl
default['wordpress']['ssl_port'] = [443]
default['selfsigned_certificate']['sslpassphrase'] = 'password'
default['selfsigned_certificate']['country'] = 'AU'
default['selfsigned_certificate']['state'] = 'VIC'
default['selfsigned_certificate']['city'] = 'Melbourne'
default['selfsigned_certificate']['orga'] = 'Extensionworks'
default['selfsigned_certificate']['depart'] = ''
default['selfsigned_certificate']['cn'] = 'wordpress.local'
default['selfsigned_certificate']['email'] = 'loadx.mat@gmail.com'
