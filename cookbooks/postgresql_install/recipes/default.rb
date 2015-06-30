#
# Cookbook Name:: postgresql_install
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'postgresql::server_redhat'
include_recipe 'postgresql::client'
include_recipe 'postgresql::config_pgtune'
