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

log "Creating remote Playspan entry"
REMOTE_PLAYSPAN_INTERVAL = node[:mwt_portal_cronjobs][:remote_playspan_complete_pending_requests_interval]
if REMOTE_PLAYSPAN_INTERVAL > 0
  cron "MWT Cron for Remote Playspan Complete Pending Requests" do
    minute #{REMOTE_PLAYSPAN_INTERVAL}
    user "root"
    command "rs_run_recipe -n 'mwt_portal_cronjobs::remote_playspan_complete_pending_requests' 2>&1 > /var/log/remote_playspan_complete_pending_requests.log"
    action :create
  end
end

log "Creating remote user log cleanup entry"
REMOTE_USER_CLEAN_UP_INTERVAL = node[:mwt_portal_cronjobs][:remote_user_log_cleanup_interval]
if REMOTE_USER_CLEAN_UP_INTERVAL  > 0
  cron "MWT Cron for Remote User Log Cleanup Requests" do
    month #{REMOTE_USER_CLEAN_UP_INTERVAL}
    user "root"
    command "rs_run_recipe -n 'mwt_portal_cronjobs::remote_user_log_cleanup' 2>&1 > /var/log/remote_user_log_cleanup.log"
    action :create
  end
end

rightscale_marker :end
