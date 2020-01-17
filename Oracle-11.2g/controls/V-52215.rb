# encoding: utf-8

control "V-52215" do
	title "The DBMS must protect the audit records generated, as a result of remote access to privileged accounts, and the execution of privileged functions."
	desc "Protection of audit records and audit data is of critical importance. Care must be taken to ensure privileged users cannot circumvent audit protections put in place. 

Auditing might not be reliable when performed by an information system which the user being audited has privileged access to. 

The privileged user could inhibit auditing or directly modify audit records. To prevent this from occurring, privileged access shall be further defined between audit-related privileges and other privileges, thus limiting the users with audit-related privileges. 

Reducing the risk of audit compromises by privileged users can also be achieved, for example, by performing audit activity on a separate information system where the user in question has limited access or by using storage media that cannot be modified (e.g., write-once recording devices).

If an attacker were to gain access to audit tools he could analyze audit logs for system weaknesses or weaknesses in the auditing itself.  An attacker could also manipulate logs to hide evidence of malicious activity.true"
	impact 0.5
	tag "check": "
For table-based auditing (DB or DB,EXTENDED), review the DBMS permissions on the views and base tables holding the audit data.

For file-based auditing (OS, XML or XML,EXTENDED), review the operating system/file system permissions on the audit file(s).

If permissions exist that enable unauthorized users to view audit data, this is a finding.

If permissions exist that enable any user (other than an account created specifically to manage log space and offload audit records to a log management system) to modify or delete audit records, or create spurious audit records, this is a finding.
"
	tag "fix": "
Add controls and modify permissions to protect database audit log records from modification, deletion, spurious creation, or unauthorized viewing.
"

	# Write Check Logic Here

end