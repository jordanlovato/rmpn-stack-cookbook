#
# Cookbook Name:: shelly
# Recipe:: setup_environment
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# install ruby, rails, and thin for all specified versions
node['shelly']['rubies'].each do |ver|
	rbenv_ruby ver
	
	rbenv_gem 'rails' do
		rbenv_version "#{ver}"
		action :install
		version "4.2.4"
	end
	
	rbenv_gem 'bundler' do
		rbenv_version "#{ver}"
		action :install
		version "1.10"
	end
end

# set version 2.2.3 to be the global ruby version in rbenv
rbenv_global '2.2.3'

# install ruby 2.2.3 (default enabled ver)
#ruby_build_ruby '2.2.3' do
#	prefix_path "/usr/local/ruby/ruby-2.2.3"
#end

# install ruby ver 2.2.2
#ruby_build_ruby '2.2.2' do
#	prefix_path "/usr/local/ruby/ruby-2.2.2"
#end

# install ruby ver 2.2.1
#ruby_build_ruby '2.2.1' do
#	prefix_path "/usr/local/ruby/ruby-2.2.1"
#end
