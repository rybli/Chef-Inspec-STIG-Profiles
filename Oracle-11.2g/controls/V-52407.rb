# encoding: utf-8

control "V-52407" do
	title "The DBMS must specify an account lockout duration that is greater than or equal to the organization-approved minimum."
	desc "Anytime an authentication method is exposed, to allow for the utilization of an application, there is a risk that attempts will be made to obtain unauthorized access.

To defeat these attempts, organizations define the number of times a user account may consecutively fail a logon attempt. The organization also defines the period of time in which these consecutive failed attempts may occur.

By limiting the number of failed logon attempts, the risk of unauthorized system access via user password guessing, otherwise known as brute forcing, is reduced. Limits are imposed by locking the account.

User authentication and account management must be done via an enterprise-wide mechanism whenever possible.  Examples of enterprise-level authentication/access mechanisms include, but are not limited to, Active Directory and LDAP.  This requirement applies to cases where it is necessary to have accounts directly managed by Oracle.falseO112-C2-004900Ensure that the passwords for essential system accounts such as SYS are available only to authorized administrators, and tightly guarded to avoid misuse.  Ensure that these accounts are kept locked except when it is specifically necessary to use them."
	impact 0.5
	tag "check": "The account lockout duration is defined in the profile assigned to a user.

To see what profile is assigned to a user, enter the query:

SELECT profile FROM dba_users WHERE username = '&USERNAME'

This will return the profile name assigned to that user.

Now check the values assigned to the profile returned from the query above:

SELECT PROFILE, RESOURCE_NAME, LIMIT FROM DBA_PROFILES WHERE PROFILE LIKE '&PROFILE_NAME'  

Check the settings for password_lock_time - this specifies how long to lock the account after the number of consecutive failed logon attempts reaches the limit. If the value is not UNLIMITED, this is a finding."
	tag "fix": "Configure the DBMS settings to specify indefinite lockout duration:

ALTER PROFILE '&PROFILE_NAME' LIMIT PASSWORD_LOCK_TIME UNLIMITED;"

	# Write Check Logic Here

end