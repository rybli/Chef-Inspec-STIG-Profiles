# encoding: utf-8

control "V-52175" do
	title "Attempts to bypass access controls must be audited."
	desc "Information system auditing capability is critical for accurate forensic analysis. Audit record content that may be necessary to satisfy the requirement of this control includes:  timestamps, source and destination addresses, user/process identifiers, event descriptions, success/fail indications, file names involved, and access control or flow control rules invoked.

Detection of suspicious activity, including access attempts and successful access from unexpected places, during unexpected times, or other unusual indicators can support decisions to apply countermeasures to deter an attack. Without detection, malicious activity may proceed without hindrance.false"
	impact 0.5
	tag "check": "Review any audit settings for:
- Unsuccessful login attempts;
- Account locking events;
- Account disabling from a specific source location;
- Failed database object attempts or attempts to access objects that do not exist; and
- Other activities that may produce unexpected failures or trigger DBMS lockdown actions.

If any of the above events as applicable to the DBMS are not audited, this is a finding.

- - - - - -

Check the current users in the database to see what profile they are assigned.  The login attempts past a site-defined allowable number, along with account locking, is best performed using a profile that defines the limits on these activities as designed by the DBA at a specific site.  Failed database object access or attempt to access objects is monitored by auditing.  Checking other activities that may produce unexpected failures or trigger database lockdown procedures is possible, but the check for the existence of those procedures is not possible unless they are defined.

Check to see what profiles exist for the different users of the database.

SQL>col name format a20
    col username format a21
 col profile format a10
 col "tmp tba" format a10
    select u.username, 
        u.default_tablespace, 
     u.temporary_tablespace "TMP TBS", 
     u.profile,
        r.granted_role,
     r.admin_option,
     r.default_role
 from   sys.dba_users u,
        sys.dba_role_privs r
    where  u.username = r.grantee (+)
 group by u.username, 
          u.default_tablespace, 
    u.temporary tablespace,
    u.profile,
    r.granted_role,
    r.admin_option,
    r.default_role;
    
View existing profiles and see what their settings are.

SQL> select profile, resource_name, limit
     from dba_profiles
  order by profile, resource_name;
  
    
This is the audit table.  Specific actions are logged in this table.
SQL> desc aud$;
 Name                                      Null?    Type
 ----------------------------------------- -------- -----------------------
 SESSIONID                                 NOT NULL NUMBER
 ENTRYID                                   NOT NULL NUMBER
 STATEMENT                                 NOT NULL NUMBER
 TIMESTAMP#                                         DATE
 USERID                                             VARCHAR2(30)
 USERHOST                                           VARCHAR2(128)
 TERMINAL                                           VARCHAR2(255)
 ACTION#                                   NOT NULL NUMBER
 RETURNCODE                                NOT NULL NUMBER
 OBJ$CREATOR                                        VARCHAR2(30)
 OBJ$NAME                                           VARCHAR2(128)
 AUTH$PRIVILEGES                                    VARCHAR2(16)
 AUTH$GRANTEE                                       VARCHAR2(30)
 NEW$OWNER                                          VARCHAR2(30)
 NEW$NAME                                           VARCHAR2(128)
 SES$ACTIONS                                        VARCHAR2(19)
 SES$TID                                            NUMBER
 LOGOFF$LREAD                                       NUMBER
 LOGOFF$PREAD                                       NUMBER
 LOGOFF$LWRITE                                      NUMBER
 LOGOFF$DEAD                                        NUMBER
 LOGOFF$TIME                                        DATE
 COMMENT$TEXT                                       VARCHAR2(4000)
 CLIENTID                                           VARCHAR2(64)
 SPARE1                                             VARCHAR2(255)
 SPARE2                                             NUMBER
 OBJ$LABEL                                          RAW(255)
 SES$LABEL                                          RAW(255)
 PRIV$USED                                          NUMBER
 SESSIONCPU                                         NUMBER
 NTIMESTAMP#                                        TIMESTAMP(6)
 PROXY$SID                                          NUMBER
 USER$GUID                                          VARCHAR2(32)
 INSTANCE#                                          NUMBER
 PROCESS#                                           VARCHAR2(16)
 XID                                                RAW(8)
 AUDITID                                            VARCHAR2(64)
 SCN                                                NUMBER
 DBID                                               NUMBER
 SQLBIND                                            CLOB
 SQLTEXT                                            CLOB
 OBJ$EDITION                                        VARCHAR2(30)"
	tag "fix": "Configure auditing to capture the events listed below where available in the DBMS:
- Unsuccessful login attempts
- Account locking events
- Account disabling from a specific source location
- Failed database object attempts or attempts to access objects that do not exist
- Other activities that may produce unexpected failures or trigger DBMS lockdown actions

- - - - -

Oracle provides the $ORACLE_HOME/rdbms/admin/secconf.sql script.  If any of the site-specific requirements are not met with this script, check the Oracle(R) Database SQL Language Reference, 11g Release 2 (11.2), part number E41084-02, for additional audit options.  The secconf.sql script has many options already deployed, but there are additional options that can be invoked."

	# Write Check Logic Here

end