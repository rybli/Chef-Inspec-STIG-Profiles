# encoding: utf-8

control "V-52187" do
	title "The DBMS must notify appropriate individuals when accounts are created."
	desc "Once an attacker establishes initial access to a system, they often attempt to create a persistent method of re-establishing access. One way to accomplish this is for the attacker to simply create a new account.

Notification of account creation is one method and best practice for mitigating this risk. A comprehensive account management process will ensure an audit trail which documents the creation of application user accounts and notifies administrators and/or application owners exist. Such a process greatly reduces the risk that accounts will be surreptitiously created and provides logging that can be used for forensic purposes.

Note that user authentication and account management must be done via an enterprise-wide mechanism whenever possible.  Examples of enterprise-level authentication/access mechanisms include, but are not limited to, Active Directory and LDAP.  This requirement applies to cases where accounts are directly managed by Oracle.

Notwithstanding how accounts are normally managed, the DBMS must support the requirement to notify appropriate individuals upon account creation within Oracle.  Indeed, in a configuration where accounts are managed externally, the creation of an account within Oracle may indicate hostile activity.false"
	impact 0.5
	tag "check": "Check DBMS settings to determine whether it will notify appropriate individuals when accounts are created. If the DBMS does not notify appropriate individuals when accounts are created, this is a finding."
	tag "fix": "Working with the DBA and site management, determine the appropriate individuals (by job role) to be notified.

If Oracle Audit Vault is available, configure it to  notify the appropriate individuals when accounts are created.

If Oracle Audit Vault is not available, configure the Oracle DBMS's auditing feature to record account-creation activity.  Create and deploy a mechanism, such as a frequently-run job, to monitor the audit table or file for these records and notify the appropriate individuals."

	# Write Check Logic Here

end