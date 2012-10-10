#
# Cookbook Name:: mwt_portal_cronjobs
# Recipe:: default
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

# function: run_remote_recipe
# desc:     Run the specified recipe on a single remote app server
# args:     recipe_name - the name of the remote
def run_remote_recipe(recipe_name)
  remote_recipe recipe_name do
    recipe "#{recipe_name}"
    recipients_tags "appserver:active=true"
    scope :single
  end
end

# Setup the cron job entries

# Test!
#run_remote_recipe("mwt_portal:playspan_complete_pending_requests")

rightscale_marker :end
