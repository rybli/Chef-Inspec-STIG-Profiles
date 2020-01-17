# encoding: utf-8

control "V-52163" do
	title "The DBMS must provide a real-time alert when organization-defined audit failure events occur."
	desc "It is critical for the appropriate personnel to be aware if a system is at risk of failing to process audit logs as required. Audit processing failures include:  software/hardware errors, failures in the audit capturing mechanisms, and audit storage capacity being reached or exceeded. 

If audit log capacity were to be exceeded, then events subsequently occurring would not be recorded. Organizations shall define a maximum allowable percentage of storage capacity serving as an alarming threshold (e.g., application has exceeded 80% of log storage capacity allocated) at which time the application or the logging mechanism the application utilizes will provide a warning to the appropriate personnel. 

A failure of database auditing will result in either the database continuing to function without auditing or in a complete halt to database operations. When audit processing fails, appropriate personnel must be alerted immediately to avoid further downtime or unaudited transactions.  This can be an alert provided by the database, a log repository, or the OS when a designated log directory is nearing capacity.

If Oracle Enterprise Manager is in use, the capability to issue such an alert is built in and configurable via the console so an alert can be sent to a designated administrator.false"
	impact 0.5
	tag "check": "Review Oracle Corp., OS, or third-party logging software settings to determine whether a real-time alert will be sent to the appropriate personnel when auditing fails for any reason.

If real-time alerts are not sent upon auditing failure, this is a finding.
"
	tag "fix": "Configure logging software to send a real-time alert to appropriate personnel when auditing fails for any reason.

(Oracle recommends the use of Oracle Enterprise Manager.)"

	# Write Check Logic Here

end