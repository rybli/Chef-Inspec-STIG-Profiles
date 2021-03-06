# encoding: utf-8

control "V-52383" do
	title "Administrative privileges must be assigned to database accounts via database roles."
	desc "Applications employ the concept of least privilege for specific duties and information systems (including specific functions, ports, protocols, and services). The concept of least privilege is also applied to information system processes, ensuring that the processes operate at privilege levels no higher than necessary to accomplish required organizational missions and/or functions. Organizations consider the creation of additional processes, roles, and information system accounts as necessary to achieve least privilege. Organizations also apply least privilege concepts to the design, development, implementation, and operations of information systems.

Privileges granted outside the context of the application user job function are more likely to go unmanaged or without oversight for authorization. Maintenance of privileges using roles defined for discrete job functions offers improved oversight of application user privilege assignments and helps to protect against unauthorized privilege assignment.false"
	impact 0.5
	tag "check": "Review accounts for direct assignment of administrative privilege.  Connected as SYSDBA, run the query:

SELECT grantee, privilege
FROM   dba_sys_privs
WHERE  grantee IN 
(
SELECT username
FROM   dba_users
WHERE  username NOT IN 
(
'XDB', 'SYSTEM', 'SYS', 'LBACSYS',
'DVSYS', 'DVF', 'SYSMAN_RO',
'SYSMAN_BIPLATFORM', 'SYSMAN_MDS',
'SYSMAN_OPSS', 'SYSMAN_STB', 'DBSNMP',
'SYSMAN', 'APEX_040200', 'WMSYS',
'SYSDG', 'SYSBACKUP', 'SPATIAL_WFS_ADMIN_USR',
'SPATIAL_CSW_ADMIN_US', 'GSMCATUSER',
'OLAPSYS', 'SI_INFORMTN_SCHEMA',
'OUTLN', 'ORDSYS', 'ORDDATA', 'OJVMSYS',
'ORACLE_OCM', 'MDSYS', 'ORDPLUGINS',
'GSMADMIN_INTERNAL', 'MDDATA', 'FLOWS_FILES',
'DIP', 'CTXSYS', 'AUDSYS',
'APPQOSSYS', 'APEX_PUBLIC_USER', 'ANONYMOUS',
'SPATIAL_CSW_ADMIN_USR', 'SYSKM',
'SYSMAN_TYPES', 'MGMT_VIEW',
'EUS_ENGINE_USER', 'EXFSYS', 'SYSMAN_APM'
)
)
AND privilege NOT IN ('UNLIMITED TABLESPACE')
ORDER  BY 1, 2;

If any administrative privileges have been assigned directly to a database account, this is a finding.

(The list of special accounts that are excluded from this requirement may not be complete.  It is expected that the DBA will edit the list to suit local circumstances, adding other special accounts as necessary, and removing any that are not supposed to be in use in the Oracle deployment that is under review.)"
	tag "fix": "Create roles for administrative function assignments. Assign the necessary privileges for the administrative functions to a role."

	# Write Check Logic Here

end