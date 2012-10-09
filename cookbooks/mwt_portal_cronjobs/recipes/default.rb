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

# Test!
run_remote_recipe("mwt_portal:playspan_complete_pending_requests")


# Run the specified recipe on a single remote app server
def run_remote_recipe(recipe_name)
  remote_recipe recipe_name do
  recipe "#{recipe_name}"
  recipients_tags "appserver:active=true"
  scope :single
end

rightscale_marker :end
