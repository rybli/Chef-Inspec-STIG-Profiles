# encoding: utf-8

control "V-52379" do
	title "The DBMS must restrict access to system tables and other configuration information or metadata to DBAs or other authorized users."
	desc "Applications employ the concept of least privilege for specific duties and information systems (including specific functions, ports, protocols, and services). The concept of least privilege is also applied to information system processes, ensuring that the processes operate at privilege levels no higher than necessary to accomplish required organizational missions and/or functions. Organizations consider the creation of additional processes, roles, and information system accounts as necessary to achieve least privilege. Organizations also apply least privilege concepts to the design, development, implementation, and operations of information systems.

Administrative data includes DBMS metadata and other configuration and management data.  Unauthorized access to this data could result in unauthorized changes to database objects, access controls, or DBMS configuration.false"
	impact 0.5
	tag "check": "Review user privileges to system tables and configuration data stored in the Oracle database. If non-DBA users are assigned privileges to access system tables and tables containing configuration data, this is a finding.

To obtain a list of users and roles that have been granted access to any dictionary table, run the query:
SELECT unique grantee from dba_tab_privs where table_name in
(select table_name from dictionary)
order by grantee;

To obtain a list of dictionary tables and assigned privileges granted to a specific user or role, run the query:

SELECT grantee, table_name, privilege from dba_tab_privs where table_name in

(select table_name from dictionary)
and grantee = '<applicable account>';"
	tag "fix": "Restrict accessibility of Oracle system tables and other configuration information or metadata to DBAs or other authorized users."

	# Write Check Logic Here

end