# encoding: utf-8

control "V-54075" do
	title "Remote administration must be disabled for the Oracle connection manager."
	desc "Remote administration provides a potential opportunity for malicious users to make unauthorized changes to the Connection Manager configuration or interrupt its service.false"
	impact 0.5
	tag "check": "View the cman.ora file in the ORACLE_HOME/network/admin directory.

If the file does not exist, the database is not accessed via Oracle Connection Manager and this check is Not a Finding.

If the entry and value for REMOTE_ADMIN is not listed or is not set to a value of NO (REMOTE_ADMIN = NO), this is a Finding."
	tag "fix": "View the cman.ora file in the ORACLE_HOME/network/admin directory of the Connection Manager.

Include the following line in the file:

REMOTE_ADMIN = NO"

	# Write Check Logic Here

end