# encoding: utf-8

control "V-92597" do
	title "The Apache web server must limit the number of allowed simultaneous session requests."
	desc "Apache web server management includes the ability to control the number of users and user sessions that utilize an Apache web server. Limiting the number of allowed users and sessions per user is helpful in limiting risks related to several types of denial-of-service (DOS) attacks.

Although there is some latitude concerning the settings, they should follow DoD-recommended values and be configurable to allow for future DoD direction. While the DoD will specify recommended values, the values can be adjusted to accommodate the operational requirements of a given system.false"
	impact 0.5
	tag "check": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Search for the directives 'KeepAlive' and 'MaxKeepAliveRequests' in the 'httpd.conf' file:

# cat /<path_to_file>/httpd.conf | grep -i 'keepalive'

KeepAlive On
MaxKeepAliveRequests 100

If the value of 'KeepAlive' is set to 'off' or does not exist, this is a finding.

If the value of 'MaxKeepAliveRequests' is set to a value less than '100' or does not exist, this is a finding."
	tag "fix": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Set the 'KeepAlive' directive to a value of 'on'; add the directive if it does not exist.

Set the 'MaxKeepAliveRequests' directive to a value of '100' or greater; add the directive if it does not exist.

Restart Apache: apachectl restart"

	# Write Check Logic Here
	describe apache_conf do
		its('KeepAlive') { should eq 'On' }
		its('MaxKeepAliveRequests') { should eq '100' }
	end

end
