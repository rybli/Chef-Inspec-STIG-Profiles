# encoding: utf-8

control "V-52225" do
	title "The DBMS must limit the use of resources by priority and not impede the host from servicing processes designated as a higher-priority."
	desc "Priority protection helps prevent a lower-priority process from delaying or interfering with the information system servicing any higher-priority process. This control does not apply to components in the information system for which there is only a single user/role. The application must limit the use of resources by priority.

The DBMS is often running queries for multiple users. If lower-priority processes are utilizing a disproportionately high amount of database resources, this can severely impact higher-priority processes.false"
	impact 0.5
	tag "check": "Review DBMS settings and documentation to determine if the DBMS restricts resource usage by priority. If the DBMS does not restrict resource usage by priority, this is a finding.
- - - - -
This capability is available in Oracle at both the user and database level.  

At the user level, we create resource profiles for users of the database. 

Resource Parameters
SESSIONS_PER_USER            Specify the number of concurrent sessions to which you want to limit the user.
CPU_PER_SESSION              Specify the CPU time limit for a session, expressed in hundredths of seconds.
CPU_PER_CALL                 Specify the CPU time limit for a call (a parse, execute, or fetch), expressed in hundredths of seconds.
CONNECT_TIME                 Specify the total elapsed time limit for a session, expressed in minutes.
IDLE_TIME                    Specify the permitted periods of continuous inactive time during a session, expressed in minutes. Long-running queries and other operations are not subject to this limit.
LOGICAL_READS_PER_SESSION    Specify the permitted number of data blocks read in a session, including blocks read from memory and disk.
LOGICAL_READS_PER_CALL       Specify the permitted number of data blocks read for a call to process a SQL statement (a parse, execute, or fetch).
PRIVATE_SGA                  Specify the amount of private space a session can allocate in the shared pool of the system global area (SGA). 
COMPOSITE_LIMIT              Specify the total resource cost for a session, expressed in service units. 

To check the resource controls assigned to a user query the DBA_PROFILES and DBA_USERS tables in the following manner.

$ sqlplus connect as sysdba
SQL> select a.username, 
            a.profile, 
   b.resource_name, 
   b.limit
     from   dba_users a, 
         dba_profiles b
     where  b.resource_type is not null
     and a.profile = b.profile;

The output should look like the output below and display the users and the contents of their profiles.

USERNAME        PROFILE       RESOURCE NAME      LIMIT
--------        -------       -------------      -----
SCOTT           DEFAULT       SESSIONS_PER_USER  UNLIMITED
SCOTT           DEFAULT       CPU_PER_SESSION    UNLIMITED


At the Oracle Database layer, the QoS Management helps manage the resources that are shared by applications in a cluster. Oracle Database QoS Management can help identify and resolve performance bottlenecks. Oracle Database QoS Management does not diagnose or tune application or database performance issues. When tuning the performance of your applications, the goal is to achieve optimal performance. Oracle Database QoS Management does not seek to make your applications run faster, but instead works to remove obstacles that prevent your applications from running at their optimal performance levels.

Use the console to see if you can access the Oracle Database QoS Management Dashboard
To access the Dashboard, perform the following steps:
1. Log in to Oracle Enterprise Manager Database Control as the CRS Administrator user. Click the Cluster tab, if not selected.
2. Go to the Administration page, then click the Dashboard link under the heading Quality of Service Management to open the login screen for Oracle Database QoS Management.
3. A login screen appears, prompting you for the Oracle Database QoS Management administrator (QoSAdmin) credentials. After typing in the username and password, click Login.
4. The Quality of Service Management Dashboard page is displayed after the correct credentials are entered."
	tag "fix": "Implement measures to restrict the usage of resources by priority.
- - - - -
To implement security at the user level, assign users a profile that limits their resources:

Example

$ sqlplus connect as sysdba 

CREATE PROFILE app_user LIMIT
SESSIONS_PER_USER    1
IDLE_TIME           30
CPU_PER_SESSION    100
CPU_PER_CALL       100
CONNECT_TIME       600
IDLE_TIME          100;
CONNECT_TIME 600;


QoS Management Support for Oracle RAC Enterprise Edition
 
Oracle Database Quality of Service (QoS) Management allows system administrators to directly measure application service levels hosted on Oracle RAC Enterprise Edition databases. Using a policy-based architecture, QoS Management correlates accurate run-time performance and resource metrics based on user-defined workload classes. QoS Management then presents them in an integrated Enterprise Manager dashboard to review real-time performance of consolidated applications.  In conjunction with Cluster Health Monitor (CHM), QoS Management's memory guard detects nodes that are at risk of failure due to the overcommitment of memory. QoS Management responds by automatically preventing new connections thus preserving existing workloads, and restores connectivity once sufficient memory is available again.
 
Enable Oracle QoS Management at the Database Level
1. Log in to Oracle Enterprise Manager Database Control as the database administrator. If not selected, click the Database tab.

2. Go to the Availability page.

3. Under the heading Services, select Enable/Disable Quality Of Service Management. Enter the Cluster and Database credentials, then click Login.

The Enable/Disable QoS Management screen is displayed.

4. You are prompted to enter a password for the APPQOSSYS user. Choose a password and enter it in the Password and Confirm Password fields, click OK.
     When you provide a password, the following actions take place:
     The APPQOSSYS account, which enables the Oracle Database QoS Management server to connect to the database, is unlocked and the new password is set.

     The credentials are written to an Oracle Wallet stored in the Oracle Cluster Repository to enable Oracle Database QoS Management to log in to the database.

  APPQOS_PLAN is set as the active Oracle Database Resource Manager plan so that Oracle Database QoS Management can adjust CPU access for Performance
     Classes.  By default, the APPQOS_PLAN is replaced during the Oracle Scheduler maintenance window. Oracle recommends that you use the APPQOS_PLAN as the plan during those daily windows because this plan incorporates the consumer groups from the DEFAULT_MAINTENANCE_PLAN plan."

	# Write Check Logic Here

end