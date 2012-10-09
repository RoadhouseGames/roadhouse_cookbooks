#
# Cookbook Name:: mwt_portal_cronjobs
# Recipe:: default
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

class Chef::Recipe
  include RightScale::LB::Helper
end

# Setup the cron job entries

rightscale_marker :end
