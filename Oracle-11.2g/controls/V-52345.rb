# encoding: utf-8

control "V-52345" do
	title "The DBMS must ensure remote sessions that access an organization-defined list of security functions and security-relevant information are audited."
	desc "Remote access is any access to an organizational information system by a user (or an information system) communicating through an external, non-organization-controlled network (e.g., the Internet). Examples of remote access methods include dial-up, broadband, and wireless.

Remote network and system access is accomplished by leveraging common communication protocols to establish a remote connection. These connections will typically originate over either the public Internet or the Public Switched Telephone Network (PSTN). Neither of these internetworking mechanisms is private or secure and they do not by default restrict access to networked resources once connectivity is established.
  
Numerous best practices are employed to protect remote connections, such as utilizing encryption to protect data sessions and firewalls to restrict and control network connectivity. In addition to these protections, auditing must also be utilized in order to track system activity, assist in diagnosing system issues, and provide evidence needed for forensic investigations after a security incident.
  
When organizations define security-related application functions or security-related application information, it is incumbent upon the application providing access to that data to ensure auditing of remote connectivity to those resources occurs in support of organizational requirements.
 
Remote access to security functions (e.g., user management, audit log management, etc.) and security-relevant information requires the activity be audited by the organization. Any application providing remote access must support organizational requirements to audit access or organization-defined security functions and security-relevant information.

Database security features accessed through remote methods must be audited to ensure the access is authorized and appropriate.true"
	impact 0.5
	tag "check": "Verify, using vendor and system documentation if necessary, that the DBMS is configured to use Oracle's auditing features, or that a third-party product or custom code is deployed and configured to satisfy this requirement.

If a third-party product or custom code is used, compare its current configuration with the audit requirements. If any of the requirements is not covered by the configuration, this is a finding.

The remainder of this Check is applicable specifically where Oracle auditing is in use.

To see if Oracle is configured to capture audit data, enter the following SQL*Plus command:
SHOW PARAMETER AUDIT_TRAIL
or the following SQL query:
SELECT * FROM SYS.V$PARAMETER WHERE NAME = 'audit_trail';
If Oracle returns the value 'NONE', this is a finding.

To confirm that Oracle audit is capturing information on the required events, review the contents of the SYS.AUD$ table or the audit file, whichever is in use. If auditable events are not listed, this is a finding."
	tag "fix": "Configure the DBMS's auditing to audit organization-defined auditable events. If preferred, use a third-party tool. The tool must provide the minimum capability to audit the required events.

If using a third-party product, proceed in accordance with the product documentation. If using Oracle's capabilities, proceed as follows.

Use this process to ensure auditable events are captured:
ALTER SYSTEM SET AUDIT_TRAIL=<audit trail type> SCOPE=SPFILE;
Audit trail type can be 'OS', 'DB', 'DB,EXTENDED', 'XML' or 'XML,EXTENDED'.
After executing this statement, it may be necessary to shut down and restart the Oracle database.

If the site-specific audit requirements are not covered by the default audit options, deploy and configure Fine-Grained Auditing. For details, refer to Oracle documentation at the locations below.

For more information on the configuration of auditing, refer to the following document: https://docs.oracle.com/cd/E25054_01/network.1111/e16543/auditing.htm 

If the site-specific audit requirements are not covered by the default audit options, deploy and configure Fine-Grained Auditing. For details, refer to Oracle documentation at the location above."

	# Write Check Logic Here

end