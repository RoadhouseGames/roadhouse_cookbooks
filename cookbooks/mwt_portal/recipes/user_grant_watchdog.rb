#
# Cookbook Name:: mwt_portal
# Recipe:: user_grant_watchdog
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

SERVICES_FOLDER = node[:app][:root] + "/application/services"

log "  Executing User Grant Watchdog Script"
bash "execute_user_grant_watchdog" do
  code <<-EOH
    bash #{SERVICES_FOLDER}/granting/userGrantWatchdog.sh > /dev/null 2>&1
  EOH
end

rightscale_marker :end
