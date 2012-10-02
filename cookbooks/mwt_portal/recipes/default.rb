#
# Cookbook Name:: mwt_portal
# Recipe:: default
#
# Copyright 2012, Infinite Game Publishing & Roadhouse Interactive
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

PHP_CONFIG_DIR = "/etc"
APACHE_CONFIG_DIR = node[:apache][:dir] + "/sites-enabled"
WWW_DOCUMENT_ROOT = node[:app][:root]
WWW_NEW_DOCUMENT_ROOT = WWW_DOCUMENT_ROOT + "/public"
SERVICES_FOLDER = WWW_DOCUMENT_ROOT + "/application/services"


log "  Executing portal init.sh script"
bash "execute_portal_init_script" do
  cwd SERVICES_FOLDER
  code <<-EOH
    bash init.sh
  EOH
end

log "  Copying health check page from cookbook"
cookbook_file "#{WWW_NEW_DOCUMENT_ROOT}/health_check_123456.html" do
  source "health_check_123456.html"
  mode "0644"
  cookbook "mwt_portal"
end

log "  Moving .htaccess-dist to .htaccess"
bash "move_htaccess" do
  cwd WWW_NEW_DOCUMENT_ROOT
  code <<-EOH
    mv .htaccess-dist .htaccess
  EOH
end

log "  Configuring Apache server"
bash "edit_apache_config" do
  cwd APACHE_CONFIG_DIR
  code <<-EOH
    sed 's:#{WWW_DOCUMENT_ROOT}:#{WWW_NEW_DOCUMENT_ROOT}:' -i mwtactics.conf
    sed 's:AllowOverride None:AllowOverride All:' -i mwtactics.conf
  EOH
end

log "  Configuring PHP"
bash "edit_php_config" do
  cwd PHP_CONFIG_DIR
  code <<-EOH
    sed 's:short_open_tags = Off:short_open_tags = On:' -i php.ini
  EOH
end

log "  Creating '#{WWW_DOCUMENT_ROOT}/application/configs/application.php' file"

MEMCACHE_ENABLED = TRUE
if node[:mwt_portal][:memcache_hostname] == ""
  MEMCACHE_ENABLED = FALSE
end

template "#{WWW_DOCUMENT_ROOT}/application/configs/application.php" do
  action :create
  source "application.php.erb"
  mode "0644"
  group "root"
  owner "root"
  cookbook "mwt_portal"
  variables(
      :domain => node[:mwt_portal][:domain],
      :portal_hostname => node[:mwt_portal][:portal_hostname],
      :game_hostname => node[:mwt_portal][:game_hostname],
      :game_port => node[:mwt_portal][:game_port],
      :game_client_url => node[:mwt_portal][:game_client_url],
      :game_require_beta_key => node[:mwt_portal][:game_require_beta_key],
      :game_shared_secret => node[:mwt_portal][:game_shared_secret],
      :db_fqdn => node[:db][:dns][:master][:fqdn],
      :db_schema_name => node[:db][:dump][:database_name],
      :db_user => node[:db][:application][:user],
      :db_password => node[:db][:application][:password],
      :contact_email => node[:mwt_portal][:contact_email],
      :sender_email => node[:mwt_portal][:sender_email],
      :smtp_user => node[:mwt_portal][:smtp_user],
      :smtp_password => node[:mwt_portal][:smtp_password],
      :mail_chimp_key => node[:mwt_portal][:mail_chimp_key],
      :mail_chimp_reg_id => node[:mwt_portal][:mail_chimp_reg_id],
      :mail_chimp_news_id => node[:mwt_portal][:mail_chimp_news_id],
      :aws_access_key => node[:mwt_portal][:aws_access_key],
      :aws_secret_key => node[:mwt_portal][:aws_secret_key],
      :cdn_fqdn => node[:mwt_portal][:cdn_fqdn],
      :cdn_user => node[:mwt_portal][:cdn_user],
      :cdn_password => node[:mwt_portal][:cdn_password],
      :cdn_user_asset_folder => node[:mwt_portal][:cdn_user_asset_folder],
      :cdn_storage_fqdn => node[:mwt_portal][:cdn_storage_fqdn],
      :cdn_storage_user => node[:mwt_portal][:cdn_storage_user],
      :cdn_storage_password => node[:mwt_portal][:cdn_storage_password],
      :cdn_storage_asset_folder => node[:mwt_portal][:cdn_storage_asset_folder],
      :memcache_enabled => MEMCACHE_ENABLED,
      :memcache_fqdn => node[:mwt_portal][:memcache_fqdn],
      :memcache_port => node[:mwt_portal][:memcache_port],
      :playspan_id => node[:mwt_portal][:playspan_id],
      :playspan_merchant_key => node[:mwt_portal][:playspan_merchant_key],
      :playspan_password => node[:mwt_portal][:playspan_password],
      :playspan_user_account_prefix => node[:mwt_portal][:playspan_user_account_prefix],
      :playspan_catalog => node[:mwt_portal][:playspan_catalog],
      :playspan_upay_lightbox => node[:mwt_portal][:playspan_upay_lightbox],
      :playspan_featured_sub => node[:mwt_portal][:playspan_featured_sub],
      :playspan_product_id_prefix => node[:mwt_portal][:playspan_product_id_prefix],
      :playspan_scrap_code => node[:mwt_portal][:playspan_scrap_code],
      :playspan_cbills_code => node[:mwt_portal][:playspan_cbills_code],
      :google_analytics_account => node[:mwt_portal][:google_analytics_account],
      :web_purify_key => node[:mwt_portal][:web_purify_key],
      :zendesk_account_id => node[:mwt_portal][:zendesk_account_id],
      :zendesk_user => node[:mwt_portal][:zendesk_user],
      :zendesk_password => node[:mwt_portal][:zendesk_password],
      :zendesk_field_id => node[:mwt_portal][:zendesk_field_id]
  )
end

log "  Creating '#{WWW_DOCUMENT_ROOT}/public/forums/conf_global.php' file"
template "#{WWW_DOCUMENT_ROOT}/public/forums/conf_global.php" do
  action :create
  source "conf_global.php.erb"
  mode "0644"
  group "root"
  owner "root"
  cookbook "mwt_portal"
  variables(
      :domain => node[:mwt_portal][:domain],
      :portal_hostname => node[:mwt_portal][:portal_hostname],
      :db_forum_fqdn => node[:db][:dns][:master][:fqdn],
      :db_forum_schema_name => node[:mwt_portal][:db_forum_schema_name],
      :db_forum_user => node[:mwt_portal][:db_forum_user],
      :db_forum_password => node[:mwt_portal][:db_forum_password]
  )
end

log "  Restarting httpd"
service "httpd" do
  action [ :enable, :restart ]
end

rightscale_marker :end
