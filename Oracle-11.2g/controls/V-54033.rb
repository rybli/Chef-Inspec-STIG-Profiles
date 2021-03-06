# encoding: utf-8

control "V-54033" do
	title "Sensitive data stored in the database must be identified in the System Security Plan and AIS Functional Architecture documentation."
	desc "A DBMS that does not have the correct confidentiality level identified or any confidentiality level assigned is not being secured at a level appropriate to the risk it poses.false"
	impact 0.5
	tag "check": "If no sensitive or classified data is stored in the database, listed in the System Security Plan and listed in the AIS Functional Architecture documentation, this check is Not a Finding.

Review AIS Functional Architecture documentation for the DBMS and note any sensitive data that is identified.

Review database table column data or descriptions that indicate sensitive data.

For example, a data column labeled "SSN" could indicate social security numbers are stored in the column.

Question the IAO or DBA where any questions arise.

General categories of sensitive data requiring identification include any personal data (health, financial, social security number and date of birth), proprietary or financially sensitive business data or data that might be classified.

If any data is considered sensitive and is not documented in the AISFA, this is a Finding."
	tag "fix": "Include identification of any sensitive data in the AIS Functional Architecture and the System Security Plan.

Include data that appear to be sensitive with a discussion as to why it is not marked as such."

	# Write Check Logic Here

end