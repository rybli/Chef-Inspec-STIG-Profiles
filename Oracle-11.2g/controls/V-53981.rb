# encoding: utf-8

control "V-53981" do
	title "The Oracle password file ownership and permissions should be limited to the Oracle installation account and REMOTE_LOGIN_PASSWORDFILE parameter must be set to EXCLUSIVE or NONE."
	desc "It is critically important to the security of your system that you protect your password file and the environment variables that identify the location of the password file. Any user with access to these could potentially compromise the security of the connection. 
The REMOTE_LOGIN_PASSWORDFILE setting of "NONE" disallows remote administration of the database. The REMOTE_LOGIN_PASSWORDFILE setting of "EXCLUSIVE" allows for auditing of individual DBA logins to the SYS account. If not set to "EXCLUSIVE,” remote connections to the database as "internal" or "as SYSDBA" are not logged to an individual account.
false"
	impact 0.5
	tag "check": "From SQL*Plus: 

select value from v$parameter where upper(name) = 'REMOTE_LOGIN_PASSWORDFILE';

If the value returned does not equal 'EXCLUSIVE' or 'NONE', this is a Finding.

On UNIX Systems:

ls -ld $ORACLE_HOME/dbs/orapw${ORACLE_SID}

Substitute ${ORACLE_SID} with the name of the ORACLE_SID for the database.

If permissions are granted for world and/or group access, this is a Finding.

On Windows Systems (From Windows Explorer):

Browse to the %ORACLE_HOME\database\directory.

Select and right-click on the PWD%ORACLE_SID%.ora file, select Properties, select the Security tab.
Substitute %ORACLE_SID% with the name of the ORACLE_SID for the database.

If permissions are granted to everyone, this is a finding.
If any account other than the DBMS software installation account is listed, this is a finding.
"
	tag "fix": "Disable use of the remote_login_passwordfile where remote administration is not authorized by specifying a value of NONE.

If authorized, restrict use of a password file to exclusive use by each database by specifying a value of EXCLUSIVE.

From SQL*Plus:

alter system set remote_login_passwordfile = 'EXCLUSIVE' scope = spfile;

OR

alter system set remote_login_passwordfile = 'NONE' scope = spfile;

The above SQL*Plus command will set the parameter to take effect at next system startup.

Restrict ownership and permissions on the Oracle password file to only the DBMS software installation account.
More information regarding the ORAPWD file and the REMOTE_LOGIN_PASSWORDFILE parameter, can be found here:
https://docs.oracle.com/cd/E11882_01/server.112/e25494/dba.htm#ADMIN10241

"

	# Write Check Logic Here

end