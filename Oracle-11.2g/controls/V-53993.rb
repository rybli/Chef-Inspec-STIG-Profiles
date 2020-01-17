# encoding: utf-8

control "V-53993" do
	title "Application role permissions must not be assigned to the Oracle PUBLIC role."
	desc "Application roles have been granted to PUBLIC. Permissions granted to PUBLIC are granted to all users of the database. Custom roles should be used to assign application permissions to functional groups of application users. The installation of Oracle does not assign role permissions to PUBLIC.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select granted_role from dba_role_privs where grantee = 'PUBLIC';

If any roles are listed, this is a Finding."
	tag "fix": "Revoke role grants from PUBLIC.

Do not assign role privileges to PUBLIC.

From SQL*Plus:

revoke [role name] from PUBLIC;"

	# Write Check Logic Here

end