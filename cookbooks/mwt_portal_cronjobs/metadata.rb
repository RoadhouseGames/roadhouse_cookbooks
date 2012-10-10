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

attribute "mwt_portal_cronjobs",
          :display_name => "MWT Portal Cronjob Settings",
          :type => "hash"

attribute "mwt_portal_cronjobs/remote_playspan_complete_pending_requests_interval",
          :display_name => "Remote Playspan Complete Pending Requests Interval",
          :description => "The time interval (in minutes) to execute the remote Playspan complete pending requests.  0 to disable.",
          :required => "recommended",
          :default => "5",
          :recipes => ["mwt_portal_cronjobs::default"]

attribute "mwt_portal_cronjobs/remote_user_log_cleanup_interval",
          :display_name => "Remote User Log Cleanup Interval",
          :description => "The time interval (in months) to execute the remote user log cleanup requests.  0 to disable.",
          :required => "recommended",
          :default => "1",
          :recipes => ["mwt_portal_cronjobs::default"]
