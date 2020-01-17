# encoding: utf-8

control "V-54019" do
	title "DBMS production application and data directories must be protected from developers on shared production/development DBMS host systems."
	desc "Developer roles should not be assigned DBMS administrative privileges to production DBMS application and data directories. The separation of production DBA and developer roles helps protect the production system from unauthorized, malicious or unintentional interruption due to development activities.false"
	impact 0.5
	tag "check": "If the DBMS or DBMS host is not shared by production and development activities, this check is Not a Finding.

Review OS DBA group membership.

If any developer accounts as identified in the System Security Plan have been assigned DBA privileges, this is a Finding.

NOTE: Though shared production/non-production DBMS installations was allowed under previous database STIG guidance, doing so may place it in violation of OS, Application, Network or Enclave STIG guidance. Ensure that any shared production/non-production DBMS installations meets STIG guidance requirements at all levels or mitigate any conflicts in STIG guidance with your DAA."
	tag "fix": "Create separate DBMS host OS groups for developer and production DBAs.

Do not assign production DBA OS group membership to accounts used for development.

Remove development accounts from production DBA OS group membership.

Recommend establishing a dedicated DBMS host for production DBMS installations (See Checks O112-BP-025000 and O112-BP-025300). A dedicated host system in this case refers to an instance of the operating system at a minimum. The operating system may reside on a virtual host machine where supported by the DBMS vendor."

	# Write Check Logic Here

end