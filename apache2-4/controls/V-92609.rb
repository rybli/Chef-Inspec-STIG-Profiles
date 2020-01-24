# encoding: utf-8

control "V-92609" do
	title "The Apache web server must generate, at a minimum, log records for system startup and shutdown, system access, and system authentication events."
	desc "Log records can be generated from various components within the Apache web server (e.g., httpd, plug-ins to external backends, etc.). From a web server perspective, certain specific Apache web server functionalities may be logged as well. The Apache web server must allow the definition of what events are to be logged. As conditions change, the number and types of events to be logged may change, and the Apache web server must be able to facilitate these changes.

The minimum list of logged events should be those pertaining to system startup and shutdown, system access, and system authentication events. If these events are not logged at a minimum, any type of forensic investigation would be missing pertinent information needed to replay what occurred.

"
	impact 0.5
	tag "check": "In a command line, run 'httpd -M | grep -i log_config_module'. 

If the 'log_config_module' is not enabled, this is a finding.

Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Search for the directive 'LogFormat' in the 'httpd.conf' file:

# cat /<path_to_file>/httpd.conf | grep -i 'LogFormat'

If the 'LogFormat' directive is missing, this is a finding:

An example is:
LogFormat '%a %A %h %H %l %m %s %t %u %U \'%{Referer}i\' ' common
"
	tag "fix": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Uncomment the 'log_config_module' module line.

Configure the 'LogFormat' in the 'httpd.conf' file to look like the following:

LogFormat '%a %A %h %H %l %m %s %t %u %U \'%{Referer}i\' ' common

Restart Apache: apachectl restart

NOTE: Your log format may be using different variables based on your environment, however  it should be verified to be producing the same end result of logged elements."

	# Write Check Logic Here

end