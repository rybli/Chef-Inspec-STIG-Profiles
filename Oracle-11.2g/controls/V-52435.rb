# encoding: utf-8

control "V-52435" do
	title "The DBMS, when the maximum number of unsuccessful attempts is exceeded, must automatically lock the account/node for an organization-defined time period or lock the account/node until released by an administrator IAW organizational policy."
	desc "Anytime an authentication method is exposed,  to allow for the utilization of an application, there is a risk that attempts will be made to obtain unauthorized access. 

To defeat these attempts, organizations define the number of times a user account may consecutively fail a login attempt. The organization also defines the period of time in which these consecutive failed attempts may occur. 

By limiting the number of failed login attempts, the risk of unauthorized system access via user password guessing, otherwise known as brute forcing, is reduced. Limits are imposed by locking the account.

Note that user authentication and account management must be done via an enterprise-wide mechanism whenever possible.  Examples of enterprise-level authentication/access mechanisms include, but are not limited to, Active Directory and LDAP  This requirement applies to cases where it is necessary to have accounts directly managed by Oracle.false"
	impact 0.5
	tag "check": "(This addresses both O112-C2-005000 and O112-C2-005200.)

The limit on the number of consecutive failed logon attempts is defined in the profile assigned to a user.

To see what profile is assigned to a user, enter the following query:
SQL>SELECT profile FROM dba_users WHERE username = '&USERNAME'
This will return the profile name assigned to that user.

Now check the values assigned to the profile returned from the query above:
SQL>SELECT PROFILE, RESOURCE_NAME, LIMIT FROM DBA_PROFILES WHERE PROFILE LIKE '&PROFILE_NAME'  

Check the settings for failed_login_attempts - this is the number of consecutive failed login attempts before locking the Oracle user account. If the value is greater than 3, this is a finding."
	tag "fix": "(This addresses both O112-C2-005000 and O112-C2-005200.)

Configure the DBMS settings to specify the maximum number of consecutive failed login attempts to 3 (or less):
ALTER PROFILE '&PROFILE_NAME' LIMIT FAILED_LOGON_ATTEMPTS 3;"

	# Write Check Logic Here

end