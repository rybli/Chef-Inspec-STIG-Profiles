# encoding: utf-8

control "V-52389" do
	title "All use of privileged accounts must be audited."
	desc "This is intended to limit exposure, by making it possible to trace any unauthorized access, by a privileged user account or role that has permissions on security functions or security-relevant information, to other data or functionality.false"
	impact 0.5
	tag "check": "Review auditing configuration. If it is possible for a privileged user/role to access non-security functions or information, without having the action recorded in the audit log, this is a finding."
	tag "fix": "Configure DBMS auditing so that all use of privileged accounts is recorded in the audit log."

	# Write Check Logic Here

end