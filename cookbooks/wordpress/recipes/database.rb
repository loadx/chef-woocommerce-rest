
db = node['wordpress']['db']

mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database db['name'] do
  connection  mysql_connection_info
  action      :create
end

mysql_database_user db['user'] do
  connection    mysql_connection_info
  password      db['password']
  host          db['host']
  database_name db['name']
  privileges    [:all]
  action        [:create, :grant]
end
