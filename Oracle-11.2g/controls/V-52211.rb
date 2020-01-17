# encoding: utf-8

control "V-52211" do
	title "The DBMS must protect audit data records and integrity by using cryptographic mechanisms."
	desc "Protection of audit records and audit data is of critical importance. Cryptographic mechanisms are the industry-established standard used to protect the integrity of audit data. An example of a cryptographic mechanism is the computation and application of a cryptographic-signed hash using asymmetric cryptography. 

Non-repudiation protects individuals against later claims by an author of not having performed a particular action, a sender of not having transmitted a message, a receiver of not having received a message, or a signatory of not having signed a document.true"
	impact 0.5
	tag "check": "
Review DBMS settings to determine whether the DBMS is using cryptographic mechanisms to protect audit data records and integrity. If cryptographic mechanisms are not used, this is a finding.

- - - - -

Check to see if auditing is turned on. To see if Oracle is configured to capture audit data, enter the following SQLPlus command:
SHOW PARAMETER AUDIT_TRAIL
or the following SQL query:
SELECT * FROM SYS.V$PARAMETER WHERE NAME = 'audit_trail';
If Oracle returns the value 'NONE', this is a finding.

- - - - -

For file-based auditing (OS, XML or XML,EXTENDED), review operating system/file system settings to verify that encryption is in effect for the audit file.

- - - - -

For table-based auditing (DB or DB,EXTENDED), proceed as follows.

SQL> SELECT table_name, tablespace_name FROM dba_tables WHERE table_name ='AUD$';

TABLE_NAME TABLESPACE_NAME
-------------- ------------------------------
AUD$ SYSTEM

Now we know what auditing is set to and the tablespace auditing is deployed in.

Now we can check to see if the tablespace the AUD$ table is located in is encrypted by querying DBA_TABLESPACES. When prompted, use the tablespace name listed above.

SQL> set linesize 121
SQL> col tablespace_name format a20
SQL> col encrypted format a3
SQL> select tablespace_name, encrypted from dba_tablespaces where tablespace_name = '&tablespace_name';
The following data dictionary views maintain information about the encryption status of a tablespace. You can query these views to verify that a tablespace has been encrypted.

If the tablespace containing the AUD$ table is not encrypted, this is a finding.
"
	tag "fix": "Configure Oracle to use cryptographic mechanisms to protect audit data records and integrity.

- - - - -

Use this query to ensure auditable events are captured:
ALTER SYSTEM SET AUDIT_TRAIL=<audit trail type> SCOPE=SPFILE;
Audit trail type can be 'OS', 'DB', 'DB,EXTENDED', 'XML' or 'XML,EXTENDED'.
After executing this statement, it is necessary to shut down and restart the Oracle database.

- - - - -

For file-based auditing (OS, XML or XML,EXTENDED), implement operating system/file system encryption for the audit file.

- - - - -

Caution: Do not attempt to encrypt Oracle internal objects such as SYSTEM, SYSAUX, UNDO, or TEMP tablespaces.  Oracle does not support this with TDE.  When moving AUD$ to a new tablespace, be aware that associated LOB objects will also need to be moved. Finally, when upgrading, the AUD$ table and LOBs will need to be moved back to the SYSTEM tablespace or the upgrade will fail.

For table-based auditing (DB or DB,EXTENDED), proceed as follows.

- - - - -

Next we create an encrypted tablespace. Before you can encrypt or decrypt tablespaces, you must generate or set a master encryption key. The tablespace master encryption key is stored in an external security module and is used to encrypt the TDE tablespace encryption keys.

Check to ensure that the ENCRYPTION_WALLET_LOCATION (or WALLET_LOCATION) parameter in the sqlnet.ora file points to the correct software wallet location. (Note: This assumes that a single sqlnet.ora file, in the default location, is in use. Please see the supplemental file "Non-default sqlnet.ora configurations.pdf" for how to find multiple and/or differently located sqlnet.ora files.) For example:

ENCRYPTION_WALLET_LOCATION=
(SOURCE=(METHOD=FILE)(METHOD_DATA=
(DIRECTORY=/app/wallet)))

Oracle Database 11g Release 2 (11.2) uses the same master encryption key for both TDE column encryption and TDE tablespace encryption. When you issue the ALTER SYSTEM SET ENCRYPTION KEY command, a unified master encryption key is created for both TDE column encryption and TDE tablespace encryption.

Resetting the Tablespace Master Encryption Key

Oracle Database 11g Release 2 (11.2) uses a unified master encryption key for both TDE column encryption and TDE tablespace encryption. When you reset (rekey) the master encryption key for TDE column encryption, the master encryption key for TDE tablespace encryption also gets reset. The ALTER SYSTEM SET ENCRYPTION KEY command resets the tablespace master encryption key. Before you can create an encrypted tablespace, the Oracle wallet containing the tablespace master encryption key must be open. The wallet must also be open before you can access data in an encrypted tablespace. The security administrator needs to open the Oracle wallet after starting the Oracle instance. A restart of the Oracle instance requires the security administrator to open the wallet again. The security administrator also needs to open the wallet before performing database recovery operations. This is because background processes may require access to encrypted redo and undo logs. When performing database recovery, the wallet must be opened before opening the database. This is illustrated in the following statements:

SQL> STARTUP MOUNT;
SQL> ALTER SYSTEM SET ENCRYPTION WALLET OPEN IDENTIFIED BY "password";
SQL> ALTER DATABASE OPEN;

You can also choose to use auto login wallets, if your environment does not require the extra security provided by a wallet that needs to be explicitly opened. However, this is not the recommended practice.

Creating an Encrypted Tablespace

The CREATE TABLESPACE command enables you to create an encrypted tablespace. The permanent_tablespace_clause enables you to choose the encryption algorithm and the key length for encryption. The ENCRYPT keyword in the storage_clause encrypts the tablespace. The following syntax illustrates this:

CREATE
[ BIGFILE | SMALLFILE ]
{ permanent_tablespace_clause
| temporary_tablespace_clause
| undo_tablespace_clause
} ;

Where, permanent_tablespace_clause=TABLESPACE , ENCRYPTION [USING algorithm] storage_clause
Where, storage_clause=[ENCRYPT] where:
The encryption algorithm can have one of the following values:

3DES168
AES128
AES192
AES256

The key lengths are included in the names of the algorithms themselves. If no encryption algorithm is specified, the default encryption algorithm is used. The default encryption algorithm is AES128.
Note: The ENCRYPTION keyword in the permanent_tablespace_clause is used to specify the encryption algorithm. The ENCRYPT keyword in the storage_clause actually encrypts the tablespace. For security reasons, a tablespace cannot be encrypted with the NO SALT option.


Commands to create Encrypted Tablespace

CREATE TABLESPACE securespace
DATAFILE '/home/user/oradata/secure01.dbf'
SIZE 150M
ENCRYPTION USING '3DES168'
DEFAULT STORAGE(ENCRYPT);

This creates a tablespace called securespace2 using an algorithm of 3DES168.

You cannot encrypt an existing tablespace. However, you can import data into an encrypted tablespace using the Oracle Data Pump utility. You can also use SQL commands like CREATE TABLE...AS SELECT...or ALTER TABLE...MOVE... to move data into an encrypted tablespace. The CREATE TABLE...AS SELECT... command enables you to create a table from an existing table. The ALTER TABLE...MOVE... command enables you to move a table into the encrypted tablespace.

Then we move the sys.aud$ from system tablespace to securespace tablespace.

SQL> exec DBMS_AUDIT_MGMT.SET_AUDIT_TRAIL_LOCATION(audit_trail_type => DBMS_AUDIT_MGMT.AUDIT_TRAIL_AUD_STD, audit_trail_location_value => 'securespace');

PL/SQL procedure successfully completed.

Then check the tablespace the table is stored in.

SQL> SELECT table_name, tablespace_name FROM dba_tables WHERE table_name ='AUD$';

TABLE_NAME TABLESPACE_NAME
------------------------------ ------------------------------
AUD$ SECURESPACE "

	# Write Check Logic Here

end