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
CONFIG_FILE = "application.php"
GAME_CLIENT_URL = node[:mwt_portal][:game_client_url]


log "Changing Game Client URL"
log "  Editing file: #{CONFIG_FOLDER}/#{CONFIG_FILE}"
log "  Setting URL to: #{GAME_CLIENT_URL}"
bash "editing game client url" do
  cwd CONFIG_FOLDER
  code <<-EOH
    sed "s!\$REGISTRY->game->client_url = '.*';!\$REGISTRY->game->client_url = 'http://#{GAME_CLIENT_URL}';!" -i #{CONFIG_FILE}
  EOH
end

log "  Restarting httpd"
service "httpd" do
  action [ :enable, :restart ]
end

rightscale_marker :end
