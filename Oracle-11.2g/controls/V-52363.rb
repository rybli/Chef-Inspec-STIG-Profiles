# encoding: utf-8

control "V-52363" do
	title "The DBMS must automatically audit account termination."
	desc "When application accounts are terminated, user accessibility is affected.  Accounts are utilized for identifying individual application users or for identifying the application processes themselves. 

In order to detect and respond to events affecting user accessibility and application processing, applications must audit account terminating actions and notify the appropriate individuals so they can investigate the event.  Such a capability greatly reduces the risk that application accessibility will be negatively affected for extended periods of time and provides logging that can be used for forensic purposes. 

Note that user authentication and account management should be done via an enterprise-wide mechanism whenever possible.  Examples of enterprise-level authentication/access mechanisms include, but are not limited to, Active Directory and LDAP.

However, notwithstanding how accounts are managed, Oracle auditing must always be configured to capture account termination.true"
	impact 0.5
	tag "check": "
Check Oracle settings (and also OS settings, and/or enterprise-level authentication/access mechanisms settings) to determine if account termination actions are being audited. If account termination actions are not being audited by Oracle, this is a finding.

To see if Oracle is configured to capture audit data, enter the following SQLPlus command:
SHOW PARAMETER AUDIT_TRAIL
or the following SQL query:
SELECT * FROM SYS.V$PARAMETER WHERE NAME = 'audit_trail';
If Oracle returns the value 'NONE', this is a finding.
"
	tag "fix": "
Configure Oracle to audit account termination actions.

Use this query to ensure auditable events are captured:
ALTER SYSTEM SET AUDIT_TRAIL=<audit trail type> SCOPE=SPFILE;
Audit trail type can be 'OS', 'DB', 'DB,EXTENDED', 'XML' or 'XML,EXTENDED'.
After executing this statement, it may be necessary to shut down and restart the Oracle database.

For more information on the configuration of auditing, please refer to 'Auditing Database Activity' in the Oracle Database 2 Day + Security Guide:
http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_auditing.htm
and 'Verifying Security Access with Auditing' in the Oracle Database Security Guide: http://docs.oracle.com/cd/E11882_01/network.112/e36292/auditing.htm#DBSEG006
and '27 DBMS_AUDIT_MGMT' in the Oracle Database PL/SQL Packages and Types Reference:
http://docs.oracle.com/cd/E11882_01/appdev.112/e40758/d_audit_mgmt.htm  
"

	# Write Check Logic Here

end