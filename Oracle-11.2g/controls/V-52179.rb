# encoding: utf-8

control "V-52179" do
	title "The DBMS must protect audit information from any type of unauthorized access."
	desc "If audit data were to become compromised, then competent forensic analysis and discovery of the true source of potentially malicious system activity is difficult, if not impossible, to achieve. In addition, access to audit records provides information an attacker could potentially use to his or her advantage.

To ensure the veracity of audit data, the information system and/or the application must protect audit information from any and all unauthorized access. This includes read, write, copy, etc.

This requirement can be achieved through multiple methods which will depend upon system architecture and design. Some commonly employed methods include ensuring log files enjoy the proper file system permissions utilizing file system protections and limiting log data location. 

Additionally, applications with user interfaces to audit records must not allow for the unfettered manipulation of or access to those records via the application. If the application provides access to the audit data, the application becomes accountable for ensuring that audit information is protected from unauthorized access.

Audit information includes all information (e.g., audit records, audit settings, and audit reports) needed to successfully audit information system activity.false"
	impact 0.5
	tag "check": "Review locations of audit logs, both internal to the database and database audit logs located at the operating system-level. Verify there are appropriate controls and permissions to protect the audit information from unauthorized access. If appropriate controls and permissions do not exist, this is a finding.

- - - - -

DBA_TAB_PRIVS describes all object grants in the database.  Check to see who has permissions on the AUD$ table.  

Related View

DBA_TAB_PRIVS describes the object grants for which the current user is the object owner, grantor, or grantee.
Column      Datatype      NULL      Description
GRANTEE  VARCHAR2(30)  NOT NULL  Name of the user to whom access was granted
OWNER      VARCHAR2(30)  NOT NULL  Owner of the object
TABLE_NAME  VARCHAR2(30)  NOT NULL  Name of the object
GRANTOR  VARCHAR2(30)  NOT NULL  Name of the user who performed the grant
PRIVILEGE  VARCHAR2(40)  NOT NULL  Privilege on the object
GRANTABLE  VARCHAR2(3)             Indicates whether the privilege was granted with the GRANT OPTION (YES) or not (NO)
HIERARCHY  VARCHAR2(3)             Indicates whether the privilege was granted with the HIERARCHY OPTION (YES) or not (NO)

sqlplus connect as sysdba;
SQL>  SELECT * FROM DBA_TAB_PRIVS where table_name = 'AUD$';
SQL>  SELECT * FROM DBA_COL_PRIVS where table_name = 'AUD$';"
	tag "fix": "Add controls and modify permissions to protect database audit log data from unauthorized access, whether stored in the database itself or at the OS level.

Revoke access to the AUD$ table to anyone who should not have access to it.
"

	# Write Check Logic Here

end