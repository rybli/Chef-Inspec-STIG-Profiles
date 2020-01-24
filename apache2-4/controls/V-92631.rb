# encoding: utf-8

control "V-92631" do
	title "The log information from the Apache web server must be protected from unauthorized modification or deletion."
	desc "Log data is essential in the investigation of events. If log data were to become compromised, competent forensic analysis and discovery of the true source of potentially malicious system activity would be difficult, if not impossible, to achieve. In addition, access to log records provides information an attacker could potentially use to their advantage since each event record might contain communication ports, protocols, services, trust relationships, user names, etc.

The web server must protect the log data from unauthorized read, write, copy, etc. This can be done by the web server if the web server is also doing the logging function. The web server may also use an external log system. In either case, the logs must be protected from access by non-privileged users.

"
	impact 0.5
	tag "check": "Verify the log information from the web server must be protected from unauthorized modification.

Review the web server documentation and deployed configuration settings to determine if the web server logging features protect log information from unauthorized modification.
 
Review file system settings to verify the log files have secure file permissions. Run the following command:
 
ls -l <'INSTALL PATH'>/logs
 
If the web server log files present are owned by anyone other than an administrative service account this is a finding."
	tag "fix": "Determine the location of the 'ErrorLog' directory in the 'httpd.conf' file:

# httpd -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT='/etc/httpd'
-D SERVER_CONFIG_FILE='conf/httpd.conf'

Open the 'httpd.conf' file.

Look for the 'ErrorLog' directive.

Ensure the permissions and ownership of all files in the Apache log directory are correct by executing the following commands as an administrative service account:
 
# chown <'service account'> <'ErrorLog directive PATH'>/*"

	# Write Check Logic Here

end