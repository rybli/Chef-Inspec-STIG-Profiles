# encoding: utf-8

control "V-92661" do
	title "The Apache web server must be configured to use a specified IP address and port."
	desc "The web server must be configured to listen on a specified IP address and port. Without specifying an IP address and port for the web server to use, the web server will listen on all IP addresses available to the hosting server. If the web server has multiple IP addresses, i.e., a management IP address, the web server will also accept connections on the management IP address.

Accessing the hosted application through an IP address normally used for non-application functions opens the possibility of user access to resources, utilities, files, ports, and protocols that are protected on the desired application IP address.

"
	impact 0.5
	tag "check": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Search for the 'Listen' directive:

# cat /<path_to_file>/httpd.conf | grep -i 'Listen'

Verify that any enabled 'Listen' directives specify both an IP address and port number.

If the 'Listen' directive is found with only an IP address or only a port number specified, this is finding.

If the IP address is all zeros (i.e., 0.0.0.0:80 or [::ffff:0.0.0.0]:80), this is a finding.

If the 'Listen' directive does not exist, this is a finding."
	tag "fix": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Set the 'Listen' directive to listen on a specific IP address and port.

Restart Apache: apachectl restart"

	# Write Check Logic Here
	describe apache_conf() do
		its('Listen') { should match /10\.247\.(0\.([1-9]|[1-9]\d|[12]\d\d)|([1-9]|[1-9]\d|[12]\d\d)\.([1-9]?\d|[12]\d\d)):(80|443)/ }
	end
end
