# encoding: utf-8

control "V-53971" do
	title "The Oracle WITH GRANT OPTION privilege must not be granted to non-DBA or non-Application administrator user accounts."
	desc "An account permission to grant privileges within the database is an administrative function. Minimizing the number and privileges of administrative accounts reduces the chances of privileged account exploitation. Application user accounts should never require WITH GRANT OPTION privileges since, by definition, they require only privileges to execute procedures or view / edit data.false"
	impact 0.5
	tag "check": "Execute the query:

select grantee||': '||owner||'.'||table_name
from dba_tab_privs 
where grantable = 'YES' 
and grantee not in (select distinct owner from dba_objects)
and grantee not in (select grantee from dba_role_privs where granted_role = 'DBA')
order by grantee;

If any accounts are listed, this is a finding."
	tag "fix": "Revoke privileges granted the WITH GRANT OPTION from non-DBA and accounts that do not own application objects.

Re-grant privileges without specifying WITH GRANT OPTION."

	# Write Check Logic Here

end