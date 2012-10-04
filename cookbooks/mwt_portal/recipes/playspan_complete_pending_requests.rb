#
# Cookbook Name:: mwt_portal
# Recipe:: playspan_complete_pending_requests
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

SERVICES_FOLDER = node[:app][:root] + "/application/services"

log "  Executing Playspan Complete Pending Requests Script"
bash "execute_playspan_complete_pending_requests" do
  code <<-EOH
    bash #{SERVICES_FOLDER}/purchase/completePending.sh > /dev/null 2>&1
  EOH
end

rightscale_marker :end
