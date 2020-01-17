# encoding: utf-8

control "V-54039" do
	title "Credentials stored and used by the DBMS to access remote databases or applications must be authorized and restricted to authorized users."
	desc "Credentials defined for access to remote databases or applications may provide unauthorized access to additional databases and applications to unauthorized or malicious users.false"
	impact 0.5
	tag "check": "Review the list of defined database links generated from the DBMS.

Compare to the list in the System Security Plan with the DBA.

If no database links are listed in the database and in the System Security Plan, this check is Not a Finding.

If any database links are defined in the DBMS, verify the authorization for the definition in the System Security Plan.

If any database links exist that are not authorized or not listed in the System Security Plan, this is a Finding."
	tag "fix": "Grant access to database links to authorized users or applications only.

Document all database links access authorizations in the System Security Plan."

	# Write Check Logic Here

end