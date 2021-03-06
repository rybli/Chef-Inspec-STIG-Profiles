# encoding: utf-8

control "V-52247" do
	title "Database backup procedures must be defined, documented, and implemented."
	desc "Information system backup is a critical step in maintaining data assurance and availability. 

User-level information is data generated by information system and/or application users. In order to assure availability of this data in the event of a system failure, DoD organizations are required to ensure user-generated data is backed up at a defined frequency. This includes data stored on file systems, within databases or within any other storage media.

Applications performing backups must be capable of backing up user-level information per the DoD-defined frequency.

Database backups provide the required means to restore databases after compromise or loss. Backups help reduce the vulnerability to unauthorized access or hardware loss.false"
	impact 0.5
	tag "check": "Review the database backup procedures and implementation evidence. Evidence of implementation includes records of backup events and physical review of backup media.

Evidence should match the backup plan as recorded in the system documentation. If backup procedures do not exist or are not implemented in accordance with the procedures, this is a finding.

- - - - -

The Oracle recommended process for backup and recovery is Oracle RMAN.  If Oracle RMAN is deployed, execute the following commands to ensure that the evidence of the implementation of the backup policy includes validating that the files are restorable:

Validating Database Files with BACKUP VALIDATE
 --You can use the BACKUP VALIDATE command to do the following:
    --     Check datafiles for physical and logical block corruption
    --     Confirm that all database files exist and are in the correct locations
 --When you run BACKUP VALIDATE, RMAN reads the files to be backed up in their entirety, as it would during a real backup. RMAN does not, however, actually produce any backup sets or image copies.
--You cannot use the BACKUPSET, MAXCORRUPT, or PROXY parameters with BACKUP VALIDATE. 
--To validate files with the BACKUP VALIDATE command:
     1. Start RMAN and connect to a target database and recovery catalog (if used).
     2. Run the BACKUP VALIDATE command.
        For example, you can validate that all database files and archived logs can be backed up by running a command as shown in the following example. This command checks for physical corruptions only.
        BACKUP VALIDATE
          DATABASE
          ARCHIVELOG ALL;
      To check for logical corruptions in addition to physical corruptions, run the  following variation of the preceding command:
        BACKUP VALIDATE
          CHECK LOGICAL
          DATABASE
          ARCHIVELOG ALL;
   In the preceding examples, the RMAN client displays the same output that it would if it were really backing up the files. If RMAN cannot back up one or more of the files, then it issues an error message. 
Validating Backups Before Restoring Them
   
   You can run RESTORE ... VALIDATE to test whether RMAN can restore a specific file or set of files from a backup. RMAN chooses which backups to use. The database must be mounted or open for this command. You do not have to take datafiles offline when validating the restore of datafiles, because validation of backups of the datafiles only reads the backups and does not affect the production datafiles. When validating files on disk or tape, RMAN reads all blocks in the backup piece or image copy. RMAN also validates offsite backups. The validation is identical to a real restore operation except that RMAN does not write output files.
   
   To validate backups with the RESTORE command:
     1. Run the RESTORE command with the VALIDATE option.
        This following example illustrates validating the restore of the database and all archived redo logs:
        RESTORE DATABASE VALIDATE;
          RESTORE ARCHIVELOG ALL VALIDATE;

  If you do not see an RMAN error stack, then skip the subsequent steps. The lack of error messages means that RMAN had confirmed that it can use these backups successfully during a real restore and recovery.

 2. If you see error messages in the output and the RMAN-06026 message, then investigate the cause of the problem. If possible, correct the problem that is preventing RMAN from validating the backups and retry the validation. The following error means that RMAN cannot restore one or more of the specified files from your available backups:

    RMAN-06026: some targets not found - aborting restore
       The following sample output shows that RMAN encountered a problem reading the specified backup:
       RMAN-03009: failure of restore command on c1 channel at 12-DEC-06 23:22:30
       ORA-19505: failed to identify file "oracle/dbs/1fafv9gl_1_1"
       ORA-27037: unable to obtain file status
       SVR4 Error: 2: No such file or directory
       Additional information: 3"
	tag "fix": "Develop, document, and implement database backup procedures."

	# Write Check Logic Here

end