name             'wrap-time'
maintainer       'Extensionworks'
maintainer_email 'chef@extensionworks.com'
license          'MIT'
description      'Installs/Configures time'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "ntp"
depends "timezone-ii"
