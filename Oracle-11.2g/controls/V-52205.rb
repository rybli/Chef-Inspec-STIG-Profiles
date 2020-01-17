# encoding: utf-8

control "V-52205" do
	title "The DBMS must support the requirement to back up audit data and records onto a different system or media than the system being audited on an organization-defined frequency."
	desc "Protection of log data includes assuring log data is not accidentally lost or deleted. Backing up audit records to a different system or onto media separate from the system being audited on an organizational-defined frequency helps to assure, in the event of a catastrophic system failure, the audit records will be retained.false"
	impact 0.5
	tag "check": "Check with the database administrator, storage administrator or system administrator, as applicable at the site, to verify that Oracle is configured EITHER to perform backups of the audit data specifically, OR, with appropriate permissions granted, to permit a third-party tool to do so.  Test the backup process.  Test the restore process (using a non-production system as the target).  

If Oracle is not so configured, this is a finding.  If the test run of the backup and restore fails, this is a finding."
	tag "fix": "Utilize DBMS features or other software that supports the ability to back up audit data and records onto a system or media different from the system being audited on an organization-defined frequency.

EITHER use Oracle features (such as Backup or Data Pump) to perform backups of the audit data specifically, OR grant appropriate permissions to permit a third-party tool to do so."

	# Write Check Logic Here

end