# encoding: utf-8

control "V-52167" do
	title "The DBMS must alert designated organizational officials in the event of an audit processing failure."
	desc "It is critical for the appropriate personnel to be aware if a system is at risk of failing to process audit logs as required. Audit processing failures include: software/hardware errors, failures in the audit capturing mechanisms, and audit storage capacity being reached or exceeded.

A failure of database auditing will result in either the database continuing to function without auditing or in a complete halt to database operations. When audit processing fails, appropriate personnel must be alerted immediately to avoid further downtime or unaudited transactions.

If Oracle Enterprise Manager is in use, the capability to issue such an alert is built in and configurable via the console so an alert can be sent to a designated administrator.false"
	impact 0.5
	tag "check": "Review OS or third-party logging application settings to determine whether an alert will be sent to the designated organizational personnel when auditing fails for any reason. If no alert will be sent, this is a finding."
	tag "fix": "Modify OS or third-party logging application settings to alert designated organizational personnel when auditing fails for any reason. 

If Oracle Enterprise Manager is in use, the capability to issue such an alert is built in and configurable via the console so an alert can be sent to a designated administrator."

	# Write Check Logic Here

end