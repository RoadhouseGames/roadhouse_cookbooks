maintainer       "Roadhouse Interactive and Infinite Game Publishing"
maintainer_email "george@roadhouseinteractive.com"
license          "All rights reserved"
description      "Configures MWT web portal remote recipes via cron"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

supports "centos", "~> 5.8"

depends "rightscale"

recipe "mwt_portal_cronjobs::default", "Configures recipes to be remotely executed on an app array.  These jobs are scheduled via cron."
recipe "mwt_portal_cronjobs::remote_playspan_complete_pending_requests", "Remotely execute the Playspan complete pending requests recipe."
recipe "mwt_portal_cronjobs::remote_user_grant_watchdog", "Remotely execute the user grant watchdog recipe."
recipe "mwt_portal_cronjobs::remote_user_log_cleanup", "Remotely execute the user log cleanup recipe."
