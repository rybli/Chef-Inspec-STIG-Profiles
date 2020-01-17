# encoding: utf-8

control "V-52449" do
	title "The DBMS must have allocated audit record storage capacity."
	desc "Applications need to be cognizant of potential audit log storage capacity issues. During the installation and/or configuration process, applications should detect and determine if adequate storage capacity has been allocated for audit logs.  

During the installation process, a notification may be provided to the installer indicating, based on the auditing configuration chosen and the amount of storage space allocated for audit logs, the amount of storage capacity available is not sufficient to meet storage requirements.

When insufficient space in directories is allocated for audit records, database audit logs can fill up and begin to overwrite earlier logs, database activity can stop altogether, or auditing could fail and crucial tracking data could be lost.false"
	impact 0.5
	tag "check": "Review the DBMS settings to determine whether audit logging is configured to produce logs consistent with the amount of space allocated for logging. If auditing will generate excessive logs so that they may outgrow the space reserved for logging, this is a finding.

Oracle Auditing does not write to a log file.  The audit logs are written to a table called AUD$, and if a Virtual Private Database is deployed, we also create a table called FGA_LOG$.  First check the current location of the audit trail tables.

    CONN / AS SYSDBA

    SELECT table_name, tablespace_name
    FROM   dba_tables
    WHERE  table_name IN ('AUD$', 'FGA_LOG$')
    ORDER BY table_name;

    TABLE_NAME                     TABLESPACE_NAME
    ------------------------------ ------------------------------
    AUD$                           SYSTEM
    FGA_LOG$                       SYSTEM

If the tablespace name is SYSTEM, the table needs to be relocated to its own tablespace."
	tag "fix": "Ensure that the audit logging tables are in their own tablespaces, and that the tablespaces have enough room for the volume of log data that will be produced."

	# Write Check Logic Here

end