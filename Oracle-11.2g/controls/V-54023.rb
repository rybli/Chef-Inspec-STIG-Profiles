# encoding: utf-8

control "V-54023" do
	title "Remote administrative access to the database must be monitored by the IAO or IAM."
	desc "Remote administrative access to systems provides a path for access to and exploit of DBA privileges. Where the risk has been accepted to allow remote administrative access, it is imperative to instate increased monitoring of this access to detect any abuse or compromise.false"
	impact 0.5
	tag "check": "If remote administrative access to the database is prohibited and is disabled, this check is Not a Finding.

Review policy, procedure and evidence of implementation for monitoring of remote administrative access to the database.

If monitoring procedures for remote administrative access are not documented or implemented, this is a Finding."
	tag "fix": "Develop, document and implement policy and procedures to monitor remote administrative access to the DBMS.

The automated generation of a log report with automatic dissemination to the IAO/IAM may be used.

Require and store an acknowledgement of receipt and confirmation of review for the log report."

	# Write Check Logic Here

end