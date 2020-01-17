# encoding: utf-8

control "V-52433" do
	title "The DBMS must provide the ability to write specified audit record content to a centralized audit log repository."
	desc "Information system auditing capability is critical for accurate forensic analysis. Audit record content that may be necessary to satisfy the requirement of this control includes but is not limited:  timestamps, source and destination IP addresses, user/process identifiers, event descriptions, application specific events, success/fail indications, file names involved, access control or flow control rules invoked. 

Centralized management of audit records and logs provides for efficiency in maintenance and management of records, as well as, the backup and archiving of those records. When organizations define application components requiring centralized audit log management, applications need to support that requirement.

Database audit records not stored in a centralized audit log management tool may be overlooked during investigation of a security incident or may be subject to intentional or accidental manipulation by privileged users of the database.false"
	impact 0.5
	tag "check": "If the organization does not require the use of a centralized audit log repository, this is not a finding.

If the organization requires the use of a centralized audit log repository, continue.

Check that Oracle PL/SQL code or other software is in place to copy or transfer the specified audit record content to a centralized audit log repository.  If it is not, this is a finding.

Check that permissions are set on the Oracle audit trail tables and on the target repository, to enable the required transfer of audit data.  If they are not, this is a finding.

Verify that the specified audit record content is indeed copied or transferred to the central repository.  If it is not, this is a finding."
	tag "fix": "If the organization requires the use of a centralized audit log repository, employ PL/SQL code or other software to copy or transfer the specified audit record content to the repository.

Ensure that permissions are set to enable transfer of the data.

If, after the preceding steps, the transfer is not succeeding, diagnose and repair the problem.

For more information on the configuration of auditing, please refer to "Auditing Database Activity" in the Oracle Database 2 Day + Security Guide:
http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_auditing.htm
and "Verifying Security Access with Auditing" in the Oracle Database Security Guide:  http://docs.oracle.com/cd/E11882_01/network.112/e36292/auditing.htm#DBSEG006
and "27 DBMS_AUDIT_MGMT" in the Oracle Database PL/SQL Packages and Types Reference:
http://docs.oracle.com/cd/E11882_01/appdev.112/e40758/d_audit_mgmt.htm"

	# Write Check Logic Here

end