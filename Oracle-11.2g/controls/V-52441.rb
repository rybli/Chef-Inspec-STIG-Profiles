# encoding: utf-8

control "V-52441" do
	title "Database software directories, including DBMS configuration files, must be stored in dedicated directories, or DASD pools, separate from the host OS and other applications."
	desc "When dealing with change control issues, it should be noted, any changes to the hardware, software, and/or firmware components of the information system and/or application can potentially have significant effects on the overall security of the system. 

Multiple applications can provide a cumulative negative effect. A vulnerability and subsequent exploit to one application can lead to an exploit of other applications sharing the same security context. For example, an exploit to a web server process that leads to unauthorized administrative access to host system directories can most likely lead to a compromise of all applications hosted by the same system. Database software not installed using dedicated directories both threatens and is threatened by other hosted applications. Access controls defined for one application may by default provide access to the other application's database objects or directories. Any method that provides any level of separation of security context assists in the protection between applications.false"
	impact 0.5
	tag "check": "Review the DBMS software library directory and note other root directories located on the same disk directory or any subdirectories. If any non-DBMS software directories exist on the disk directory, examine or investigate their use. If any of the directories are used by other applications, including third-party applications that use the DBMS, this is a finding.

Only applications that are required for the functioning and administration, not use, of the DBMS should be located on the same disk directory as the DBMS software libraries.

For databases located on mainframes, confirm that the database and its configuration files are isolated in their own DASD pools. If database software and database configuration files share DASD with other applications, this is a finding."
	tag "fix": "Install all applications on directories, or pools, separate from the DBMS software library directory. Re-locate any directories or re-install other application software that currently shares the DBMS software library directory to separate directories.

For mainframe-based databases, locate database software and configuration files in separate DASD pools from other mainframe applications."

	# Write Check Logic Here

end