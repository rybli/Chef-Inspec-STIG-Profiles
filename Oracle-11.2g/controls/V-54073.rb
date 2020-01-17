# encoding: utf-8

control "V-54073" do
	title "The /diag subdirectory under the directory assigned to the DIAGNOSTIC_DEST parameter must be protected from unauthorized access."
	desc "/diag indicates the directory where trace, alert, core and incident directories and files are located. The files may contain sensitive data or information that could prove useful to potential attackers.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select value from v$parameter where name='diagnostic_dest';

On UNIX Systems:

ls -ld [pathname]/diag

Substitute [pathname] with the directory path listed from the above SQL command, and append "/diag" to it, as shown.

If permissions are granted for world access, this is a Finding.

If any groups that include members other than the Oracle process and software owner accounts, DBAs, auditors, or backup accounts are listed, this is a Finding.

On Windows Systems (From Windows Explorer):

Browse to the \diag directory under the directory specified.

Select and right-click on the directory, select Properties, select the Security tab.

If permissions are granted to everyone, this is a Finding.

If any account other than the Oracle process and software owner accounts, Administrators, DBAs, System group or developers authorized to write and debug applications on this database are listed, this is a Finding."
	tag "fix": "Alter host system permissions to the <DIAGNOSTIC_DEST>/diag directory to the Oracle process and software owner accounts, DBAs, SAs (if required) and developers or other users that may specifically require access for debugging or other purposes.

Authorize and document user access requirements to the directory outside of the Oracle, DBA and SA account list."

	# Write Check Logic Here

end