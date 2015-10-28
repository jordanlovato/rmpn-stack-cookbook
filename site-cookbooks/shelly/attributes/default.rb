default['shelly']['rubies'] = ['2.2.3']
default['shelly']['active_ruby'] = '2.2.3'
default['shelly']['webdir'] = '/var/www/shelly'
default['shelly']['webuser'] = 'www-data'
default['shelly']['appname'] = 'shelly'

normal['nginx_passenger']['ruby'] = "/usr/local/rbenv/versions/#{node['shelly']['active_ruby']}/bin/ruby"

#nginx conf
#normal['nginx']['version'] = '1.8.0'
#normal['nginx']['default_site_enabled'] = true
#normal['nginx']['source']['modules'] = ['nginx::http_gzip_static_module', 'nginx::http_ssl_module', 'nginx::passenger']

#passenger conf
#normal['nginx']['passenger']['version'] = '5.0.21'
#normal['nginx']['passenger']['ruby'] = "/usr/local/rbenv/versions/#{node['shelly']['active_ruby']}/bin/ruby"
#normal['nginx']['passenger']['root'] = "/usr/local/rbenv/versions/#{node['shelly']['active_ruby']}/lib/ruby/gems/#{node['shelly']['active_ruby'].gsub(/\.\d$/, '.0')}/gems/passenger-#{node['nginx']['passenger']['version']}"
