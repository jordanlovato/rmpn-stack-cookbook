#
# Cookbook Name:: shelly
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'ruby_build'
include_recipe 'ruby_rbenv::system_install'
include_recipe 'nodejs'
include_recipe 'shelly::setup_environment'
include_recipe 'nginx_passenger'
include_recipe 'shelly::webserver'
include_recipe 'mongodb-10gen'
include_recipe 'mongodb-10gen::single'
