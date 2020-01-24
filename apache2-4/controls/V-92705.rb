# encoding: utf-8

control "V-92705" do
	title "The Apache web server must set an inactive timeout for sessions."
	desc "Leaving sessions open indefinitely is a major security risk. An attacker can easily use an already authenticated session to access the hosted application as the previously authenticated user. By closing sessions after a set period of inactivity, the Apache web server can make certain that those sessions that are not closed through the user logging out of an application are eventually closed.

Acceptable values are 5 minutes for high-value applications, 10 minutes for medium-value applications, and 20 minutes for low-value applications.false"
	impact 0.5
	tag "check": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Verify the 'reqtimeout_module' is loaded:

# cat /<path_to_file>/httpd.conf | grep -i 'reqtimeout_module'

If the 'reqtimeout_module' is not loaded, this is a finding.

Verify the 'RequestReadTimeout' directive is configured.

If the 'reqtimeout_module' is loaded and the 'RequestReadTimeout' directive is not configured, this is a finding."
	tag "fix": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Load the 'reqtimeout_module'.

Set the 'RequestReadTimeout' directive."

	# Write Check Logic Here
	describe command('httpd -M | grep -i "reqtimeout_module"') do
		its('stdout') { should eq ' reqtimeout_module (shared)'}
	end
	describe apache_conf() do
		its('RequestReadTimeout') { should_not eq '' }
	end

end
