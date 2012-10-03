maintainer       "Roadhouse Interactive and Infinite Game Publishing"
maintainer_email "george@roadhouseinteractive.com"
license          "All rights reserved"
description      "Configures mwt web portal"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

supports "centos", "~> 5.8"

depends "rightscale"

recipe "mwt_portal::default", "Configures the MWT web portal."

attribute "mwt_portal",
          :display_name => "MWT Portal Settings",
          :type => "hash"

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
          :display_name => "Game Port",
          :description => "The game server port. Example: '80' or '8000'.",
          :required => "recommended",
          :default => "80",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/game_client_url",
          :display_name => "Game Client URL",
          :description => "The URL where the game client lives.  Example 'http://cdn.mwtactics.com/game_staging/client/b285/unity/MechWarriorTactics/MechWarriorTactics.unity3d'.",
          :required => "recommended",
          :default => "http://cdn.mwtactics.com/game_staging/client/b285/unity/MechWarriorTactics/MechWarriorTactics.unity3d",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/game_require_beta_key",
          :display_name => "Game Requires Beta Key",
          :description => "Does the game require a beta key to launch?  TRUE or FALSE.",
          :required => "recommended",
          :default => "FALSE",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/game_shared_secret",
          :display_name => "Game Shared Secret",
          :description => "A secret key that the portal passes to the game server for validation.  Example 'cred:GAME_SECRET_KEY'.",
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

attribute "mwt_portal/email_smtp_user",
          :display_name => "EMail SMTP Account",
          :description => "The SMTP account for the portal.  Example 'cred:EMAIL_SMTP_USER'",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/email_smtp_password",
          :display_name => "EMail SMTP Password",
          :description => "The SMTP password for the portal.  Example 'cred:EMAIL_SMTP_PASSWORD'",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/mail_chimp_key",
          :display_name => "Mail Chimp Key",
          :description => "The Mail Chimp API Key.  Example: 'cred:MAILCHIMP_KEY'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/mail_chimp_reg_id",
          :display_name => "Mail Chimp Registration List ID",
          :description => "The Mail Chimp Registration List ID.  Example: 'cred:MAILCHIMP_REG_ID'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/mail_chimp_news_id",
          :display_name => "Mail Chimp Newsletter List ID",
          :description => "The Mail Chimp Newsletter List ID.  Example: 'cred:MAILCHIMP_NEWS_ID'.",
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

attribute "mwt_portal/cdn_asset_fqdn",
          :display_name => "CDN Asset Fully Qualified Domain Name",
          :description => "The CDN host fully qualified domain name. Example: 'cdn.mwtactics.com'.",
          :required => "recommended",
          :default => "cdn.mwtactics.com",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/cdn_asset_fqdn_secure",
          :display_name => "CDN Asset Secure HTTP Fully Qualified Domain Name",
          :description => "The CDN host fully qualified domain name. Example: 'securecdn.mwtactics.com'.",
          :required => "recommended",
          :default => "securecdn.mwtactics.com",
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

attribute "mwt_portal/cdn_asset_base_folder",
          :display_name => "CDN Asset Base Folder",
          :description => "The CDN asset folder.  This is combined to create the CDN download URL.  Example: '/portal_vs/mwt'.",
          :required => "recommended",
          :default => "/portal_vs/mwt",
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
          :description => "The CDN storage asset folder.  Example: '/167367/portal_vs/mwt'.",
          :required => "recommended",
          :default => "/167367/portal_vs/mwt",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_access_id",
          :display_name => "Playspan Access ID",
          :description => "The Playspan Access ID.  Example: 'cred:PLAYSPAN_ACCESS_ID'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_store_id",
          :display_name => "Playspan Store ID",
          :description => "The Playspan Store ID.  Example: 'cred:PLAYSPAN_STORE_ID'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_merchant_key",
          :display_name => "Playspan Merchant Key",
          :description => "The Playspan merchant key.  Example: 'cred:PLAYSPAN_MERCHANT_KEY'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_password",
          :display_name => "Playspan Password",
          :description => "The Playspan password.  Example: 'cred:PLAYSPAN_PASSWORD'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_user_account_prefix",
          :display_name => "Playspan User Account Prefix",
          :description => "The prefix to apply to all user login IDs.  Example: 'cred:PLAYSPAN_ACCOUNT_PREFIX'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_catalog",
          :display_name => "Playspan Catalog ID",
          :description => "The Playspan catalog ID.  Example: 'cred:PLAYSPAN_CATALOG_ID'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_upay_lightbox",
          :display_name => "Playspan Enable UPay Lightbox",
          :description => "Enable Playspan upay lightbox.  TRUE or FALSE.",
          :required => "recommended",
          :default => "TRUE",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_featured_sub",
          :display_name => "Playspan Featured Subscription",
          :description => "Playspan featured subscription.  Example: 'testsub001'",
          :required => "recommended",
          :default => "testsub001",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_product_id_prefix",
          :display_name => "Playspan Product ID",
          :description => "Playspan product ID prefix.  Example: 'premiumaccount' where you want values premiumaccount1 to premiumaccount3.",
          :required => "recommended",
          :default => "premiumaccount",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_scrap_code",
          :display_name => "Playspan Scrap Code",
          :description => "The Playspan code for the 'Scrap' currency.  Example: 'cred:PLAYSPAN_SCRAP_CODE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/playspan_cbills_code",
          :display_name => "Playspan CBills Code",
          :description => "The Playspan code for the 'CBills' currency.  Example: 'cred:PLAYSPAN_CBILLS_CODE'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/google_analytics_account",
          :display_name => "Google Analytics Account",
          :description => "The Google Analytics Account ID. Example: '' in Dev or 'UA-28605391-1' in Live.",
          :required => "recommended",
          :default => "UA-28605391-1",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/web_purify_key",
          :display_name => "Web Purify API Key",
          :description => "The key to use with Web Purify. Example: 'cred:WEB_PURIFY_KEY'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/zendesk_account_id",
          :display_name => "Zendesk Account ID",
          :description => "The Zendesk account ID to use. Example: 'cred:ZENDESK_ACCOUNT_ID'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/zendesk_user_account",
          :display_name => "Zendesk User Account",
          :description => "The Zendesk user to use. Example: 'cred:ZENDESK_USER'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/zendesk_user_password",
          :display_name => "Zendesk User Password",
          :description => "The Zendesk password to use. Example: 'cred:ZENDESK_PASSWORD'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]

attribute "mwt_portal/zendesk_field_id",
          :display_name => "Zendesk Field ID",
          :description => "The Zendesk field ID to use. Example: 'cred:ZENDESK_FIELD_ID'.",
          :required => "required",
          :recipes => ["mwt_portal::default"]
