# encoding: utf-8

control "V-92717" do
	title "The Apache web server must not impede the ability to write specified log record content to an audit log server."
	desc "Writing events to a centralized management audit system offers many benefits to the enterprise over having dispersed logs. Centralized management of audit records and logs provides for efficiency in maintenance and management of records, enterprise analysis of events, and backup and archiving of event records enterprise-wide. The web server and related components are required to be capable of writing logs to centralized audit log servers.false"
	impact 0.5
	tag "check": "Work with SIEM administrator to determine audit configurations. 

If there is a setting within the SIEM that could impede the ability to write specific log record content, this is a finding."
	tag "fix": "Work with the SIEM administrator to  allow the ability to write specified log record content to an audit log server."

	# Write Check Logic Here

end