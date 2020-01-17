# encoding: utf-8

control "V-54013" do
	title "The directories assigned to the LOG_ARCHIVE_DEST* parameters must be protected from unauthorized access."
	desc "The LOG_ARCHIVE_DEST parameter is used to specify the directory to which Oracle archive logs are written. Where the DBMS availability and recovery to a specific point in time is critical, the protection of archive log files is critical. Archive log files may also contain unencrypted sensitive data. If written to an inadequately protected or invalidated directory, the archive log files may be accessed by unauthorized persons or processes.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select log_mode from v$database;
select value from v$parameter where name = 'log_archive_dest';
select value from v$parameter where name = 'log_archive_duplex_dest';
select name, value from v$parameter where name LIKE 'log_archive_dest_%';

If the value returned for LOG_MODE is NOARCHIVELOG, this check is Not a Finding.

If a value is not returned for LOG_ARCHIVE_DEST and no values are returned for any of the LOG_ARCHIVE_DEST_[1-10] parameters, this is a Finding.

NOTE: LOG_ARCHIVE_DEST and LOG_ARCHIVE_DUPLEX_DEST are incompatible with the LOG_ARCHIVE_DEST_n parameters, and must be defined as the null string (' ') when any LOG_ARCHIVE_DEST_n parameter has a value other than a null string.

On UNIX Systems:

ls -ld [pathname]

Substitute [pathname] with the directory paths listed from the above SQL statements for log_archive_dest and log_archive_duplex_dest.

If permissions are granted for world access, this is a Finding.

On Windows Systems (From Windows Explorer):

Browse to the directory specified.

Select and right-click on the directory, select Properties, select the Security tab.

If permissions are granted to everyone, this is a Finding.

If any account other than the Oracle process and software owner accounts, Administrators, DBAs, System group or developers authorized to write and debug applications on this database are listed, this is a Finding."
	tag "fix": "Specify a valid and protected directory for archive log files.

Restrict access to the Oracle process and software owner accounts, DBAs, and backup operator accounts."

	# Write Check Logic Here

end