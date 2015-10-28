#
# Cookbook Name:: shelly
# Recipe:: webserver
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# setup nginx web user
group node['shelly']['webuser']

user node['shelly']['webuser'] do
	group node['shelly']['webuser']
	system true
	shell '/bin/bash'
end

# setup nginx website directories
%W{public log}.each do |dir|
	directory "#{node['shelly']['webdir']}/#{dir}" do
		group node['shelly']['webuser']
		owner node['shelly']['webuser']
		mode 0755
		recursive true
	end
end

# setup nginx site-enabled symlink + conf
nginx_passenger_site node['shelly']['appname'] do
	action :create
	template 'nginx.conf.erb'
end
