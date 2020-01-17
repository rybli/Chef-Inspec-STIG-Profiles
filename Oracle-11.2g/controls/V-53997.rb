# encoding: utf-8

control "V-53997" do
	title "Connections by mid-tier web and application systems to the Oracle DBMS from a DMZ or external network must be encrypted."
	desc "Multi-tier systems may be configured with the database and connecting middle-tier system located on an internal network, with the database located on an internal network behind a firewall and the middle-tier system located in a DMZ. In cases where either or both systems are located in the DMZ (or on networks external to DoD), network communications between the systems must be encrypted.false"
	impact 0.5
	tag "check": "Review the System Security Plan for remote applications that access and use the database.

For each remote application or application server, determine whether communications between it and the DBMS are encrypted. If any are not encrypted, this is a finding."
	tag "fix": "Configure communications between the DBMS and remote applications/application servers to use DoD-approved encryption."

	# Write Check Logic Here

end