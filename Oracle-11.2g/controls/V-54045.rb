# encoding: utf-8

control "V-54045" do
	title "Replication accounts must not be granted DBA privileges."
	desc "Replication accounts may be used to access databases defined for the replication architecture. An exploit of a replication on one database could lead to the compromise of any database participating in the replication that uses the same account name and credentials. If the replication account is compromised and it has DBA privileges, the database is at additional risk to unauthorized or malicious action.false"
	impact 0.5
	tag "check": "If a review of the System Security Plan confirms the use of replication is not required, not permitted and the database is not configured for replication, this check is Not a Finding.

If any replication accounts are assigned DBA roles or roles with DBA privileges, this is a Finding."
	tag "fix": "Restrict privileges assigned to replication accounts to the fewest possible privileges.

Remove DBA roles from replication accounts.

Create and use custom replication accounts assigned least privileges for supporting replication operations."

	# Write Check Logic Here

end