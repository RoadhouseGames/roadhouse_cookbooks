maintainer       "Roadhouse Interactive and Infinite Game Publishing"
maintainer_email "dgagnon@roadhouseinteractive.com"
license          "All rights reserved"
description      "Installs/Configures app_jabber"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "app"
depends "db"
depends "rightscale"

recipe "app_jabber::default", "Installs the Jabber chat server."

attribute "app_jabber",
          :display_name => "Jabber Chat Server Settings",
          :type => "hash"

attribute "app_jabber/db_fqdn",
          :display_name => "Database Full Qualified Domain Name",
          :description => "The domain name of the database server. Example: jabber-db.mywebsite.com",
          :required => "required",
          :recipes => ["app_jabber::default"]

attribute "app_jabber/db_username",
          :display_name => "Database User Name",
          :description => "The user account to use when connecting to the database",
          :required => "required",
          :recipes => ["app_jabber::default"]

attribute "app_jabber/db_password",
          :display_name => "Database User Password",
          :description => "The password for the specified account to use when connecting to the database",
          :required => "required",
          :recipes => ["app_jabber::default"]

attribute "app_jabber/db_schema_name",
          :display_name => "Database Schema Name",
          :description => "Enter the name of the MySQL database schema to which applications will connect to.  The database schema should have been created when the initial database was first set up.  This input will be used to set the application server's database configuration file so that applications can connect to the correct schema within the database.  This input is also used for MySQL dump backups in order to determine which schema will be backed up.  Example: ejabberd",
          :required => "recommended",
          :recipes => ["app_jabber::default"],
          :default => "ejabberd"

attribute "app_jabber/host_name",
          :display_name => "Jabber Host Name",
          :description => "The host name served by the jabber server. Example: jabber.mywebsite.com",
          :required => "required",
          :recipes => ["app_jabber::default"]
