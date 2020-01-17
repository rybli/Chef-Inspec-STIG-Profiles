# encoding: utf-8

control "V-52195" do
	title "The DBMS must notify appropriate individuals when account disabling actions are taken."
	desc "When application accounts are disabled, user accessibility is affected. Accounts are utilized for identifying individual application users or for identifying the application processes themselves. 

In order to detect and respond to events that affect user accessibility and application processing, applications must audit account disabling actions and, as required, notify the appropriate individuals so they can investigate the event. Such a capability greatly reduces the risk that application accessibility will be negatively affected for extended periods of time and also provides logging that can be used for forensic purposes.   

Note that user authentication and account management must be done via an enterprise-wide mechanism whenever possible.  Examples of enterprise-level authentication/access mechanisms include, but are not limited to, Active Directory and LDAP.  This requirement applies to cases where accounts are directly managed by Oracle.

Notwithstanding how accounts are normally managed, the DBMS must support the requirement to notify appropriate individuals upon the disabling of an account within Oracle.  Indeed, in a configuration where accounts are managed externally, the manipulation of an account within Oracle may indicate hostile activity.true"
	impact 0.5
	tag "check": "Check DBMS settings to determine whether it will notify appropriate individuals when account disabling actions are taken. If the DBMS does not notify appropriate individuals when account disabling actions are taken, this is a finding."
	tag "fix": "Working with the DBA and site management, determine the appropriate individuals (by job role) to be notified.

If Oracle Audit Vault is available, configure it to notify the appropriate individuals when accounts are disabled.

If Oracle Audit Vault is not available, configure the Oracle DBMS's auditing feature to record account-disabling activity.  Create and deploy a mechanism, such as a frequently-run job, to monitor the audit table or file for these records and notify the appropriate individuals."

	# Write Check Logic Here

end