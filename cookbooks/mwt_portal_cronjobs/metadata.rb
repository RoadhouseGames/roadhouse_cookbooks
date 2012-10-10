maintainer       "Roadhouse Interactive and Infinite Game Publishing"
maintainer_email "george@roadhouseinteractive.com"
license          "All rights reserved"
description      "Configures mwt web portal cron jobs"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

supports "centos", "~> 5.8"

depends "rightscale"

recipe "mwt_portal_cronjobs::default", "Runs recipes on remote app servers.  These jobs are scheduled via cron."

