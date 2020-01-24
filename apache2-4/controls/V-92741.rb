# encoding: utf-8

control "V-92741" do
	title "Cookies exchanged between the Apache web server and the client, such as session cookies, must have cookie properties set to prohibit client-side scripts from reading the cookie data."
	desc "A cookie can be read by client-side scripts easily if cookie properties are not set properly. By allowing cookies to be read by the client-side scripts, information such as session identifiers could be compromised and used by an attacker who intercepts the cookie. Setting cookie properties (i.e., HttpOnly property) to disallow client-side scripts from reading cookies better protects the information inside the cookie.

"
	impact 0.5
	tag "check": "In a command line, run 'httpd -M | grep -i session_cookie_module'.

Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Search for the directive 'Session' in the 'httpd.conf' file:

# cat /<path_to_file>/httpd.conf | grep -i 'Session'

If the 'Session' and 'SessionCookieName' directives are not present, this is a finding.

If 'Session' is not set to 'on' and 'SessionCookieName' does not contain 'httpOnly' and 'secure', this is a finding."
	tag "fix": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Set 'Session' to 'on'.

Ensure the 'SessionCookieName' directive includes 'httpOnly' and 'secure'."

	# Write Check Logic Here
	describe command('httpd -M | grep -i "session_cookie_module"') do
		its('stdout') { should eq ' session_cookie_module (shared)'}
	end
	describe apache_conf() do
		its('Session') { should eq 'On' }
		its('SessionCookieName') { should include 'HttpOnly', 'Secure' }
	end

end
