name             'wrap-mysql'
maintainer       'Extensionworks'
maintainer_email 'chef@extensionworks.com'
license          'MIT'
description      'Installs/Configures wrap-mysql'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "database"
depends "mysql"
