# encoding: utf-8

control "V-54021" do
	title "Use of the DBMS installation account must be logged."
	desc "The DBMS installation account may be used by any authorized user to perform DBMS installation or maintenance. Without logging, accountability for actions attributed to the account is lost.false"
	impact 0.5
	tag "check": "Review documented and implemented procedures for monitoring the use of the DBMS software installation account in the System Security Plan.

If use of this account is not monitored or procedures for monitoring its use do not exist or are incomplete, this is a Finding.
 
NOTE: On Windows systems, The Oracle DBMS software is installed using an account with administrator privileges. Ownership should be reassigned to a dedicated OS account used to operate the DBMS software. If monitoring does not include all accounts with administrator privileges on the DBMS host, this is a Finding."
	tag "fix": "Develop, document and implement a logging procedure for use of the DBMS software installation account that provides accountability to individuals for any actions taken by the account.

Host system audit logs should be included in the DBMS account usage log along with an indication of the person who accessed the account and an explanation for the access.

Ensure all accounts with administrator privileges are monitored for DBMS host on Windows OS platforms."

	# Write Check Logic Here

end