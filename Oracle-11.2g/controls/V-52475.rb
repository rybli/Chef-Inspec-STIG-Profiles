# encoding: utf-8

control "V-52475" do
	title "The DBMS must produce audit records containing sufficient information to establish where the events occurred."
	desc "Information system auditing capability is critical for accurate forensic analysis. Audit record content that may be necessary to satisfy the requirement of this control includes:  timestamps, source and destination addresses, user/process identifiers, event descriptions, success/fail indications, file names involved, and access control or flow control rules invoked. 

Without sufficient information establishing where the audit events occurred, investigation into the cause of events is severely hindered.true"
	impact 0.5
	tag "check": "Verify, using vendor and system documentation if necessary, that the DBMS is configured to use Oracle's auditing features, or that a third-party product or custom code is deployed and configured to satisfy this requirement.

If a third-party product or custom code is used, compare its current configuration with the audit requirements. If any of the requirements is not covered by the configuration, this is a finding.

The remainder of this Check is applicable specifically where Oracle auditing is in use.

To see if Oracle is configured to capture audit data, enter the following SQLPlus command:
SHOW PARAMETER AUDIT_TRAIL
or the following SQL query:
SELECT * FROM SYS.V$PARAMETER WHERE NAME = 'audit_trail';
If Oracle returns the value 'NONE', this is a finding.

To confirm that Oracle audit is capturing sufficient information to establish where events occurred, perform a successful auditable action and an auditable action that results in an SQL error, and then view the results in the SYS.AUD$ table or the audit file, whichever is in use.  If no DB ID or Object Creator or Object Name, or the wrong values, are returned for the auditable actions just performed, this is a finding.  If correct values for User Host and Terminal are not returned when applicable, this is a finding."
	tag "fix": "
Configure the DBMS's auditing to audit standard and organization-defined auditable events, the audit record to include where the event occurred. If preferred, use a third-party or custom tool.

If using a third-party product, proceed in accordance with the product documentation. If using Oracle's capabilities, proceed as follows.

Use this query to ensure auditable events are captured:
ALTER SYSTEM SET AUDIT_TRAIL=<audit trail type> SCOPE=SPFILE;
Audit trail type can be 'OS', 'DB', 'DB,EXTENDED', 'XML' or 'XML,EXTENDED'.
After executing this statement, it may be necessary to shut down and restart the Oracle database.

For more information on the configuration of auditing, please refer to "Auditing Database Activity" in the Oracle Database 2 Day + Security Guide:
http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_auditing.htm
and "Verifying Security Access with Auditing" in the Oracle Database Security Guide: http://docs.oracle.com/cd/E11882_01/network.112/e36292/auditing.htm#DBSEG006
and "27 DBMS_AUDIT_MGMT" in the Oracle Database PL/SQL Packages and Types Reference:
http://docs.oracle.com/cd/E11882_01/appdev.112/e40758/d_audit_mgmt.htm  
"

	# Write Check Logic Here

end