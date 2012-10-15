maintainer       "Roadhouse Interactive and Infinite Game Publishing"
maintainer_email "george@roadhouseinteractive.com"
license          "All rights reserved"
description      "Configures mwt web portal"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

supports "centos", "~> 5.8"

depends "rightscale"

recipe "mwt_portal::default", "Configures the MWT web portal."
recipe "mwt_portal::playspan_complete_pending_requests", "Flush any pending requests to Playspan."
recipe "mwt_portal::user_log_cleanup", "Cleanup user logs in the database."
recipe "mwt_portal::user_grant_watchdog", "Check that the user grant process is running."

attribute "mwt_portal",
          :display_name => "MWT Portal Settings",
          :type => "hash"

attribute "mwt_portal/debug_mode_enabled",
          :display_name => "Debug Mode Enabled",
          :description => "Should the portal be put into debug mode? TRUE or FALSE.",
          :required => "recommended",
          :default => "FALSE",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/api_logging_enabled",
          :display_name => "API Logging Enabled",
          :description => "Enable API Logging? TRUE or FALSE.",
          :required => "recommended",
          :default => "FALSE",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/allow_coupons_enabled",
          :display_name => "Allow Coupons Enabled",
          :description => "Allow coupons? TRUE or FALSE.",
          :required => "recommended",
          :default => "FALSE",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/grant_offer_disabled",
          :display_name => "Grant Offers Disabled",
          :description => "Disable Grant Offers? TRUE or FALSE.",
          :required => "recommended",
          :default => "TRUE",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/domain",
          :display_name => "Domain",
          :description => "The domain for the portal. Example: 'mwtactics.com' or 'staging.mwtactics.com'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/game_hostname",
          :display_name => "Game Server Hostname",
          :description => "The Game server short hostname. Example: 'game'.",
          :required => "recommended",
          :default => "game",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/game_port",
          :display_name => "Game Server Port",
          :description => "The game server port. Example: '80' or '8000'.",
          :required => "recommended",
          :default => "80",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/game_client_url",
          :display_name => "Game Client URL",
          :description => "The URL where the game client lives.  Example 'cdn.mwtactics.com/game_staging/client/b285/unity/MechWarriorTactics/MechWarriorTactics.unity3d'.",
          :required => "recommended",
          :default => "cdn.mwtactics.com/game_staging/client/b285/unity/MechWarriorTactics/MechWarriorTactics.unity3d",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/game_require_beta_key",
          :display_name => "Game Requires Beta Key",
          :description => "Does the game require a beta key to launch?  TRUE or FALSE.",
          :required => "recommended",
          :default => "FALSE",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/game_shared_secret",
          :display_name => "Game Shared Secret",
          :description => "A secret key that the portal passes to the game server for validation.  Example 'cred:GAME_SECRET_KEY_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/memcache_hostname",
          :display_name => "Memcache Hostname",
          :description => "The Memcache server short hostname. Example: 'memcache'.",
          :required => "recommended",
          :default => "memcache",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/memcache_port",
          :display_name => "Memcache Port",
          :description => "The port for the memcache server. Example: '11211'.",
          :required => "recommended",
          :default => "11211",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/php_timezone",
          :display_name => "PHP Time Zone",
          :description => "The PHP Time Zone. Example: 'America/Montreal'.",
          :required => "recommended",
          :default => "America/Montreal",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/db_forum_schema_name",
          :display_name => "Database Forum Schema Name",
          :description => "The Forum (schema) name. Example: 'mwt_ipb'.",
          :required => "recommended",
          :default => "mwt_ipb",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/email_contact_account",
          :display_name => "Email Contact Account",
          :description => "The contact email address for the portal. Example: 'vibrant-sysadmin@vibrant-software.com'.",
          :required => "recommended",
          :default => "vibrant-sysadmin@vibrant-software.com",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/email_sender_account",
          :display_name => "EMail Sender Account",
          :description => "The sender email address for the portal. Example: 'noreply@mwtactics.com'.",
          :required => "recommended",
          :default => "noreply@mwtactics.com",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/email_smtp_account",
          :display_name => "EMail SMTP Account",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/email_smtp_password",
          :display_name => "EMail SMTP Password",
          :description => "The SMTP password for the portal.  Example 'cred:EMAIL_SMTP_PASSWORD'",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/mail_chimp_key",
          :display_name => "Mail Chimp Key",
          :description => "The Mail Chimp API Key.  Example: 'cred:MAILCHIMP_KEY_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/mail_chimp_reg_id",
          :display_name => "Mail Chimp Registration List ID",
          :description => "The Mail Chimp Registration List ID.  Example: 'cred:MAILCHIMP_REG_ID_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/mail_chimp_news_id",
          :display_name => "Mail Chimp Newsletter List ID",
          :description => "The Mail Chimp Newsletter List ID.  Example: 'cred:MAILCHIMP_NEWS_ID_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/aws_access_key",
          :display_name => "AWS Access Key",
          :description => "The AWS access key. Example: 'cred:AWS_ACCESS_KEY_ID'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/aws_secret_key",
          :display_name => "AWS Secret Key",
          :description => "The AWS secret key. Example: 'cred:AWS_SECRET_ACCESS_KEY'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/cdn_site_url",
          :display_name => "CDN Site URL",
          :description => "The CDN URL for site assets. Example: 'cdn.mwtactics.com/portal/cb1.2012.08.14' or 'cdn.mwtactics.com/portal_vs/staging'.",
          :required => "recommended",
          :default => "cdn.mwtactics.com/portal/cb1.2012.08.14",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/cdn_user_url",
          :display_name => "CDN User URL",
          :description => "The CDN URL for user assets (e.g. game team media). Example: 'cdn.mwtactics.com/portal' or 'cdn.mwtactics.com/portal_vs/staging'.",
          :required => "recommended",
          :default => "cdn.mwtactics.com/portal",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/cdn_asset_user_account",
          :display_name => "CDN Asset User Account",
          :description => "The CDN user account.  Example: 'cred:CDN_ASSET_USER'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/cdn_asset_user_password",
          :display_name => "CDN Asset User Password",
          :description => "The CDN user account password.  Example: 'cred:CDN_ASSET_PASSWORD'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/cdn_storage_fqdn",
          :display_name => "CDN Storage Fully Qualified Domain Name",
          :description => "The CDN storage fully qualified domain name.  Example: 'acronymgame.upload.akamai.com'.",
          :required => "recommended",
          :default => "acronymgame.upload.akamai.com",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/cdn_storage_user_account",
          :display_name => "CDN Storage User Account",
          :description => "The CDN storage user account.  Example: 'cred:CDN_STORAGE_USER'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/cdn_storage_user_password",
          :display_name => "CDN Storage User Password",
          :description => "The CDN storage user account password.  Example: 'cred:CDN_STORAGE_PASSWORD'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/cdn_storage_base_folder",
          :display_name => "CDN Storage Base Folder",
          :description => "The CDN storage asset folder.  Example: '/167367/portal' or '/167367/portal_vs/staging'.",
          :required => "recommended",
          :default => "/167367/portal",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/cdn_log_api_enabled",
          :display_name => "CDN Log API",
          :description => "Log the CDN API?  TRUE or FALSE.",
          :required => "recommended",
          :default => "FALSE",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_api_url",
          :display_name => "Playspan API URL Prefix",
          :description => "The Playspan API URL Prefix.  Example: 'mall2-api.playspan.com/ps-primary-api/store/' or 'demo1.playspan.com/ps-primary-api/store/' in dev.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_access_id",
          :display_name => "Playspan Access ID",
          :description => "The Playspan Access ID.  Example: 'cred:PLAYSPAN_ACCESS_ID_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_store_id",
          :display_name => "Playspan Store ID",
          :description => "The Playspan Store ID.  Example: 'cred:PLAYSPAN_STORE_ID_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_merchant_key",
          :display_name => "Playspan Merchant Key",
          :description => "The Playspan merchant key.  Example: 'cred:PLAYSPAN_MERCHANT_KEY_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_admin_password",
          :display_name => "Playspan Admin Password",
          :description => "The Playspan password.  Example: '' in Live or 'cred:PLAYSPAN_ADMIN_PASSWORD_DEV' in dev.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_upay_lightbox_enabled",
          :display_name => "Playspan Upay Lightbox Enabled",
          :description => "Enable Upay Lightbox?  TRUE or FALSE.",
          :required => "recommended",
          :default => "FALSE",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_login_id_prefix",
          :display_name => "Playspan Login ID Prefix",
          :description => "The prefix to apply to all login IDs.  Example: 'cred:PLAYSPAN_LOGIN_ID_PREFIX_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_catalog",
          :display_name => "Playspan Catalog ID",
          :description => "The Playspan catalog ID.  Example: 'cred:PLAYSPAN_CATALOG_ID_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_featured_sub",
          :display_name => "Playspan Featured Subscription",
          :description => "Playspan featured subscription.  Example: 'testsub001'",
          :required => "recommended",
          :default => "testsub001",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_product_subscription_id_1",
          :display_name => "Playspan Product Subscription ID 1",
          :description => "Playspan product subscription ID 1.  Example: 'testsub001' or 'premiumaccount1'.",
          :required => "recommended",
          :default => "testsub001",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_product_subscription_id_2",
          :display_name => "Playspan Product Subscription ID 2",
          :description => "Playspan product subscription ID 2.  Example: '' or 'premiumaccount2'.",
          :required => "recommended",
          :default => "",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_product_subscription_id_3",
          :display_name => "Playspan Product Subscription ID 3",
          :description => "Playspan product subscription ID 3.  Example: '' or 'premiumaccount3'.",
          :required => "recommended",
          :default => "",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_scrap_code",
          :display_name => "Playspan Scrap Code",
          :description => "The Playspan code for the 'Scrap' currency.  Example: 'XPTEE' or 'XPTS2' in dev.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_cbills_code",
          :display_name => "Playspan CBills Code",
          :description => "The Playspan code for the 'CBills' currency.  Example: 'XPTCB'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/google_analytics_account",
          :display_name => "Google Analytics Account",
          :description => "The Google Analytics Account ID. Example: 'cred:GOOGLE_ACCOUNT_ID_LIVE' or '' in dev.",
          :required => "recommended",
          :default => "",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/web_purify_key",
          :display_name => "Web Purify API Key",
          :description => "The key to use with Web Purify. Example: 'cred:WEB_PURIFY_KEY'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/zendesk_account_id",
          :display_name => "Zendesk Account ID",
          :description => "The Zendesk account ID to use. Example: 'cred:ZENDESK_ACCOUNT_ID_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/zendesk_user_account",
          :display_name => "Zendesk User Account",
          :description => "The Zendesk user to use. Example: 'cred:ZENDESK_USER_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/zendesk_user_password",
          :display_name => "Zendesk User Password",
          :description => "The Zendesk password to use. Example: 'cred:ZENDESK_PASSWORD_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/zendesk_field_id",
          :display_name => "Zendesk Field ID",
          :description => "The Zendesk field ID to use. Example: 'cred:ZENDESK_FIELD_ID_LIVE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/zendesk_field_id_for_portal_user",
          :display_name => "Zendesk Field ID For Portal User",
          :description => "The Zendesk field ID for portal user. Example: 'cred:ZENDESK_FIELD_ID_FOR_PORTAL_USER_LIVE' or '' in dev.",
          :required => "required",
          :recipes => ["mwt_portal::default"]
