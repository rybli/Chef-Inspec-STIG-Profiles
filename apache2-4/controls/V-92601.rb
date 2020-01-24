# encoding: utf-8

control "V-92601" do
	title "The Apache web server must use cryptography to protect the integrity of remote sessions."
	desc "Data exchanged between the user and the Apache web server can range from static display data to credentials used to log on to the hosted application. Even when data appears to be static, the non-displayed logic in a web page may expose business logic or trusted system relationships. The integrity of all the data being exchanged between the user and the Apache web server must always be trusted. To protect the integrity and trust, encryption methods should be used to protect the complete communication session.

"
	impact 0.5
	tag "check": "In a command line, run 'httpd -M | grep -i ssl_module'.

If the 'ssl_module' is not found, this is a finding.

Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Search for the 'SSLCACertificateFile' directive:

# cat /<path_to_file>/httpd.conf | grep -i 'SSLCACertificateFile'

Review the path of the 'SSLCACertificateFile' directive.

Review the contents of <'path of SSLCACertificateFile'>\ca-bundle.crt.

Examine the contents of this file to determine if the trusted CAs are DoD approved.

If the trusted CA that is used to authenticate users to the website does not lead to an approved DoD CA, this is a finding.

NOTE: There are non-DoD roots that must be on the server for it to function. Some applications, such as antivirus programs, require root CAs to function. DoD-approved certificate can include the External Certificate Authorities (ECA) if approved by the AO. The PKE InstallRoot 3.06 System Administrator Guide (SAG), dated 08 Jul 2008, contains a complete list of DoD, ECA, and IECA CAs."
	tag "fix": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Ensure the 'SSLProtocol' is added and looks like the following:

SSLProtocol -ALL +TLSv1.2

Restart Apache: apachectl restart"

	# Write Check Logic Here
	describe command('httpd -M | grep -i "ssl_module"') do
		its('stdout') { should eq ' ssl_module (shared)' }
	end
	# Find Certbundle and then determine if trusted CA or DoD approved.
	describe command('grep -i "SSLCACertificateFile" /etc/httpd/conf/*.conf /etc/httpd/conf.d/*.conf') do
		its('exit_status') { should eq 0 }
	end

end
