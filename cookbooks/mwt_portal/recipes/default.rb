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
FULL_TIME_ZONE_LINE = "date.timezone = " + node[:mwt_portal][:php_timezone]

bash "edit_php_config" do
  cwd PHP_CONFIG_DIR
  code <<-EOH
    sed 's:;date.timezone =:#{FULL_TIME_ZONE_LINE}:' -i php.ini
    sed 's:short_open_tag = Off:short_open_tag = On:' -i php.ini
    sed 's:allow_url_fopen = Off:allow_url_fopen = On:' -i php.ini
  EOH
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
      :db_forum_fqdn => node[:db][:dns][:master][:fqdn],
      :db_forum_schema_name => node[:mwt_portal][:db_forum_schema_name],
      :db_forum_user => node[:db][:application][:user],
      :db_forum_password => node[:db][:application][:password]
  )
end

log "  Creating '#{WWW_DOCUMENT_ROOT}/application/configs/application.php' file"
MEMCACHE_ENABLED = "TRUE"
if node[:mwt_portal][:memcache_hostname] == ""
  MEMCACHE_ENABLED = "FALSE"
end

template "#{WWW_DOCUMENT_ROOT}/application/configs/application.php" do
  action :create
  source "application.php.erb"
  mode "0644"
  group "root"
  owner "root"
  cookbook "mwt_portal"
  variables(
      :disable_route_urldecode => node[mwt_portal][:disable_route_urldecode],
      :debug_mode_enabled => node[:mwt_portal][:debug_mode_enabled],
      :allow_coupons_enabled => node[:mwt_portal][:allow_coupons_enabled],
      :api_logging_enabled => node[:mwt_portal][:api_logging_enabled],
      :grant_offer_disabled => node[:mwt_portal][:grant_offer_disabled],
      :domain => node[:mwt_portal][:domain],
      :game_hostname => node[:mwt_portal][:game_hostname],
      :game_port => node[:mwt_portal][:game_port],
      :game_client_url => node[:mwt_portal][:game_client_url],
      :game_require_beta_key => node[:mwt_portal][:game_require_beta_key],
      :game_shared_secret => node[:mwt_portal][:game_shared_secret],
      :db_fqdn => node[:db][:dns][:master][:fqdn],
      :db_schema_name => node[:app_php][:db_schema_name],
      :db_user => node[:db][:application][:user],
      :db_password => node[:db][:application][:password],
      :email_contact_account => node[:mwt_portal][:email_contact_account],
      :email_sender_account => node[:mwt_portal][:email_sender_account],
      :email_smtp_account => node[:mwt_portal][:email_smtp_account],
      :email_smtp_password => node[:mwt_portal][:email_smtp_password],
      :mail_chimp_key => node[:mwt_portal][:mail_chimp_key],
      :mail_chimp_reg_id => node[:mwt_portal][:mail_chimp_reg_id],
      :mail_chimp_news_id => node[:mwt_portal][:mail_chimp_news_id],
      :aws_access_key => node[:mwt_portal][:aws_access_key],
      :aws_secret_key => node[:mwt_portal][:aws_secret_key],
      :cdn_site_url => node[:mwt_portal][:cdn_site_url],
      :cdn_user_url => node[:mwt_portal][:cdn_user_url],
      :cdn_asset_user_account => node[:mwt_portal][:cdn_asset_user_account],
      :cdn_asset_user_password => node[:mwt_portal][:cdn_asset_user_password],
      :cdn_storage_fqdn => node[:mwt_portal][:cdn_storage_fqdn],
      :cdn_storage_user_account => node[:mwt_portal][:cdn_storage_user_account],
      :cdn_storage_user_password => node[:mwt_portal][:cdn_storage_user_password],
      :cdn_storage_base_folder => node[:mwt_portal][:cdn_storage_base_folder],
      :cdn_log_api_enabled => node[:mwt_portal][:cdn_log_api_enabled],
      :memcache_enabled => MEMCACHE_ENABLED,
      :memcache_hostname => node[:mwt_portal][:memcache_hostname],
      :memcache_port => node[:mwt_portal][:memcache_port],
      :playspan_api_url => node[:mwt_portal][:playspan_api_url],
      :playspan_access_id => node[:mwt_portal][:playspan_access_id],
      :playspan_store_id => node[:mwt_portal][:playspan_store_id],
      :playspan_merchant_key => node[:mwt_portal][:playspan_merchant_key],
      :playspan_admin_password => node[:mwt_portal][:playspan_admin_password],
      :playspan_upay_lightbox_enabled => node[:mwt_portal][:playspan_upay_lightbox_enabled],
      :playspan_login_id_prefix => node[:mwt_portal][:playspan_login_id_prefix],
      :playspan_catalog => node[:mwt_portal][:playspan_catalog],
      :playspan_featured_sub => node[:mwt_portal][:playspan_featured_sub],
      :playspan_product_subscription_id_1 => node[:mwt_portal][:playspan_product_subscription_id_1],
      :playspan_product_subscription_id_2 => node[:mwt_portal][:playspan_product_subscription_id_2],
      :playspan_product_subscription_id_3 => node[:mwt_portal][:playspan_product_subscription_id_3],
      :playspan_scrap_code => node[:mwt_portal][:playspan_scrap_code],
      :playspan_cbills_code => node[:mwt_portal][:playspan_cbills_code],
      :google_analytics_account => node[:mwt_portal][:google_analytics_account],
      :web_purify_key => node[:mwt_portal][:web_purify_key],
      :zendesk_account_id => node[:mwt_portal][:zendesk_account_id],
      :zendesk_user_account => node[:mwt_portal][:zendesk_user_account],
      :zendesk_user_password => node[:mwt_portal][:zendesk_user_password],
      :zendesk_field_id => node[:mwt_portal][:zendesk_field_id],
      :zendesk_portal_userfield_id => node[:mwt_portal][:zendesk_portal_userfield_id]
  )
end

log "  Rebuilding Forum Cache"
bash "rebuild_forum_cache" do
  code <<-EOH
    /usr/bin/php /home/webapps/mwtactics/application/services/commandline.php "Cache" "refresh-ipb-core"
    /usr/bin/php /home/webapps/mwtactics/application/services/commandline.php "Cache" "refresh-ipb-template-and-css"
  EOH
end

log "  Restarting httpd"
service "httpd" do
  action [ :enable, :restart ]
end

rightscale_marker :end
