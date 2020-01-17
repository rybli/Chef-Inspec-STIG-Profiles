# encoding: utf-8

control "V-52337" do
	title "The DBMS must limit the number of concurrent sessions for each system account to an organization-defined number of sessions."
	desc "Application management includes the ability to control the number of users and user sessions utilizing an application. Limiting the number of allowed users, and sessions per user, is helpful in limiting risks related to Denial of Service attacks.

This requirement addresses concurrent session control for a single information system account and does not address concurrent sessions by a single user via multiple system accounts. 

Unlimited concurrent connections to the DBMS could allow a successful Denial of Service (DoS) attack by exhausting connection resources.

The organization will need to define the maximum number of concurrent sessions by account type, by account, or a combination thereof.  In deciding on the appropriate number, it is important to take into account the work requirements of the various types of user.  For example, 2 might be an acceptable limit for general users accessing the database via an application; but 10 might be too few for a database administrator using a database management GUI tool, where each query tab and navigation pane may count as a separate session.true"
	impact 0.5
	tag "check": "Retrieve the settings for concurrent sessions for each profile with the query:
SELECT * FROM SYS.DBA_PROFILES WHERE RESOURCE_NAME = 'SESSIONS_PER_USER';

If the DBMS settings for concurrent sessions for each profile are greater than the organizationally defined maximum number of sessions, this is a finding."
	tag "fix": "Limit concurrent connections for each system account to a number less than or equal to the organization-defined number of sessions using the following SQL.  Create profiles that conform to the DoD requirements.  Assign users to the appropriate profile.  

Change the value of SESSIONS_PER_USER (along with the other parameters, where relevant) from UNLIMITED to DoD-compliant, site-specific requirements and then assign users to the profile (the name PPPPP is an example; use a name appropriate to your circumstance):

CREATE PROFILE "PPPPPP" LIMIT CPU_PER_SESSION UNLIMITED
CPU_PER_CALL UNLIMITED
CONNECT_TIME UNLIMITED
IDLE_TIME UNLIMITED
SESSIONS_PER_USER UNLIMITED
LOGICAL_READS_PER_SESSION UNLIMITED
LOGICAL_READS_PER_CALL UNLIMITED
PRIVATE_SGA UNLIMITED
COMPOSITE_LIMIT UNLIMITED
PASSWORD_LIFE_TIME 180
PASSWORD_GRACE_TIME 7
PASSWORD_REUSE_MAX UNLIMITED
PASSWORD_REUSE_TIME UNLIMITED
PASSWORD_LOCK_TIME 1
FAILED_LOGIN_ATTEMPTS 10
PASSWORD_VERIFY_FUNCTION NULL

To assign the user to the profile do the following:
ALTER USER user1 PROFILE PPPPPP;"

	# Write Check Logic Here

end