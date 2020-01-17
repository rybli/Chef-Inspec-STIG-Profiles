# encoding: utf-8

control "V-52409" do
	title "Disk space used by audit trail(s) must be monitored; audit records must be regularly or continuously offloaded to a centralized log management system."
	desc "It is critical when a system is at risk of failing to process audit logs as required; it detects and takes action to mitigate the failure. Audit processing failures include:  software/hardware errors, failures in the audit capturing mechanisms, and audit storage capacity being reached or exceeded. Applications are required to be capable of either directly performing or calling system-level functionality performing defined actions upon detection of an application audit log processing failure.

The Security Requirements Guide says, "A failure of database auditing will result in either the database continuing to function without auditing or in a complete halt to database operations. The database must be capable of taking organization-defined actions to avoid either a complete halt to processing or processing transactions in an unaudited manner."

This STIG requirement mandates the implementation of a method to mitigate Oracle's inability to automatically reuse audit trail space on a first-in, first-out basis.false"
	impact 0.5
	tag "check": "Interview the database administrator: review the procedures, manual and/or automated, for monitoring the space used by audit trail(s), and for offloading audit records to a centralized log management system.

If the procedures do not exist, this is a finding.

If the procedures exist, request evidence that they are followed.  If the evidence indicates that the procedures are not followed, this is a finding.

 If the procedures exist, inquire if the system has ever run out of audit trail space in the last two years or since the last system upgrade, whichever is more recent.  If it has run out of space in this period, and the procedures have not been updated to compensate, this is a finding."
	tag "fix": "Institute procedures, manual and/or automated, for monitoring the space used by audit trail(s), and for offloading audit records to a centralized log management system."

	# Write Check Logic Here

end