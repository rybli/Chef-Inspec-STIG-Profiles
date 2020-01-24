# encoding: utf-8

control "V-52251" do
	title "DBMS backup and restoration files must be protected from unauthorized access."
	desc "Information system backup is a critical step in maintaining data assurance and availability. 

User-level information is data generated by information system and/or application users. In order to assure availability of this data in the event of a system failure, DoD organizations are required to ensure user-generated data is backed up at a defined frequency. This includes data stored on file systems, within databases or within any other storage media.

Applications performing backups must be capable of backing up user-level information per the DoD-defined frequency.

Lost or compromised DBMS backup and restoration files may lead to not only the loss of data, but also the unauthorized access to sensitive data. Backup files need the same protections against unauthorized access when stored on backup media as when online and actively in use by the database system. In addition, the backup media needs to be protected against physical loss. Most DBMS's maintain online copies of critical control files to provide transparent or easy recovery from hard disk loss or other interruptions to database operation.false"
	impact 0.5
	tag "check": "Review file protections assigned to online backup and restoration files. Review access protections and procedures for offline backup and restoration files. If backup or restoration files are subject to unauthorized access, this is a finding.

It may be necessary to review backup and restoration procedures to determine ownership and access during all phases of backup and recovery."
	tag "fix": "Implement protection for backup and restoration files. Document personnel and the level of access authorized for each to the backup and restoration files in the system documentation."

	# Write Check Logic Here

end