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

log "  Create ejabberd configuration file from template"
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
      :password => node[:app_jabber][:db_password],
      :public_ipv4 => node[:cloud][:public_ips][0],
      :private_ipv4 => node[:cloud][:private_ips][0]
  )
end

log "  Create ejabberd-modules directory"
destination_dir = "/opt/ejabberd-modules"
directory destination_dir do
  mode "0755"
  action :create
end

log "  Copy over mysql-modules.tgz file from cookbook"
cookbook_file "/tmp/mysql-modules.tgz" do
  source "mysql-modules.tgz"
  mode "0644"
  cookbook "app_jabber"
end

bash "install_ejabberd-modules_mysql" do
  cwd destination_dir
  code <<-EOH
    echo "======= Extracting ejabberd mysql-modules.tgz ======="
    tar xzf /tmp/mysql-modules.tgz -C /usr/lib64/ejabberd/ebin/
    echo "======= Complete ======="
  EOH
end

log "  Open required ports in the firewall (Security Group keeps security tight!)"
sys_firewall "Open port 5222 for client connections" do
  port 5222
  enable true
  action :update
end

sys_firewall "Open port 5280 for web admin" do
  port 5280
  enable true
  action :update
end

sys_firewall "Open port 5269 for server connections" do
  port 5269
  enable true
  action :update
end

log "  Restart the ejabberd service"
service "ejabberd" do
  action [ :enable, :restart ]
end

rightscale_marker :end