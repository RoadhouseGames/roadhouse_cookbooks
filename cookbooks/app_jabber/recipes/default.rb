#
# Cookbook Name:: app_jabber
# Recipe:: default
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

log "  Setting provider specified for jabber application server."
node[:app][:provider] = "app_jabber"

log "  Install ejabberd"
package "ejabberd" do
  action :install
end

template "/etc/ejabberd/ejabberd.cfg" do
  action :create
  source "ejabberd.cfg.erb"
  mode "0644"
  group "root"
  owner "root"
  cookbook "app_jabber"
  variables(
      :host => node[:app_jabber][:host_name],
      :fqdn => node[:app_jabber][:db_fqdn],
      :database => node[:app_jabber][:db_schema_name],
      :user => node[:app_jabber][:db_user],
      :password => node[:app_jabber][:db_password]
  )
end

service "ejabberd" do
  action [ :enable, :start ]
end

rightscale_marker :end