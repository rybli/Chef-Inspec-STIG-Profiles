# encoding: utf-8

control "V-52359" do
	title "The DBMS must support the requirement to automatically audit account modification."
	desc "Once an attacker establishes initial access to a system, they often attempt to create a persistent method of reestablishing access. One way to accomplish this is for the attacker to simply modify an existing account. 

Auditing of account modification is one method and best practice for mitigating this risk. A comprehensive application account management process ensures an audit trail automatically documents the modification of application user accounts and, as required, notifies administrators, application owners, and/or appropriate individuals. Applications must provide this capability directly, leveraging complementary technology providing this capability or a combination thereof.

Automated account auditing processes greatly reduces the risk that accounts will be surreptitiously modified and provides logging that can be used for forensic purposes.  

Note that user authentication and account management should be done via an enterprise-wide mechanism whenever possible.  Examples of enterprise-level authentication/access mechanisms include, but are not limited to, Active Directory and LDAP.

However, notwithstanding how accounts are managed, Oracle auditing must always be configured to capture account modification.true"
	impact 0.5
	tag "check": "
Check Oracle settings (and also OS settings, and/or enterprise-level authentication/access mechanisms settings) to determine if account creation is being audited. If account creation is not being audited by Oracle, this is a finding.

To see if Oracle is configured to capture audit data, enter the following SQLPlus command:
SHOW PARAMETER AUDIT_TRAIL
or the following SQL query:
SELECT * FROM SYS.V$PARAMETER WHERE NAME = 'audit_trail';
If Oracle returns the value 'NONE', this is a finding.
"
	tag "fix": "
Configure Oracle to audit account creation activities.

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