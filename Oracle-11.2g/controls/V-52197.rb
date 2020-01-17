# encoding: utf-8

control "V-52197" do
	title "The DBMS must protect audit tools from unauthorized modification."
	desc "Protecting audit data also includes identifying and protecting the tools used to view and manipulate log data. 

Depending upon the log format and application, system and application log tools may provide the only means to manipulate and manage application and system log data.  

If the tools are compromised it could provide attackers with the capability to manipulate log data. It is, therefore, imperative that audit tools be controlled and protected from unauthorized modification. 

Audit tools include, but are not limited to, OS provided audit tools, vendor provided audit tools, and open source audit tools needed to successfully view and manipulate audit information system activity and records. 

If an attacker were to gain access to audit tools he could analyze audit logs for system weaknesses or weaknesses in the auditing itself. An attacker could also manipulate logs to hide evidence of malicious activity.false"
	impact 0.5
	tag "check": "Review access permissions to tools used to view or modify audit log data. These tools may include the DBMS itself or tools external to the database. If appropriate permissions and access controls are not applied to prevent unauthorized modification of these tools, this is a finding."
	tag "fix": "Add or modify access controls and permissions to tools used to view or modify audit log data. Tools must be modifiable by authorized personnel only."

	# Write Check Logic Here

end