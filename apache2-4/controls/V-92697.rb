# encoding: utf-8

control "V-92697" do
	title "The Apache web server must be tuned to handle the operational requirements of the hosted application."
	desc "A denial of service (DoS) can occur when the Apache web server is so overwhelmed that it can no longer respond to additional requests. A web server not properly tuned may become overwhelmed and cause a DoS condition even with expected traffic from users. To avoid a DoS, the Apache web server must be tuned to handle the expected traffic for the hosted applications.

"
	impact 0.5
	tag "check": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Verify that the 'Timeout' directive is specified to have a value of '10' seconds or less.

# cat /<path_to_file>/httpd.conf | grep -i 'Timeout'

If the 'Timeout' directive is not configured or is set for more than '10' seconds, this is a finding."
	tag "fix": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Add or modify the 'Timeout' directive to have a value of '10' seconds or less:

'Timeout 10'"

	# Write Check Logic Here
	describe apache_conf() do
		its('Timeout') { should cmp <= '10' }
	end

end
