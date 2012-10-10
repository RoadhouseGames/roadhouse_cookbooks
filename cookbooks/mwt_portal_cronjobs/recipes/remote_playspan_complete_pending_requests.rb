#
# Cookbook Name:: mwt_portal_cronjobs
# Recipe:: remote_playspan_complete_pending_requests.rb
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

class Chef::Recipe
  include Roadhouse::PortalCronJobs::Remote
end

run_remote_recipe("mwt_portal::playspan_complete_pending_requests")

rightscale_marker :end
