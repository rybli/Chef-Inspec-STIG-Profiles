# encoding: utf-8

control "V-52201" do
	title "The DBMS must protect audit tools from unauthorized deletion."
	desc "Protecting audit data also includes identifying and protecting the tools used to view and manipulate log data. 

Depending upon the log format and application, system and application log tools may provide the only means to manipulate and manage application and system log data. 

It is, therefore, imperative that access to audit tools be controlled and protected from unauthorized access.  

Applications providing tools to interface with audit data will leverage user permissions and roles identifying the user accessing the tools and the corresponding rights the user enjoys in order make access decisions regarding the access to audit tools.

Audit tools include, but are not limited to, OS-provided audit tools, vendor-provided audit tools, and open source audit tools needed to successfully view and manipulate audit information system activity and records. 

If an attacker were to gain access to audit tools, he could analyze audit logs for system weaknesses or weaknesses in the auditing itself.  An attacker could also manipulate logs to hide evidence of malicious activity.false"
	impact 0.5
	tag "check": "Review access permissions to tools used to view or modify audit log data. These tools may include the DBMS itself or tools external to the database. If appropriate permissions and access controls are not applied to prevent unauthorized deletion of these tools, this is a finding."
	tag "fix": "Add or modify access controls and permissions to tools used to view or modify audit log data. Only authorized personnel must be able to delete these tools."

	# Write Check Logic Here

end