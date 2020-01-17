# encoding: utf-8

control "V-52219" do
	title "The DBMS must support enforcement of logical access restrictions associated with changes to the DBMS configuration and to the database itself."
	desc "When dealing with access restrictions pertaining to change control, it should be noted any changes to the hardware, software, and/or firmware components of the information system and/or application can have significant effects on the overall security of the system. 

Accordingly, only qualified and authorized individuals must be allowed to obtain access to application components for the purposes of initiating changes, including upgrades and modifications. 

Modifications to the DBMS settings, the database files, database configuration files, or the underlying database application files themselves could have catastrophic consequences to the database.  Modification to DBMS settings could include turning off access controls to the database, the halting of archiving, the halting of auditing, and any number of other malicious actions.
false"
	impact 0.5
	tag "check": "Review DBMS settings and vendor documentation to ensure the database supports and does not interfere with enforcement of logical access restrictions associated with changes to the DBMS configuration and to the database itself. If the DBMS software in any way restricts the implementation of logical access controls implemented to protect its integrity or availability, this is a finding."
	tag "fix": "Configure the DBMS to allow implementation of logical access restrictions aimed at protecting the DBMS from unauthorized changes to its configuration and to the database itself.

- - - - -

When the Oracle Database is installed on a Unix-like operating system, the required umask is 022, and the file permissions are set so that any modifications to the startup files can only be performed by the owner of the software, a member of the group DBA  or the root user. Changing the umask has caused problems when patching the environment.  If changes are to be made, they should be reverted to the status they were in before the modification for patching and upgrades."

	# Write Check Logic Here

end