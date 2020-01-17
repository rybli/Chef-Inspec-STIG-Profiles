# encoding: utf-8

control "V-54051" do
	title "Changes to configuration options must be audited."
	desc "The AUDIT_SYS_OPERATIONS parameter is used to enable auditing of actions taken by the user SYS. The SYS user account is a shared account by definition and holds all privileges in the Oracle database. It is the account accessed by users connecting to the database with SYSDBA or SYSOPER privileges.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select value from v$parameter where name = 'audit_sys_operations';

If the value returned is FALSE, this is a Finding."
	tag "fix": "From SQL*Plus:

alter system set audit_sys_operations = TRUE scope = spfile;

The above SQL*Plus command will set the parameter to take effect at next system startup."

	# Write Check Logic Here

end