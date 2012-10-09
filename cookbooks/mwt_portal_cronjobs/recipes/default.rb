#
# Cookbook Name:: mwt_portal_cronjobs
# Recipe:: default
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

# Setup the cron job entries

class Chef::Recipe
  include RightScale::LB::Helper
end

# Get all attached app servers
vhosts(node[:lb][:vhost_names]).each do |vhost_name|

  log "  Getting all attached servers for: " + vhost_name

  attached_servers = get_attached_servers(vhost_name)

  attached_servers.each do |current_server|
    log "  Found: " + current_server
  end
end

############
#attrs = {:app => Hash.new}
#attrs[:app][:lb_ip] = node[:cloud][:private_ips][0]

#vhosts(node[:lb][:vhost_names]).each do | vhost_name |
#  remote_recipe "Update app servers firewall" do
#    recipe "app::handle_loadbalancers_allow"
#    recipients_tags "loadbalancer:#{vhost_name}=app"
#    attributes attrs
#  end
#end
############


rightscale_marker :end
