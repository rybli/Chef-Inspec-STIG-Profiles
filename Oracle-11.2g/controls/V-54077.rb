# encoding: utf-8

control "V-54077" do
	title "The SQLNet SQLNET.ALLOWED_LOGON_VERSION parameter must be set to a value of 12 or higher."
	desc "Unsupported Oracle network client installations may introduce vulnerabilities to the database. Restriction to use of supported versions helps to protect the database and helps to enforce newer, more robust security controls.false"
	impact 0.5
	tag "check": "View the SQLNET.ORA file in the ORACLE_HOME/network/admin directory or the directory specified in the TNS_ADMIN environment variable. (Please see the supplemental file "Non-default sqlnet.ora configurations.pdf" for how to find multiple and/or differently located sqlnet.ora files.)

Locate the following entry:

SQLNET.ALLOWED_LOGON_VERSION = 12

If the parameter does not exist, this is a finding.
Determine whether the Oracle DBMS software is at version 11.2.0.4 with the January 2014 CPU (or above). If it is not, this is a finding.

If the parameter is not set to a value of 12 or higher, this is a finding.
"
	tag "fix": ": Deploy Oracle 11.2.0.4 with the January 2014 CPU patch.

Edit the SQLNET.ORA file to add or edit the entry:

SQLNET.ALLOWED_LOGON_VERSION = 12

Set the value to 12 or higher.

For more information on sqlnet.ora parameters refer to the following document:
"Database Net Services Reference"
https://docs.oracle.com/cd/E11882_01/network.112/e10835/sqlnet.htm#NETRF006
"

	# Write Check Logic Here

end