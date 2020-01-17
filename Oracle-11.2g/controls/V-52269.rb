# encoding: utf-8

control "V-52269" do
	title "The DBMS must disable user accounts after 35 days of inactivity."
	desc "Password complexity, or strength, is a measure of the effectiveness of a password in resisting attempts at guessing and brute-force attacks. 

To meet password policy requirements, passwords need to be changed at specific policy-based intervals.  

If the information system or application allows the user to consecutively reuse their password when that password has exceeded its defined lifetime, the end result is a password that is not changed as per policy requirements.  

Unused or expired DBMS accounts provide a means for undetected, unauthorized access to the database.

Note that user authentication and account management must be done via an enterprise-wide mechanism whenever possible.  Examples of enterprise-level authentication/access mechanisms include, but are not limited to, Active Directory and LDAP  This requirement applies to cases where it is necessary to have accounts directly managed by Oracle.false"
	impact 0.5
	tag "check": "If all user accounts are managed and authenticated by the OS or an enterprise-level authentication/access mechanism, and not by Oracle, this is not a finding.

For accounts managed by Oracle, check DBMS settings to determine if accounts can be automatically disabled by the system after 35 days of inactivity. Also, ask the DBA if an alternative method, such as a stored procedure run daily, to disable Oracle-managed accounts inactive for more than 35 days, has been deployed.  

If the ability to disable accounts after 35 days of inactivity, by either of these means, does not exist, this is a finding.

- - - - -

Use this query to check to see what profile each user is associated with, if any:

select username, profile from dba_users order by 1,2;

Then check the profile to see what the password_life_time is set to in the table dba_profiles; the password_life_time is a value stored in the LIMIT column, and identified by the value PASSWORD_LIFE_TIME in the RESOURCE_NAME column.

SQL>select profile, resource_name, resource_type, limit from dba_profiles where upper(resource_name) = 'PASSWORD_LIFE_TIME';"
	tag "fix": "For accounts managed by Oracle, determine if it is practical and acceptable to require a password change every 35 days or fewer, rather than the standard 60 days (as specified in SRG-APP-000174-DB-000080).  If it is, issue the statement:

ALTER PROFILE PPPPPP LIMIT PASSWORD_LIFE_TIME 35;
(See the Oracle-provided $ORACLE_HOME/rdbms/admin/secconf.sql script for examples.)

If password changes every 35 days or fewer are unacceptable or impractical, implement an alternative method, such as a stored procedure run daily, to disable accounts inactive for more than 35 days."

	# Write Check Logic Here

end