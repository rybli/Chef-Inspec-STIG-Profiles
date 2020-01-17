# encoding: utf-8

control "V-53985" do
	title "System Privileges must not be granted to PUBLIC."
	desc "System privileges can be granted to users and roles and to the user group PUBLIC. All privileges granted to PUBLIC are accessible to every user in the database. Many of these privileges convey considerable authority over the database and are granted only to those persons responsible for administering the database. In general, these privileges should be granted to roles and then the appropriate roles should be granted to users. System privileges should never be granted to PUBLIC as this could allow users to compromise the database.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select privilege from dba_sys_privs where grantee = 'PUBLIC';

If any records are returned, this is a Finding."
	tag "fix": "Revoke any system privileges assigned to PUBLIC:

From SQL*Plus:

revoke [system privilege] from PUBLIC;

Replace [system privilege] with the named system privilege.

NOTE:  System privileges are not granted to PUBLIC by default and would indicate a custom action."

	# Write Check Logic Here

end