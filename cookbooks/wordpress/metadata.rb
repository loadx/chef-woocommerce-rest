name             'wordpress'
maintainer       'Extensionworks'
maintainer_email 'chef@extensionworks.com'
license          'MIT'
description      'Installs/Configures wordpress'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apache2"
depends "hostsfile"
depends "database"
depends "selfsigned_certificate"
