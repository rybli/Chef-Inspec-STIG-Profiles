# encoding: utf-8

control "V-53975" do
	title "The Oracle REMOTE_OS_AUTHENT parameter must be set to FALSE."
	desc "Setting this value to TRUE allows operating system authentication over an unsecured connection. Trusting remote operating systems can allow a user to impersonate another operating system user and connect to the database without having to supply a password. If REMOTE_OS_AUTHENT is set to true, the only information a remote user needs to connect to the database is the name of any user whose account is setup to be authenticated by the operating system.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select value from v$parameter where name = 'remote_os_authent';

If the value returned does not equal FALSE, this is a Finding."
	tag "fix": "Document remote OS authentication in the System Security Plan.

If not required or not mitigated to an acceptable level, disable remote OS authentication.

From SQL*Plus:

alter system set remote_os_authent = FALSE scope = spfile;

The above SQL*Plus command will set the parameter to take effect at next system startup."

	# Write Check Logic Here

end