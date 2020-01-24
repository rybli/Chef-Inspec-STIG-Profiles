# encoding: utf-8

control "V-92711" do
	title "The Apache web server must be configured to immediately disconnect or disable remote access to the hosted applications."
	desc "During an attack on the Apache web server or any of the hosted applications, the System Administrator (SA) may need to disconnect or disable access by users to stop the attack.

The Apache web server must be configured to disconnect users from a hosted application without compromising other hosted applications unless deemed necessary to stop the attack. Methods to disconnect or disable connections are to stop the application service for a specified hosted application, stop the Apache web server, or block all connections through the Apache web server access list.

The Apache web server capabilities used to disconnect or disable users from connecting to hosted applications and the Apache web server must be documented to make certain that, during an attack, the proper action is taken to conserve connectivity to any other hosted application if possible and to make certain log data is conserved for later forensic analysis.false"
	impact 0.5
	tag "check": "Interview the SA and Web Manager.

Ask for documentation for the Apache web server administration.

Verify there are documented procedures for shutting down an Apache website in the event of an attack. The procedure should, at a minimum, provide the following steps:

Determine the respective website for the application at risk of an attack.

Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

In a command line, enter the following command:

'kill -TERM `cat <'INSTALLED PATH'>/logs/httpd.pid`'

If the web server is not capable of or cannot be configured to disconnect or disable remote access to the hosted applications when necessary, this is a finding."
	tag "fix": "Prepare documented procedures for shutting down an Apache website in the event of an attack.

The procedure should, at a minimum, provide the following steps:

In a command line, enter the following command:

'kill -TERM `cat <'INSTALLED PATH'>/logs/httpd.pid`'"

	# Write Check Logic Here

end