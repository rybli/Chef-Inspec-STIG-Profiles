# encoding: utf-8

control "V-53983" do
	title "System privileges granted using the WITH ADMIN OPTION must not be granted to unauthorized user accounts."
	desc "The WITH ADMIN OPTION allows the grantee to grant a privilege to another database account. Best security practice restricts the privilege of assigning privileges to authorized personnel. Authorized personnel include DBAs, object owners, and, where designed and included in the application's functions, application administrators. Restricting privilege-granting functions to authorized accounts can help decrease mismanagement of privileges and wrongful assignments to unauthorized accounts.false"
	impact 0.5
	tag "check": "Run the SQL query:

select grantee, privilege from dba_sys_privs
where grantee not in
(<list of non-applicable accounts>)
and admin_option = 'YES'
and grantee not in
(select grantee from dba_role_privs where granted_role = 'DBA');

(With respect to the list of special accounts that are excluded from this requirement, it is expected that the DBA will maintain the list to suit local circumstances, adding special accounts as necessary and removing any that are not supposed to be in use in the Oracle deployment that is under review.)

If any accounts that are not authorized to have the ADMIN OPTION are listed, this is a Finding."
	tag "fix": "Revoke assignment of privileges with the WITH ADMIN OPTION from unauthorized users and re-grant them without the option.

From SQL*Plus:

revoke [privilege name] from user [username];

Replace [privilege name] with the named privilege and [username] with the named user.

Restrict use of the WITH ADMIN OPTION to authorized administrators.

Document authorized privilege assignments with the WITH ADMIN OPTION in the System Security Plan."

	# Write Check Logic Here

end