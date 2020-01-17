# encoding: utf-8

control "V-52427" do
	title "Database software, applications, and configuration files must be monitored to discover unauthorized changes."
	desc "Any changes to the hardware, software, and/or firmware components of the information system and/or application can potentially have significant effects on the overall security of the system.

If the system were to allow any user to make changes to software libraries, then those changes might be implemented without undergoing the appropriate testing and approvals that are part of a robust change management process.

Accordingly, only qualified and authorized individuals shall be allowed to obtain access to information system components for purposes of initiating changes, including upgrades and modifications.

Unmanaged changes that occur to the database software libraries or configuration can lead to unauthorized or compromised installations.false"
	impact 0.5
	tag "check": "Review monitoring procedures and implementation evidence to verify that monitoring of changes to database software libraries, related applications, and configuration files is done.

Verify that the list of files and directories being monitored is complete. If monitoring does not occur or is not complete, this is a finding."
	tag "fix": "Implement procedures to monitor for unauthorized changes to DBMS software libraries, related software application libraries, and configuration files. If a third-party automated tool is not employed, an automated job that reports file information on the directories and files of interest and compares them to the baseline report for the same will meet the requirement.

File hashes or checksums should be used for comparisons since file dates may be manipulated by malicious users. "

	# Write Check Logic Here

end