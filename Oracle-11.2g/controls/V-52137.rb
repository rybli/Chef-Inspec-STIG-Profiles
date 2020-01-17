# encoding: utf-8

control "V-52137" do
	title "The DBMS must provide a logout functionality to allow the user to manually terminate the session."
	desc "Manually terminating an application session allows users to immediately depart the physical vicinity of the system they are logged into without the risk of subsequent system users reactivating or continuing their application session. Users who log into applications must have the ability to manually terminate their application session.

Without an observable manual logout capability provided by the application, the user will have no means of manually terminating their application session. Their session could remain active until which time the inactivity period expires and the application automatically logs the user out. This increases the likelihood that the next subsequent user of the system could pick up on the previous user's session and continue utilizing the application as the previous user.false"
	impact 0.5
	tag "check": "If any application using the database can be closed, or logged out of, by the user, yet does not close the user's session in the DBMS, this is a finding.
- - - - - -
This is default behavior for the Oracle database.  To test this functionality, create a user named testuser1 as SYSDBA and grant connect to testuser1.  The V$SESSION is the place where all of the sessions that are established with the database are tracked, so we can count the number of active sessions by counting the rows in that table.

Initiate session one

sqlplus connect sysdba

SQL>select count(*) from v$session
count (*) 
---------
       26

Then connect as a different user in a second terminal session and after successfully connecting, issue the select count(*) command again and the number should increase by one, then have user1 exit the session.  If you have the SYSDBA do another select count(*) from v$session, you will see the session count will go down by 1.  When a session no longer exists, the resources are de-allocated.

sqlplus connect as user1

SQL>exit"
	tag "fix": "Code applications to close database sessions when the user logs out or closes the application."

	# Write Check Logic Here

end