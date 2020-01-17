# encoding: utf-8

control "V-53987" do
	title "Oracle roles granted using the WITH ADMIN OPTION must not be granted to unauthorized accounts."
	desc "The WITH ADMIN OPTION allows the grantee to grant a role to another database account. Best security practice restricts the privilege of assigning privileges to authorized personnel. Authorized personnel include DBA's, object owners, and, where designed and included in the application's functions, application administrators. Restricting privilege-granting functions to authorized accounts can help decrease mismanagement of privileges and wrongful assignments to unauthorized accounts.false"
	impact 0.5
	tag "check": "Run the SQL query:

select grantee||': '||granted_role from dba_role_privs
where grantee not in
(<list of non-applicable accounts>)
and admin_option = 'YES' 
and grantee not in
(select distinct owner from dba_objects)
and grantee not in
(select grantee from dba_role_privs
where granted_role = 'DBA')
order by grantee;

(With respect to the list of special accounts that are excluded from this requirement, it is expected that the DBA will maintain the list to suit local circumstances, adding special accounts as necessary and removing any that are not supposed to be in use in the Oracle deployment that is under review.)

Review the System Security Plan to confirm any grantees listed are ISSO-authorized DBA accounts or application administration roles.

If any grantees listed are not authorized and documented, this is a Finding."
	tag "fix": "Revoke assignment of roles with the WITH ADMIN OPTION from unauthorized grantees and re-grant them without the option if required.

From SQL*Plus:

revoke [role name] from [grantee];
grant [role name] to [grantee];

Restrict use of the WITH ADMIN OPTION to authorized administrators.

Document authorized role assignments with the WITH ADMIN OPTION in the System Security Plan."

	# Write Check Logic Here

end