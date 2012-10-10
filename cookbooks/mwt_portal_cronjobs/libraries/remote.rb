#
# Cookbook Name:: mwt_portal_cronjobs
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

module Roadhouse
  module PortalCronJobs
    module Remote

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

    end
  end
end