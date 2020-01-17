# encoding: utf-8

control "V-52253" do
	title "DBMS must conduct  backups of system-level information per organization-defined frequency that is consistent with recovery time and recovery point objectives."
	desc "Information system backup is a critical step in maintaining data assurance and availability. 

System-level information includes:  system-state information, operating system and application software, and licenses. 

Backups shall be consistent with organizational recovery time and recovery point objectives. 

Databases that do not back up information regularly risk the loss of that information in the event of a system failure. Most databases contain functionality to allow regular backups; it is important that this functionality is enabled and configured correctly to prevent data loss.false"
	impact 0.5
	tag "check": "Review DBMS and OS backup configuration to determine that system-level data is backed up in according with organization-defined frequency.  If the system-level data of the DBMS is not backed up to the organization-defined frequency, this is a finding."
	tag "fix": "Utilize DBMS, OS or third-party product(s), to meet the requirement of backing up system data according to the organization-defined frequency."

	# Write Check Logic Here

end