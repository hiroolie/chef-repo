default['postgresql']['enable_pgdg_yum']  = true
default['postgresql']['version']          = '9.3'

default['postgresql']['server']['packages'] = ['postgresql-9.3', 'postgresql-server-dev-9.3']
default['postgresql']['client']['packages'] = ['postgresql-client-9.3']

default['postgresql']['dir'] = '/etc/postgresql/9.3/main'

default['postgresql']['config']['data_directory']           = "/var/lib/postgresql/#{default['postgresql']['version']}/main"
default['postgresql']['config']['hba_file']                 = "/etc/postgresql/#{default['postgresql']['version']}/main/pg_hba.conf"
default['postgresql']['config']['ident_file']               = "/etc/postgresql/#{default['postgresql']['version']}/main/pg_ident.conf"
default['postgresql']['config']['external_pid_file']        = "/var/run/postgresql/#{default['postgresql']['version']}-main.pid"
default['postgresql']['config']['unix_socket_directories']  = '/var/run/postgresql'
#default['postgresql']['config']['unix_socket_directory']    = '/tmp'
default['postgresql']['config']['ssl_cert_file']            = '/etc/ssl/certs/ssl-cert-snakeoil.pem'
default['postgresql']['config']['ssl_key_file']             = '/etc/ssl/private/ssl-cert-snakeoil.key'

default['postgresql']['initdb_locale'] = 'en_US.UTF-8'

#default['postgresql']['password']['postgres'] = 'bed128365216c019988915ed3add75fb'
default['postgresql']['password']['postgres'] = 'bed128365216c019988915ed3add75fb'

default['postgresql']['config_pgtune']['db_type'] = 'web'
default['postgresql']['config_pgtune']['total_memory'] = '102400kB'
