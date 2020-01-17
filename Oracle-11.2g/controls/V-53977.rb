# encoding: utf-8

control "V-53977" do
	title "The Oracle REMOTE_OS_ROLES parameter must be set to FALSE."
	desc "Setting REMOTE_OS_ROLES to TRUE allows operating system groups to control Oracle roles. The default value of FALSE causes roles to be identified and managed by the database. If REMOTE_OS_ROLES is set to TRUE, a remote user could impersonate another operating system user over a network connection.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select value from v$parameter where name = 'remote_os_roles';

If the returned value is not FALSE or not documented in the System Security Plan as required, this is a Finding."
	tag "fix": "Document remote OS roles in the System Security Plan.

If not required, disable use of remote OS roles.

From SQL*Plus:

alter system set remote_os_roles = FALSE scope = spfile;

The above SQL*Plus command will set the parameter to take effect at next system startup."

	# Write Check Logic Here

end