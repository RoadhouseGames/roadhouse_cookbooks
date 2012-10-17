#
# Cookbook Name:: mwt_portal
# Recipe:: update_game_client_url
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

CONFIG_FOLDER = node[:app][:root] + "/application/configs"
GAME_CLIENT_URL = node[:mwt_portal][:game_client_url]

log "Changing Game Client URL"
bash "editing game client url" do
  cwd CONFIG_FOLDER
  code <<-EOH
    sed "s!\$REGISTRY->game->client_url = '.*';!\$REGISTRY->game->client_url = 'http://#{GAME_CLIENT_URL}';!" -i application.php
  EOH
end

log "  Restarting httpd"
service "httpd" do
  action [ :enable, :restart ]
end

rightscale_marker :end
