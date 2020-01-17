# encoding: utf-8

control "V-52145" do
	title "The DBMS must employ cryptographic mechanisms preventing the unauthorized disclosure of information at rest."
	desc "This control is intended to address the confidentiality and integrity of information at rest in non-mobile devices. If the data is not encrypted, it is subject to compromise and unauthorized disclosure.false"
	impact 0.5
	tag "check": "Check DBMS settings to determine whether cryptographic mechanisms are used to prevent the unauthorized disclosure of information at rest.

If cryptographic mechanisms are not being utilized, this is a finding.

Oracle recommends using Transparent Data Encryption to protect data at rest.  

- - - - -
Caution: Do not attempt to encrypt Oracle internal objects such as SYSTEM, SYSAUX, UNDO, or TEMP tablespaces.  Oracle does not support this with TDE.
- - - - -

In order to check to see if the data is encrypted, for example, upon an auditor's request, Oracle provides views that document the encryption status of your database. For TDE column encryption, please use the view 'dba_encrypted_columns', which lists the owner, table name, column name, encryption algorithm, and salt, for all encrypted columns. For TDE tablespace encryption, the following SQL statement lists all encrypted tablespaces with their encryption algorithm and corresponding, encrypted, data files.  Issue the following commands to check to see if the data at rest is encrypted.

$ sqlplus connect as sysdba

SQL> SELECT t.name "TSName", 
            e.encryptionalg "Algorithm", 
   d.file_name "File Name" 
     FROM   v$tablespace t, 
         v$encrypted_tablespaces e, 
   dba_data_files d 
  WHERE  t.ts# = e.ts# 
  and    t.name = d.tablespace_name;

The next SQL statement lists the table owner, tables within encrypted tablespaces, and the encryption algorithm:

SQL> SELECT a.owner "Owner", 
            a.table_name "Table Name", 
   e.encryptionalg "Algorithm", 
  FROM   dba_tables a, 
         v$encrypted_tablespaces e 
  WHERE  a.tablespace_name in (select t.name from v$tablespace t, v$encrypted_tablespaces e where t.ts# = e.ts#);"
	tag "fix": "Configure DBMS to use cryptographic mechanisms to prevent unauthorized disclosure of information at rest.

Deploy Oracle Advanced Security option, a locally developed encryption system, or a third-party product to encrypt data at rest.

If ASO is not an option, use site-specific procedures to secure data at rest."

	# Write Check Logic Here

end