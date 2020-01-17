# encoding: utf-8

control "V-53963" do
	title "Oracle instance names must not contain Oracle version numbers."
	desc "Service names may be discovered by unauthenticated users. If the service name includes version numbers or other database product information, a malicious user may use that information to develop a targeted attack.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select instance_name from v$instance;
select version from v$instance;

If the instance name returned references the Oracle release number, this is a Finding.

Numbers used that include version numbers by coincidence are not a Finding.

The DBA should be able to relate the significance of the presence of a digit in the SID."
	tag "fix": "Follow the instructions in Oracle MetaLink Note 15390.1 (and related documents) to change the SID for the database without re-creating the database to a value that does not identify the Oracle version."

	# Write Check Logic Here

end