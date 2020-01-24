# encoding: utf-8

control "V-92655" do
	title "The Apache web server must allow the mappings to unused and vulnerable scripts to be removed."
	desc "Scripts allow server-side processing on behalf of the hosted application user or as processes needed in the implementation of hosted applications. Removing scripts not needed for application operation or deemed vulnerable helps to secure the web server.

To ensure scripts are not added to the web server and run maliciously, script mappings that are not needed or used by the web server for hosted application operation must be removed.false"
	impact 0.5
	tag "check": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Locate 'cgi-bin' files and directories enabled in the Apache configuration via 'Script', 'ScriptAlias' or 'ScriptAliasMatch', and 'ScriptInterpreterSource' directives:

# cat /<path_to_file>/httpd.conf | grep -i 'Script'

If any scripts are present that are not needed for application operation, this is a finding.

If this is not documented and approved by the Information System Security Officer (ISSO), this is a finding."
	tag "fix": "Determine the location of the 'HTTPD_ROOT' directory and the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Review 'Script', 'ScriptAlias' or 'ScriptAliasMatch', and 'ScriptInterpreterSource' directives.

Go into each directory and locate 'cgi-bin' files. Remove any script that is not needed for application operation.

Ensure this process is documented and approved by the ISSO."

	# Write Check Logic Here
	# Need to verify scripts called from directive folders.

end
