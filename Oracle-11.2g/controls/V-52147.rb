# encoding: utf-8

control "V-52147" do
	title "The DBMS must isolate security functions from non-security functions by means of separate security domains."
	desc "Security functions are defined as "the hardware, software, and/or firmware of the information system responsible for enforcing the system security policy and supporting the isolation of code and data on which the protection is based".

Developers and implementers can increase the assurance in security functions by employing well-defined security policy models, structured, disciplined, and rigorous hardware and software development techniques, and sound system/security engineering principles.

Database Management Systems typically separate security functionality from non-security functionality via separate databases or schemas. Database objects or code implementing security functionality should not be commingled with objects or code implementing application logic. When security and non-security functionality is commingled, users who have access to non-security functionality may be able to access security functionality.false"
	impact 0.5
	tag "check": "Check DBMS settings to determine whether objects or code implementing security functionality are located in a separate security domain, such as a separate database or schema created specifically for security functionality. If security-related database objects or code are not kept separate, this is a finding.

The Oracle elements of security functionality such as the roles, permissions and profiles along with password complexity requirements are stored in separate schemas in the database.  Review any site-specific applications security modules built into the database and determine what schema they are located in and take appropriate action.  The Oracle objects will be in the Oracle Data Dictionary."
	tag "fix": "Locate security-related database objects and code in a separate database, schema, or other separate security domain from database objects and code implementing application logic.  (This is the default behavior for Oracle.)  Review any site-specific applications security modules built into the database:   determine what schema they are located in and take appropriate action."

	# Write Check Logic Here

end