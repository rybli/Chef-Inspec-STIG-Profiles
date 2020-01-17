# encoding: utf-8

control "V-52173" do
	title "The DBMS must identify potentially security-relevant error conditions."
	desc "The structure and content of error messages need to be carefully considered by the organization and development team. The extent to which the application is able to identify and handle error conditions is guided by organizational policy and operational requirements. 

Database logs can be monitored for specific security-related errors. Any error that can have a negative effect on database security should be quickly identified and forwarded to the appropriate personnel.  If security-relevant error conditions are not identified by the DBMS, they may be overlooked by the personnel responsible for addressing them.false"
	impact 0.5
	tag "check": "Check DBMS settings to determine whether security-related error conditions are monitored for, and whether appropriate personnel are notified. 

If security-related error conditions are not being monitored for, this is a finding.

If appropriate personnel are not alerted when a security-related error condition is found, this is a finding."
	tag "fix": "Configure DBMS to monitor for security-related error conditions.

Configure DBMS to alert appropriate personnel when security-related error conditions are found.

This can be accomplished by using Oracle Audit Vault and/or Oracle Enterprise Manager. If neither of these products is deployed then develop a site-specific solution.

- - - - -

Notes to assist in developing a site-specific solution:

The AUD$ table has a column called RETURNCODE.  That column provides the return code, so, for example, if the security-related condition is someone trying to select data from a table that is not there, it would show up in the AUD$ table as an ORA-00942 - table or view does not exist.  Since the RETURNCODE column is only numeric, only the 00942 would be stored. If the query for the information returned a row, the process would then need to form and send an email message.  

Oracle recommends the use of Oracle Audit Vault to fill this requirement without creating a custom solution.   It is possible to set up notifications and alerts in Enterprise Manager as well, and if either of these alternatives is not available, a custom solution will be necessary."

	# Write Check Logic Here

end