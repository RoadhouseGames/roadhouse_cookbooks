#
# Cookbook Name:: mwt_portal
# Recipe:: default
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

APACHE_CONFIG_DIR = node[:apache][:dir] + "/sites-enabled"
WWW_DOCUMENT_ROOT = node[:app][:root]
WWW_NEW_DOCUMENT_ROOT = WWW_DOCUMENT_ROOT + "/public"
SERVICES_FOLDER = WWW_DOCUMENT_ROOT + "/application/services"

log "  Configuring MW Tactics Web Portal"

bash "configure_web_portal" do
  cwd APACHE_CONFIG_DIR
  code <<-EOH
    echo "    Setting DocumentRoot via sed to #{WWW_NEW_DOCUMENT_ROOT}"
    sed 's:#{WWW_DOCUMENT_ROOT}:#{WWW_NEW_DOCUMENT_ROOT}:' -i mwtactics.conf
  EOH
end

log "  Executing MW Tactics Web Portal Initialization Script"

bash "configure_web_portal_folders" do
  cwd SERVICES_FOLDER
  code <<-EOH
    bash init.sh
  EOH
end

log "  Restarting httpd"

bash "restart httpd" do
  code <<-EOH
    /sbin/service httpd restart
  EOH
end

log "  Configuring application.php file"

rightscale_marker :end
