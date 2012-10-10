#
# Cookbook Name:: mwt_portal
# Recipe:: user_log_cleanup
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

SERVICES_FOLDER = node[:app][:root] + "/application/services"

log "Executing User Log Cleanup Script"
bash "execute_user_log_cleanup" do
  cwd SERVICES_FOLDER
  code <<-EOH
    bash #{SERVICES_FOLDER}/user/userlogCleanup.sh > /dev/null 2>&1
  EOH
end

rightscale_marker :end
