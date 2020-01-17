# encoding: utf-8

control "V-54079" do
	title "The DBMS host platform and other dependent applications must be configured in compliance with applicable STIG requirements."
	desc "The security of the data stored in the DBMS is also vulnerable to attacks against the host platform, calling applications, and other application or optional components.false"
	impact 0.5
	tag "check": "If the DBMS host being reviewed is not a production DBMS host, this check is Not a Finding.

Review evidence of security hardening and auditing of the DBMS host platform with the IAO.

If the DBMS host platform has not been hardened and received a security audit, this is a Finding.

Review evidence of security hardening and auditing for all application(s) that store data in the database and all other separately configured components that access the database including web servers, application servers, report servers, etc.

If any have not been hardened and received a security audit, this is a Finding.

Review evidence of security hardening and auditing for all application(s) installed on the local DBMS host where security hardening and auditing guidance exists.

If any have not been hardened and received a security audit, this is a Finding."
	tag "fix": "Configure all related application components and the DBMS host platform in accordance with the applicable DoD STIG.

Regularly audit the security configuration of related applications and the host platform to confirm continued compliance with security requirements."

	# Write Check Logic Here

end