# encoding: utf-8

control "V-53969" do
	title "A minimum of two Oracle redo log groups/files must be defined and configured to be stored on separate, archived physical disks or archived directories on a RAID device."
	desc "The Oracle redo log files store the detailed information on changes made to the database. This information is critical to database recovery in case of a database failure.false"
	impact 0.5
	tag "check": "From SQL*Plus:

select count(*) from V$LOG;

If the value of the count returned is less than 2, this is a Finding.

From SQL*Plus:

select count(*) from V$LOG where members > 1;

If the value of the count returned is less than 2 and a RAID storage device is not being used, this is a Finding."
	tag "fix": "To define additional redo log file groups:

From SQL*Plus (Example):

alter database add logfile group 2
('diska:log2.log', 'diskb:log2.log') size 50K; 

To add additional redo log file [members] to an existing redo log file group:

From SQL*Plus (Example):

alter database add logfile member 'diskc:log2.log' to group 2;

Replace diska, diskb, diskc with valid, different disk drive specifications.

Replace log#.log file with valid or custom names for the log files."

	# Write Check Logic Here

end