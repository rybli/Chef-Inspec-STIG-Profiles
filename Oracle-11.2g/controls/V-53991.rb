# encoding: utf-8

control "V-53991" do
	title "The Oracle Listener must be configured to require administration authentication."
	desc "Oracle listener authentication helps prevent unauthorized administration of the Oracle listener. Unauthorized administration of the listener could lead to DoS exploits; loss of connection audit data, unauthorized reconfiguration or other unauthorized access. This is a Category I finding because privileged access to the listener is not restricted to authorized users. Unauthorized access can result in stopping of the listener (DoS) and overwriting of listener audit logs.false"
	impact 0.5
	tag "check": "If a listener is not running on the local database host server, this check is Not a Finding.

NOTE:  This check needs to be done only once per host system and once per listener. Multiple listeners may be defined on a single host system. They must all be reviewed, but only once per database home review.

For subsequent database home reviews on the same host system, mark this check as Not a Finding.

Determine all Listeners running on the host.

For Windows hosts, view all Windows services with TNSListener embedded in the service name
- The service name format is:
  Oracle[ORACLE_HOME_NAME]TNSListener

For UNIX hosts, the Oracle Listener process will indicate the TNSLSNR executable.

At a command prompt, issue the command:
ps -ef | grep tnslsnr | grep -v grep

The alias for the listener follows tnslsnr in the command output.

You must be logged on the host system using the account that owns the tnslsnr executable (UNIX). If the account is denied local login, have the system SA assist you in this task by 'su' to the listener account from the root account. On Windows platforms, log in using an account with administrator privileges to complete the check.

From a system command prompt, execute the listener control utility:

lsnrctl status [LISTENER NAME]

Review the results for the value of Security.

If Security = OFF is displayed, this is a Finding.

If Security = ON: Local OS Authentication is displayed, this is not a Finding.

If Security = ON: Password or Local OS Authentication, this is a Finding (do not set a password on Oracle versions 10.1 and higher. Instead, use Local OS Authentication).

Repeat the execution of the lsnrctl utility for all active listeners."
	tag "fix": "Configure the listener to use Local OS Authentication. This setting prevents remote administration of the listener, restricts management to the Oracle listener owner account (UNIX) and accounts with administrator privileges (WIN).

Remote administration of the listener should not be permitted. If listener administration from a remote system is required, granting secure remote access to the Oracle DBMS server and performing local administration is preferred. Authorize and document this requirement in the System Security Plan."

	# Write Check Logic Here

end