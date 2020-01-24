# encoding: utf-8

control "V-92689" do
	title "The Apache web server must generate a session ID using as much of the character set as possible to reduce the risk of brute force."
	desc "Generating a session identifier (ID) that is not easily guessed through brute force is essential to deter several types of session attacks. By knowing the session ID, an attacker can hijack a user session that has already been user-authenticated by the hosted application. The attacker does not need to guess user identifiers and passwords or have a secure token since the user session has already been authenticated.

By generating session IDs that contain as much of the character set as possible, i.e., A-Z, a-z, and 0-9, the session ID becomes exponentially harder to guess.

"
	impact 0.5
	tag "check": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Verify the 'unique_id_module' is loaded:

run httpd -M | grep unique_id
If no unique_id is returned, open finding.
"
	tag "fix": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Load the 'unique_id_module'.

Example: LoadModule unique_id_module modules/mod_unique_id.so

Restart Apache: apachectl restart"

	# Write Check Logic Here
	describe command('httpd -M | grep -i "unique_id_module"') do
		its('stdout') { should eq ' unique_id_module (shared)' }
	end

end
