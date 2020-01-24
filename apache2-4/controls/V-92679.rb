# encoding: utf-8

control "V-92679" do
	title "Cookies exchanged between the Apache web server and client, such as session cookies, must have security settings that disallow cookie access outside the originating Apache web server and hosted application."
	desc "Cookies are used to exchange data between the web server and the client. Cookies, such as a session cookie, may contain session information and user credentials used to maintain a persistent connection between the user and the hosted application since HTTP/HTTPS is a stateless protocol.

When the cookie parameters are not set properly (i.e., domain and path parameters), cookies can be shared within hosted applications residing on the same web server or to applications hosted on different web servers residing on the same domain.false"
	impact 0.5
	tag "check": "Review the web server documentation and configuration to determine if cookies between the web server and client are accessible by applications or web servers other than the originating pair.

grep SessionCookieName <'INSTALL LOCATION'>/mod_session.conf

Confirm that the 'HttpOnly' and 'Secure' settings are present in the line returned.

Confirm that the line does not contain the 'Domain' cookie setting.

Verify the 'headers_module (shared)' module is loaded in the web server:

'# httpd -M
Verify ' headers_module (shared)' is returned in the list of Loaded Modules from the above command.'

If the 'headers_module (shared)' is not loaded, this is a finding.
"
	tag "fix": "Edit the 'mod_session.conf' file and find the 'SessionCookieName' directive.

Set the 'SessionCookieName' to 'session path=/; HttpOnly; Secure; '

Example:

SessionCookieName session path=/; HttpOnly; Secure;

Restart Apache: apachectl restart"

	# Write Check Logic Here
	describe apache_conf() do
		its('SessionCookieName') { should include 'HttpOnly', 'Secure' }
		its('SessionCookieName') { should_not include 'Domain' }
	end
	describe command('httpd -M | grep -i "headers_module"' ) do
		its('stdout') { should eq ' headers_module (shared)' }
	end

end
