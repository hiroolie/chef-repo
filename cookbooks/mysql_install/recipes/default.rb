#
# Cookbook Name:: mysql_install
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# EPELリポジトリのインストール
remote_file "/tmp/#{node['epel']['file_name']}" do
  source "#{node['epel']['remote_uri']}"
  not_if { ::File.exists?("/tmp/#{node['epel']['file_name']}") }
end

package node['epel']['file_name'] do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{node['epel']['file_name']}"
  not_if "yum list installed | grep installed | grep -q epel"
end

# remiリポジトリのインストール
remote_file "/tmp/#{node['remi']['file_name']}" do
  source "#{node['remi']['remote_uri']}"
  not_if { ::File.exists?("/tmp/#{node['remi']['file_name']}") }
end

package node['remi']['file_name'] do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{node['remi']['file_name']}"
  not_if "yum list installed | grep installed | grep -q remi"
end

# RPMForgeリポジトリのインストール
remote_file "/tmp/#{node['rpmforge']['file_name']}" do
  source "#{node['rpmforge']['remote_uri']}"
  not_if { ::File.exists?("/tmp/#{node['rpmforge']['file_name']}") }
end

package node['rpmforge']['file_name'] do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{node['rpmforge']['file_name']}"
  not_if "yum list installed | grep installed | grep -q rpmforge"
end

# リポジトリの設定変更
bash 'repo' do
  user 'root'
  code <<-EOC
cd /etc/yum.repos.d
for r in epel.repo remi.repo rpmforge.repo; do cp -p $r $r.old; cat $r.old | sed 's/^enabled.*$/enabled = 0/' > $r; done
  EOC
  not_if "grep -q 'enabled = 0' /etc/yum.repos.d/epel.repo"
end
