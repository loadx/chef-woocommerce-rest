afa-proxy Cookbook
===================
Tells Ruby and the shell to use both a http and https proxy.
Wires this same proxy configuration into the apt configuration.
Configures the mirror to use for ubuntu apt packages so that installs are faster.

Requirements
------------
#### cookbooks
- `ubuntu` - Used for telling apt whcih archive url to use


Attributes
----------
- `proxy_url` - Defines what ipaddress/name the proxy is on. (defaults to http://server.local:8123)
- `cache-limit` - Defines the maximum amount of data that should be cached (defaults to 48mb)
- `archive-url` - Defines the base mirror url for apt. All repository sub-urls in apt will be based on this (defaults to au.archive.ubuntu.com)
- `pip_proxy` - Used to speed up pip installations. If pip_proxy has a value then pip will use the proxy defined, storing each downloaded artifact into the proxy's cache. 




Usage
-----
Include the recipe in your run_list. If you are using this from inside of kitchen consider adding it to your .kitchen.yml. 
Do not innclude this as a recipe inside a cookbook as everything is dependant on being inside of the AFA office. If you need to work form home its easier to just remove this from the run_list using your kitchen.local.yml rather than editing cookbooks.


License and Authors
-------------------
Heavy Water ops
