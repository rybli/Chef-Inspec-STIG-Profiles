# encoding: utf-8

control "V-52445" do
	title "The DBMS software libraries must be periodically backed up."
	desc "Information system backup is a critical step in maintaining data assurance and availability.

System-level information includes:  system-state information, operating system and application software, and licenses.

Backups shall be consistent with organizational recovery time and recovery point objectives.

The DBMS application depends upon the availability and integrity of its software libraries. Without backups, compromise or loss of the software libraries can prevent a successful recovery of DBMS operations.false"
	impact 0.5
	tag "check": "Review evidence of inclusion of the DBMS libraries in current backup records. If any DBMS library files are not included in regular backups, this is a finding."
	tag "fix": "Configure backups to include all DBMS application and third-party database application software libraries."

	# Write Check Logic Here

end