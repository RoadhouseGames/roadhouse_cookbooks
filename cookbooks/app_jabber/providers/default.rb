#
# Default provider for app_jabber
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

# Stop ejabberd
action :stop do
  log "  Running stop sequence"
  service "ejabberd" do
    action :stop
    persist false
  end
end

# Start ejabberd
action :start do
  log "  Running start sequence"
  service "ejabberd" do
    action :start
    persist false
  end
end

# Reload ejabberd
action :reload do
  log "  Running reload sequence"
  service "ejabberd" do
    action :reload
    persist false
  end
end

# Restart ejabberd
action :restart do
  action_stop
  sleep 5
  action_start
end

# Install any custom packages specified
action :install do
  # Installing required packages
  packages = new_resource.packages

  if not packages.nil?
    log "  Packages which will be installed #{packages}"

    packages.each do |p|
      package p
    end
  end
end

# These operations are not supported by app_jabber
action :setup_vhost do
  raise "  Configuration is performed during ::default recipe"
end

action :setup_db_connection do
  raise "  Configuration is performed during ::default recipe"
end

action :code_update do
  raise "  No code updates are necessary for app_jabber"
end